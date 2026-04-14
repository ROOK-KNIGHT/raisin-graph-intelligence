"""
Pytest configuration and fixtures
"""
import pytest
from fastapi.testclient import TestClient
from app.main import app

@pytest.fixture
def client():
    """FastAPI test client"""
    return TestClient(app)

@pytest.fixture
def sample_prospect_id():
    """Sample prospect ID for testing"""
    return "P001"

@pytest.fixture
def sample_lead_id():
    """Sample lead ID for testing"""
    return "L001"
