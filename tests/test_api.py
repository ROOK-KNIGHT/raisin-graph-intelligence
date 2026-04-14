"""
API Endpoint Tests
"""
import pytest
from fastapi import status

def test_health_endpoint(client):
    """Test health check endpoint"""
    response = client.get("/api/health")
    assert response.status_code == status.HTTP_200_OK
    data = response.json()
    assert "status" in data
    assert "neo4j_connected" in data

def test_stats_endpoint(client):
    """Test graph statistics endpoint"""
    response = client.get("/api/stats")
    assert response.status_code == status.HTTP_200_OK
    data = response.json()
    assert "prospect_count" in data
    assert "lead_count" in data
    assert "client_count" in data
    assert "conversion_rate" in data

def test_network_endpoint(client):
    """Test network data endpoint"""
    response = client.get("/api/network?limit=10")
    assert response.status_code == status.HTTP_200_OK
    data = response.json()
    assert "nodes" in data
    assert "edges" in data
    assert isinstance(data["nodes"], list)
    assert isinstance(data["edges"], list)

def test_industries_endpoint(client):
    """Test industry clusters endpoint"""
    response = client.get("/api/industries")
    assert response.status_code == status.HTTP_200_OK
    data = response.json()
    assert isinstance(data, list)
    if len(data) > 0:
        assert "industry" in data[0]
        assert "prospect_count" in data[0]

def test_conversion_path_valid(client, sample_prospect_id):
    """Test conversion path endpoint with valid ID"""
    response = client.get(f"/api/conversions/{sample_prospect_id}")
    # May return 200 or 404 depending on if prospect has conversion
    assert response.status_code in [status.HTTP_200_OK, status.HTTP_404_NOT_FOUND]

def test_conversion_path_invalid(client):
    """Test conversion path endpoint with invalid ID"""
    response = client.get("/api/conversions/INVALID_ID")
    assert response.status_code == status.HTTP_404_NOT_FOUND

def test_similar_prospects(client, sample_prospect_id):
    """Test similar prospects endpoint"""
    response = client.get(f"/api/similar/{sample_prospect_id}?limit=3")
    assert response.status_code == status.HTTP_200_OK
    data = response.json()
    assert isinstance(data, list)

def test_dashboard_renders(client):
    """Test that dashboard HTML renders"""
    response = client.get("/")
    assert response.status_code == status.HTTP_200_OK
    assert "text/html" in response.headers["content-type"]

def test_api_docs_available(client):
    """Test that API documentation is available"""
    response = client.get("/docs")
    assert response.status_code == status.HTTP_200_OK
