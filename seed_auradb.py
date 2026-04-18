"""
Seed AuraDB with prospect data
Run this script to populate your cloud Neo4j instance
"""
from neo4j import GraphDatabase
import sys

# AuraDB credentials
URI = "neo4j+s://ca5334e5.databases.neo4j.io"
USER = "neo4j"
PASSWORD = "L4SzdDDBMWEXmnFdrOuWmA-xSVTMUmaH4PeTCxqkZEk"

def seed_database():
    driver = GraphDatabase.driver(URI, auth=(USER, PASSWORD))
    
    print("🔗 Connected to AuraDB")
    
    with open('neo4j/seed.cypher', 'r') as f:
        cypher_script = f.read()
    
    # Split by semicolons and execute each statement
    statements = [s.strip() for s in cypher_script.split(';') if s.strip()]
    
    with driver.session() as session:
        for i, statement in enumerate(statements, 1):
            if statement:
                try:
                    session.run(statement)
                    print(f"✅ Executed statement {i}/{len(statements)}")
                except Exception as e:
                    print(f"⚠️  Statement {i} failed: {e}")
    
    driver.close()
    print("🎉 AuraDB seeded successfully!")

if __name__ == "__main__":
    try:
        seed_database()
    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)
