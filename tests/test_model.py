"""
Tests for ML Model & Graph Reasoner
"""
import pytest
from app.model import ProspectModel, get_model

def test_model_initialization(neo4j_driver):
    """Test model can be initialized"""
    model = ProspectModel(neo4j_driver)
    assert model is not None
    assert model.ml_model is None  # Not trained yet
    assert model.metrics == {}

def test_feature_extraction(neo4j_driver):
    """Test feature extraction from graph"""
    model = ProspectModel(neo4j_driver)
    X, y, prospect_ids = model.extract_features()
    
    assert len(X) > 0, "Should extract features"
    assert len(y) > 0, "Should extract labels"
    assert len(X) == len(y), "Features and labels should match"
    assert len(prospect_ids) == len(X), "Prospect IDs should match features"
    assert X.shape[1] == 5, "Should have 5 features"

def test_model_training(neo4j_driver):
    """Test ML model training"""
    model = ProspectModel(neo4j_driver)
    metrics = model.train_ml_model()
    
    assert 'accuracy' in metrics
    assert 'precision' in metrics
    assert 'recall' in metrics
    assert 'f1_score' in metrics
    assert 'confusion_matrix' in metrics
    assert 'feature_importance' in metrics
    
    assert 0 <= metrics['accuracy'] <= 1
    assert 0 <= metrics['f1_score'] <= 1
    assert model.ml_model is not None, "Model should be trained"

def test_conversion_prediction(neo4j_driver):
    """Test conversion prediction for a prospect"""
    model = ProspectModel(neo4j_driver)
    model.train_ml_model()
    
    # Test with a known prospect ID
    prediction = model.predict_conversion("P001")
    
    if prediction:  # Prospect exists
        assert 'prospect_id' in prediction
        assert 'conversion_probability' in prediction
        assert 'predicted_conversion' in prediction
        assert 'confidence' in prediction
        assert 0 <= prediction['conversion_probability'] <= 1
        assert isinstance(prediction['predicted_conversion'], bool)

def test_graph_scores(neo4j_driver):
    """Test graph-based scoring"""
    model = ProspectModel(neo4j_driver)
    scores = model.compute_graph_scores()
    
    assert 'top_prospects' in scores
    assert 'scoring_method' in scores
    assert 'weights' in scores
    assert len(scores['top_prospects']) > 0
    
    # Check first prospect has required fields
    top_prospect = scores['top_prospects'][0]
    assert 'prospect_id' in top_prospect
    assert 'graph_score' in top_prospect
    assert 'breakdown' in top_prospect

def test_jaccard_similarity(neo4j_driver):
    """Test Jaccard similarity computation"""
    model = ProspectModel(neo4j_driver)
    
    # Test similarity between two prospects
    similarity = model.compute_jaccard_similarity("P001", "P002")
    
    assert 0 <= similarity <= 1, "Jaccard similarity should be between 0 and 1"

def test_get_model_singleton(neo4j_driver):
    """Test model singleton pattern"""
    model1 = get_model(neo4j_driver)
    model2 = get_model(neo4j_driver)
    
    assert model1 is model2, "Should return same instance"

def test_model_metrics_before_training(neo4j_driver):
    """Test getting metrics before training"""
    model = ProspectModel(neo4j_driver)
    metrics = model.get_model_metrics()
    
    assert 'error' in metrics, "Should return error if not trained"
