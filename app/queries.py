"""
Neo4j Graph Queries
"""
from typing import List, Optional
from .models import (
    GraphStats, IndustryStats, LocationStats,
    NetworkData, NetworkNode, NetworkEdge,
    ConversionPath, ProspectInfo, LeadInfo, ClientInfo,
    IndustryCluster, SimilarProspect
)
import logging

logger = logging.getLogger(__name__)

def get_graph_stats(driver) -> GraphStats:
    """Get comprehensive graph statistics"""
    with driver.session() as session:
        # Get node counts
        node_counts = session.run("""
            MATCH (p:Prospect) WITH count(p) as prospects
            MATCH (l:Lead) WITH prospects, count(l) as leads
            MATCH (c:Client) WITH prospects, leads, count(c) as clients
            MATCH (i:Industry) WITH prospects, leads, clients, count(i) as industries
            MATCH (loc:Location) WITH prospects, leads, clients, industries, count(loc) as locations
            MATCH (s:Service) WITH prospects, leads, clients, industries, locations, count(s) as services
            RETURN prospects, leads, clients, industries, locations, services
        """).single()
        
        # Get relationship count
        rel_count = session.run("MATCH ()-[r]->() RETURN count(r) as count").single()["count"]
        
        # Calculate conversion rate
        prospect_count = node_counts["prospects"]
        lead_count = node_counts["leads"]
        conversion_rate = (lead_count / prospect_count * 100) if prospect_count > 0 else 0
        
        # Get top industries
        top_industries_result = session.run("""
            MATCH (p:Prospect)-[:IN_INDUSTRY]->(i:Industry)
            RETURN i.name as name, count(p) as count
            ORDER BY count DESC
            LIMIT 10
        """)
        top_industries = [
            IndustryStats(name=record["name"], count=record["count"])
            for record in top_industries_result
        ]
        
        # Get top locations
        top_locations_result = session.run("""
            MATCH (p:Prospect)-[:LOCATED_IN]->(l:Location)
            RETURN l.city as city, l.state as state, count(p) as count
            ORDER BY count DESC
            LIMIT 10
        """)
        top_locations = [
            LocationStats(city=record["city"], state=record["state"], count=record["count"])
            for record in top_locations_result
        ]
        
        return GraphStats(
            prospect_count=prospect_count,
            lead_count=lead_count,
            client_count=node_counts["clients"],
            industry_count=node_counts["industries"],
            location_count=node_counts["locations"],
            service_count=node_counts["services"],
            relationship_count=rel_count,
            conversion_rate=round(conversion_rate, 1),
            top_industries=top_industries,
            top_locations=top_locations
        )

def get_network_data(driver, limit: int = 100) -> NetworkData:
    """Get network data for visualization"""
    with driver.session() as session:
        # Get nodes
        nodes_result = session.run(f"""
            MATCH (n)
            WHERE n:Prospect OR n:Lead OR n:Client OR n:Industry OR n:Location
            RETURN id(n) as id, labels(n)[0] as type, properties(n) as props
            LIMIT {limit}
        """)
        
        nodes = []
        node_ids = []
        for record in nodes_result:
            props = record["props"]
            node_id = str(record["id"])
            node_ids.append(int(record["id"]))
            
            nodes.append(NetworkNode(
                id=node_id,
                label=props.get("name") or props.get("city") or "Unknown",
                type=record["type"],
                properties=props
            ))
        
        # Get edges between these nodes
        edges_result = session.run("""
            MATCH (a)-[r]->(b)
            WHERE id(a) IN $nodeIds AND id(b) IN $nodeIds
            RETURN id(a) as source, id(b) as target, type(r) as type
        """, nodeIds=node_ids)
        
        edges = [
            NetworkEdge(
                source=str(record["source"]),
                target=str(record["target"]),
                type=record["type"]
            )
            for record in edges_result
        ]
        
        return NetworkData(nodes=nodes, edges=edges)

def get_conversion_path(driver, prospect_id: str) -> Optional[ConversionPath]:
    """Get conversion path for a specific prospect"""
    with driver.session() as session:
        result = session.run("""
            MATCH path = (p:Prospect {id: $prospectId})-[:CONVERTED_TO]->(l:Lead)-[:ASSIGNED_TO]->(c:Client)
            RETURN p.name as prospectName, p.score as prospectScore,
                   l.name as leadName, l.status as leadStatus, l.value as leadValue,
                   c.name as clientName, c.industry as clientIndustry,
                   length(path) as pathLength
            LIMIT 1
        """, prospectId=prospect_id).single()
        
        if not result:
            return None
        
        return ConversionPath(
            prospect=ProspectInfo(
                name=result["prospectName"],
                score=result["prospectScore"]
            ),
            lead=LeadInfo(
                name=result["leadName"],
                status=result["leadStatus"],
                value=result["leadValue"]
            ),
            client=ClientInfo(
                name=result["clientName"],
                industry=result["clientIndustry"]
            ),
            path_length=result["pathLength"]
        )

def get_industry_clusters(driver) -> List[IndustryCluster]:
    """Get industry clusters with prospect counts"""
    with driver.session() as session:
        result = session.run("""
            MATCH (i:Industry)<-[:IN_INDUSTRY]-(p:Prospect)
            WITH i, collect(p) as prospects, count(p) as prospectCount
            RETURN i.name as industry, prospectCount,
                   [p IN prospects | {name: p.name, score: p.score}][0..5] as sampleProspects
            ORDER BY prospectCount DESC
        """)
        
        return [
            IndustryCluster(
                industry=record["industry"],
                prospect_count=record["prospectCount"],
                sample_prospects=record["sampleProspects"]
            )
            for record in result
        ]

def get_similar_prospects(driver, prospect_id: str, limit: int = 5) -> List[SimilarProspect]:
    """Get similar prospects based on industry"""
    with driver.session() as session:
        result = session.run("""
            MATCH (p:Prospect {id: $prospectId})-[:IN_INDUSTRY]->(i:Industry)<-[:IN_INDUSTRY]-(similar:Prospect)
            WHERE p <> similar
            RETURN similar.id as id, similar.name as name, similar.score as score
            ORDER BY similar.score DESC
            LIMIT $limit
        """, prospectId=prospect_id, limit=limit)
        
        return [
            SimilarProspect(
                id=record["id"],
                name=record["name"],
                score=record["score"]
            )
            for record in result
        ]
