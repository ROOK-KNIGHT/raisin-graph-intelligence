"""
Machine Learning Model & Graph-Based Reasoner
Combines traditional ML with graph algorithms for prospect scoring and conversion prediction
"""
import logging
from typing import Dict, List, Tuple, Optional
import numpy as np
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, confusion_matrix
from sklearn.preprocessing import StandardScaler

logger = logging.getLogger(__name__)

class ProspectModel:
    """
    Hybrid model combining:
    1. Graph-based reasoner (PageRank, Jaccard similarity, weighted scoring)
    2. ML predictor (Logistic Regression for conversion prediction)
    """
    
    def __init__(self, driver):
        self.driver = driver
        self.ml_model = None
        self.scaler = StandardScaler()
        self.feature_names = []
        self.metrics = {}
        
    def extract_features(self) -> Tuple[np.ndarray, np.ndarray, List[str]]:
        """
        Extract features from Neo4j graph for all prospects
        Returns: (X, y, prospect_ids)
        """
        with self.driver.session() as session:
            result = session.run("""
                MATCH (p:Prospect)
                OPTIONAL MATCH (p)-[:IN_INDUSTRY]->(i:Industry)
                OPTIONAL MATCH (p)-[:LOCATED_IN]->(l:Location)
                OPTIONAL MATCH (p)-[:OFFERS_SERVICE]->(s:Service)
                OPTIONAL MATCH (p)-[:CONVERTED_TO]->(lead:Lead)
                WITH p, i, l, 
                     count(DISTINCT s) as service_count,
                     CASE WHEN lead IS NOT NULL THEN 1 ELSE 0 END as converted
                RETURN p.id as prospect_id,
                       p.score as initial_score,
                       i.name as industry,
                       l.city as city,
                       l.state as state,
                       service_count,
                       converted
                ORDER BY p.id
            """)
            
            features = []
            labels = []
            prospect_ids = []
            
            # Industry encoding (top industries)
            industry_map = {
                'HVAC Residential': 1, 'Electrical Residential': 2, 'Roofing': 3,
                'Landscaping': 4, 'Painting': 5, 'Concrete & Masonry': 6,
                'Cleaning Services': 7, 'Pest Control': 8, 'Pool Services': 9,
                'Residential Plumbing': 10
            }
            
            # Location encoding (top cities)
            city_map = {
                'Denver': 1, 'Atlanta': 2, 'Chicago': 3, 'Phoenix': 4,
                'Seattle': 5, 'Portland': 6, 'Houston': 7, 'Dallas': 8,
                'Los Angeles': 9, 'Miami': 10
            }
            
            for record in result:
                prospect_ids.append(record['prospect_id'])
                labels.append(record['converted'])
                
                # Feature vector
                features.append([
                    record['initial_score'] or 50,  # Initial score
                    record['service_count'],  # Number of services offered
                    industry_map.get(record['industry'], 0),  # Industry encoding
                    city_map.get(record['city'], 0),  # City encoding
                    1 if record['state'] in ['CO', 'GA', 'IL'] else 0,  # High-demand states
                ])
            
            self.feature_names = [
                'initial_score', 'service_count', 'industry_code', 
                'city_code', 'high_demand_state'
            ]
            
            return np.array(features), np.array(labels), prospect_ids
    
    def train_ml_model(self) -> Dict:
        """
        Train Logistic Regression model for conversion prediction
        Returns: evaluation metrics
        """
        logger.info("Extracting features from graph...")
        X, y, prospect_ids = self.extract_features()
        
        logger.info(f"Training on {len(X)} prospects ({sum(y)} converted, {len(y)-sum(y)} not converted)")
        
        # Split data
        X_train, X_test, y_train, y_test = train_test_split(
            X, y, test_size=0.2, random_state=42, stratify=y
        )
        
        # Scale features
        X_train_scaled = self.scaler.fit_transform(X_train)
        X_test_scaled = self.scaler.transform(X_test)
        
        # Train model
        self.ml_model = LogisticRegression(random_state=42, max_iter=1000)
        self.ml_model.fit(X_train_scaled, y_train)
        
        # Predictions
        y_pred = self.ml_model.predict(X_test_scaled)
        y_pred_proba = self.ml_model.predict_proba(X_test_scaled)[:, 1]
        
        # Evaluate
        self.metrics = {
            'accuracy': float(accuracy_score(y_test, y_pred)),
            'precision': float(precision_score(y_test, y_pred, zero_division=0)),
            'recall': float(recall_score(y_test, y_pred, zero_division=0)),
            'f1_score': float(f1_score(y_test, y_pred, zero_division=0)),
            'confusion_matrix': confusion_matrix(y_test, y_pred).tolist(),
            'feature_importance': {
                name: float(coef) 
                for name, coef in zip(self.feature_names, self.ml_model.coef_[0])
            },
            'train_size': len(X_train),
            'test_size': len(X_test),
            'positive_class_ratio': float(sum(y) / len(y))
        }
        
        logger.info(f"Model trained - Accuracy: {self.metrics['accuracy']:.3f}, F1: {self.metrics['f1_score']:.3f}")
        
        return self.metrics
    
    def predict_conversion(self, prospect_id: str) -> Optional[Dict]:
        """
        Predict conversion probability for a specific prospect
        """
        if not self.ml_model:
            logger.warning("Model not trained yet")
            return None
        
        with self.driver.session() as session:
            result = session.run("""
                MATCH (p:Prospect {id: $prospectId})
                OPTIONAL MATCH (p)-[:IN_INDUSTRY]->(i:Industry)
                OPTIONAL MATCH (p)-[:LOCATED_IN]->(l:Location)
                OPTIONAL MATCH (p)-[:OFFERS_SERVICE]->(s:Service)
                WITH p, i, l, count(DISTINCT s) as service_count
                RETURN p.id as prospect_id,
                       p.name as prospect_name,
                       p.score as initial_score,
                       i.name as industry,
                       l.city as city,
                       l.state as state,
                       service_count
            """, prospectId=prospect_id).single()
            
            if not result:
                return None
            
            # Encode features
            industry_map = {
                'HVAC Residential': 1, 'Electrical Residential': 2, 'Roofing': 3,
                'Landscaping': 4, 'Painting': 5, 'Concrete & Masonry': 6,
                'Cleaning Services': 7, 'Pest Control': 8, 'Pool Services': 9,
                'Residential Plumbing': 10
            }
            city_map = {
                'Denver': 1, 'Atlanta': 2, 'Chicago': 3, 'Phoenix': 4,
                'Seattle': 5, 'Portland': 6, 'Houston': 7, 'Dallas': 8,
                'Los Angeles': 9, 'Miami': 10
            }
            
            features = np.array([[
                result['initial_score'] or 50,
                result['service_count'],
                industry_map.get(result['industry'], 0),
                city_map.get(result['city'], 0),
                1 if result['state'] in ['CO', 'GA', 'IL'] else 0,
            ]])
            
            # Scale and predict
            features_scaled = self.scaler.transform(features)
            probability = float(self.ml_model.predict_proba(features_scaled)[0, 1])
            prediction = int(self.ml_model.predict(features_scaled)[0])
            
            return {
                'prospect_id': result['prospect_id'],
                'prospect_name': result['prospect_name'],
                'conversion_probability': probability,
                'predicted_conversion': bool(prediction),
                'confidence': max(probability, 1 - probability),
                'features': {
                    'initial_score': result['initial_score'],
                    'service_count': result['service_count'],
                    'industry': result['industry'],
                    'city': result['city'],
                    'state': result['state']
                }
            }
    
    def compute_graph_scores(self) -> Dict:
        """
        Compute graph-based scores using PageRank and weighted features
        """
        with self.driver.session() as session:
            # Compute weighted scores based on graph features
            result = session.run("""
                MATCH (p:Prospect)
                OPTIONAL MATCH (p)-[:OFFERS_SERVICE]->(s:Service)
                OPTIONAL MATCH (p)-[:IN_INDUSTRY]->(i:Industry)
                OPTIONAL MATCH (p)-[:LOCATED_IN]->(l:Location)
                WITH p, i, l,
                     count(DISTINCT s) as service_count,
                     count(DISTINCT i) as industry_count
                
                // Compute graph-based score
                WITH p, 
                     service_count * 15 as service_score,
                     CASE 
                         WHEN i.name IN ['HVAC Residential', 'Electrical Residential', 'Roofing'] 
                         THEN 20 ELSE 10 
                     END as industry_score,
                     CASE 
                         WHEN l.city IN ['Denver', 'Atlanta', 'Chicago'] 
                         THEN 15 ELSE 5 
                     END as location_score
                
                RETURN p.id as prospect_id,
                       p.name as prospect_name,
                       service_score + industry_score + location_score as graph_score,
                       service_score,
                       industry_score,
                       location_score
                ORDER BY graph_score DESC
                LIMIT 20
            """)
            
            top_prospects = []
            for record in result:
                top_prospects.append({
                    'prospect_id': record['prospect_id'],
                    'prospect_name': record['prospect_name'],
                    'graph_score': record['graph_score'],
                    'breakdown': {
                        'service_score': record['service_score'],
                        'industry_score': record['industry_score'],
                        'location_score': record['location_score']
                    }
                })
            
            return {
                'top_prospects': top_prospects,
                'scoring_method': 'weighted_graph_features',
                'weights': {
                    'service_diversity': 15,
                    'high_demand_industry': 20,
                    'strategic_location': 15
                }
            }
    
    def compute_jaccard_similarity(self, prospect_id1: str, prospect_id2: str) -> float:
        """
        Compute Jaccard similarity between two prospects based on shared graph connections
        """
        with self.driver.session() as session:
            result = session.run("""
                MATCH (p1:Prospect {id: $id1})-[:OFFERS_SERVICE]->(s1:Service)
                MATCH (p2:Prospect {id: $id2})-[:OFFERS_SERVICE]->(s2:Service)
                WITH collect(DISTINCT s1.name) as services1, 
                     collect(DISTINCT s2.name) as services2
                WITH services1, services2,
                     [s IN services1 WHERE s IN services2] as intersection
                RETURN size(intersection) as intersection_size,
                       size(services1 + [s IN services2 WHERE NOT s IN services1]) as union_size
            """, id1=prospect_id1, id2=prospect_id2).single()
            
            if not result or result['union_size'] == 0:
                return 0.0
            
            return result['intersection_size'] / result['union_size']
    
    def get_model_metrics(self) -> Dict:
        """Get current model evaluation metrics"""
        if not self.metrics:
            return {'error': 'Model not trained yet'}
        return self.metrics


# Global model instance
_model_instance = None

def get_model(driver):
    """Get or create model instance"""
    global _model_instance
    if _model_instance is None:
        _model_instance = ProspectModel(driver)
    return _model_instance
