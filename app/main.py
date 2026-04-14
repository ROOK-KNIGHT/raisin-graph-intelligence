"""
Raisin Reach Graph Intelligence API
FastAPI application for prospect relationship graph analysis
"""
from fastapi import FastAPI, Depends, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from starlette.requests import Request
import logging
from typing import List

from .database import get_db, neo4j_conn
from .models import (
    HealthResponse, GraphStats, NetworkData,
    ConversionPath, IndustryCluster, SimilarProspect
)
from .queries import (
    get_graph_stats, get_network_data, get_conversion_path,
    get_industry_clusters, get_similar_prospects
)
from .model import get_model

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Initialize FastAPI app
app = FastAPI(
    title="Raisin Reach Graph Intelligence",
    description="Prospect relationship graph analysis using Neo4j",
    version="1.0.0"
)

# Templates
templates = Jinja2Templates(directory="app/templates")

@app.on_event("startup")
async def startup_event():
    """Verify Neo4j connection on startup"""
    logger.info("Starting Raisin Reach Graph Intelligence API")
    if neo4j_conn.verify_connectivity():
        logger.info("✓ Neo4j connection verified")
    else:
        logger.error("✗ Neo4j connection failed")

@app.on_event("shutdown")
async def shutdown_event():
    """Close Neo4j connection on shutdown"""
    logger.info("Shutting down Raisin Reach Graph Intelligence API")
    neo4j_conn.close()

@app.get("/", response_class=HTMLResponse)
async def dashboard(request: Request, driver=Depends(get_db)):
    """Main dashboard with graph statistics and ML model"""
    try:
        # Get graph stats
        stats = get_graph_stats(driver)
        clusters = get_industry_clusters(driver)
        
        # Train ML model and get metrics
        model = get_model(driver)
        try:
            metrics = model.train_ml_model()
            logger.info("Model trained successfully for dashboard")
        except Exception as model_error:
            logger.error(f"Model training error: {model_error}")
            metrics = {"error": str(model_error)}
        
        # Get graph-based scores
        try:
            graph_scores = model.compute_graph_scores()
        except Exception as score_error:
            logger.error(f"Graph scoring error: {score_error}")
            graph_scores = {"top_prospects": [], "error": str(score_error)}
        
        return templates.TemplateResponse("index.html", {
            "request": request,
            "stats": stats,
            "clusters": clusters,
            "model_metrics": metrics,
            "graph_scores": graph_scores
        })
    except Exception as e:
        logger.error(f"Dashboard error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/health", response_model=HealthResponse)
async def health_check():
    """Health check endpoint"""
    neo4j_connected = neo4j_conn.verify_connectivity()
    return HealthResponse(
        status="healthy" if neo4j_connected else "unhealthy",
        neo4j_connected=neo4j_connected
    )

@app.get("/api/stats", response_model=GraphStats)
async def api_stats(driver=Depends(get_db)):
    """Get graph statistics"""
    try:
        return get_graph_stats(driver)
    except Exception as e:
        logger.error(f"Stats error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/network", response_model=NetworkData)
async def api_network(limit: int = 100, driver=Depends(get_db)):
    """Get network data for visualization"""
    try:
        return get_network_data(driver, limit)
    except Exception as e:
        logger.error(f"Network error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/industries", response_model=List[IndustryCluster])
async def api_industries(driver=Depends(get_db)):
    """Get industry cluster analysis"""
    try:
        return get_industry_clusters(driver)
    except Exception as e:
        logger.error(f"Industries error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/conversions/{prospect_id}", response_model=ConversionPath)
async def api_conversion_path(prospect_id: str, driver=Depends(get_db)):
    """Get conversion path for a specific prospect"""
    try:
        path = get_conversion_path(driver, prospect_id)
        if not path:
            raise HTTPException(status_code=404, detail="Conversion path not found")
        return path
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Conversion path error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/similar/{prospect_id}", response_model=List[SimilarProspect])
async def api_similar_prospects(prospect_id: str, limit: int = 5, driver=Depends(get_db)):
    """Get similar prospects for a given prospect ID"""
    try:
        return get_similar_prospects(driver, prospect_id, limit)
    except Exception as e:
        logger.error(f"Similar prospects error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

# ============================================================================
# ML MODEL & GRAPH REASONER ENDPOINTS
# ============================================================================

@app.post("/api/model/train")
async def train_model(driver=Depends(get_db)):
    """Train the ML model for conversion prediction"""
    try:
        model = get_model(driver)
        metrics = model.train_ml_model()
        return {
            "status": "success",
            "message": "Model trained successfully",
            "metrics": metrics
        }
    except Exception as e:
        logger.error(f"Model training error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/model/metrics")
async def get_model_metrics(driver=Depends(get_db)):
    """Get current model evaluation metrics"""
    try:
        model = get_model(driver)
        return model.get_model_metrics()
    except Exception as e:
        logger.error(f"Model metrics error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/model/predict/{prospect_id}")
async def predict_conversion(prospect_id: str, driver=Depends(get_db)):
    """Predict conversion probability for a specific prospect"""
    try:
        model = get_model(driver)
        prediction = model.predict_conversion(prospect_id)
        if not prediction:
            raise HTTPException(status_code=404, detail="Prospect not found or model not trained")
        return prediction
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Prediction error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/model/graph-scores")
async def get_graph_scores(driver=Depends(get_db)):
    """Get graph-based prospect scores using weighted features"""
    try:
        model = get_model(driver)
        return model.compute_graph_scores()
    except Exception as e:
        logger.error(f"Graph scores error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/model/similarity/{prospect_id1}/{prospect_id2}")
async def get_jaccard_similarity(prospect_id1: str, prospect_id2: str, driver=Depends(get_db)):
    """Compute Jaccard similarity between two prospects"""
    try:
        model = get_model(driver)
        similarity = model.compute_jaccard_similarity(prospect_id1, prospect_id2)
        return {
            "prospect_id1": prospect_id1,
            "prospect_id2": prospect_id2,
            "jaccard_similarity": similarity,
            "similarity_percentage": round(similarity * 100, 2)
        }
    except Exception as e:
        logger.error(f"Similarity computation error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
