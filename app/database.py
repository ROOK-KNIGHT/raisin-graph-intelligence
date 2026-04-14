"""
Neo4j Database Connection
"""
from neo4j import GraphDatabase
import os
import logging

logger = logging.getLogger(__name__)

class Neo4jConnection:
    def __init__(self):
        uri = os.getenv("NEO4J_URI", "bolt://neo4j:7687")
        user = os.getenv("NEO4J_USER", "neo4j")
        password = os.getenv("NEO4J_PASSWORD", "raisinreach2026")
        
        self.driver = GraphDatabase.driver(uri, auth=(user, password))
        logger.info(f"Connected to Neo4j at {uri}")
    
    def close(self):
        if self.driver:
            self.driver.close()
            logger.info("Neo4j connection closed")
    
    def verify_connectivity(self):
        """Verify database connectivity"""
        try:
            with self.driver.session() as session:
                result = session.run("RETURN 1 as num")
                return result.single()["num"] == 1
        except Exception as e:
            logger.error(f"Connectivity check failed: {e}")
            return False

# Global connection instance
neo4j_conn = Neo4jConnection()

def get_db():
    """Dependency for FastAPI routes"""
    return neo4j_conn.driver
