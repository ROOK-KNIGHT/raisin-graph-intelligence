"""
Pydantic Models for API Responses
"""
from pydantic import BaseModel
from typing import List, Optional

class HealthResponse(BaseModel):
    status: str
    neo4j_connected: bool

class IndustryStats(BaseModel):
    name: str
    count: int

class LocationStats(BaseModel):
    city: str
    state: str
    count: int

class GraphStats(BaseModel):
    prospect_count: int
    lead_count: int
    client_count: int
    industry_count: int
    location_count: int
    service_count: int
    relationship_count: int
    conversion_rate: float
    top_industries: List[IndustryStats]
    top_locations: List[LocationStats]

class NetworkNode(BaseModel):
    id: str
    label: str
    type: str
    properties: dict

class NetworkEdge(BaseModel):
    source: str
    target: str
    type: str

class NetworkData(BaseModel):
    nodes: List[NetworkNode]
    edges: List[NetworkEdge]

class ProspectInfo(BaseModel):
    name: str
    score: int

class LeadInfo(BaseModel):
    name: str
    status: str
    value: int

class ClientInfo(BaseModel):
    name: str
    industry: str

class ConversionPath(BaseModel):
    prospect: ProspectInfo
    lead: LeadInfo
    client: ClientInfo
    path_length: int

class IndustryCluster(BaseModel):
    industry: str
    prospect_count: int
    sample_prospects: List[dict]

class SimilarProspect(BaseModel):
    id: str
    name: str
    score: int
