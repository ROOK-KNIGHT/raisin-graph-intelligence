"""
Graph Query Tests
"""
import pytest
from app.database import get_db
from app.queries import (
    get_graph_stats,
    get_network_data,
    get_industry_clusters,
    get_similar_prospects
)

@pytest.fixture
def driver():
    """Get Neo4j driver"""
    return get_db()

def test_get_graph_stats(driver):
    """Test graph statistics query"""
    stats = get_graph_stats(driver)
    assert stats.prospect_count >= 0
    assert stats.lead_count >= 0
    assert stats.client_count >= 0
    assert stats.conversion_rate >= 0
    assert isinstance(stats.top_industries, list)
    assert isinstance(stats.top_locations, list)

def test_get_network_data(driver):
    """Test network data query"""
    network = get_network_data(driver, limit=10)
    assert isinstance(network.nodes, list)
    assert isinstance(network.edges, list)
    assert len(network.nodes) <= 10

def test_get_industry_clusters(driver):
    """Test industry clusters query"""
    clusters = get_industry_clusters(driver)
    assert isinstance(clusters, list)
    if len(clusters) > 0:
        assert hasattr(clusters[0], 'industry')
        assert hasattr(clusters[0], 'prospect_count')

def test_get_similar_prospects(driver):
    """Test similar prospects query"""
    similar = get_similar_prospects(driver, "P001", limit=3)
    assert isinstance(similar, list)
    assert len(similar) <= 3
