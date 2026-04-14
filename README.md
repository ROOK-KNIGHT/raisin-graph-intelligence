# 🍇 Raisin Reach Graph Intelligence

**Prospect Relationship Graph Analysis** using Neo4j and Python FastAPI

Academic Project - Data Science Course 2026

---

## 🎯 Project Overview

This standalone application demonstrates **graph database intelligence** for prospect relationship analysis in the B2B sales domain. It uses Neo4j to model and query complex relationships between prospects, leads, clients, industries, and locations.

### Key Features

- **350+ Node Graph Database** with 630+ relationships
- **RESTful API** built with FastAPI
- **Interactive Dashboard** with real-time statistics
- **Graph Queries** for conversion paths, industry clusters, and similarity analysis
- **Containerized Deployment** with Docker Compose

---

## 🏗️ Architecture

```
┌─────────────────┐
│   FastAPI App   │  ← Python 3.11, Uvicorn
│   (Port 8000)   │
└────────┬────────┘
         │
         ├─ REST API Endpoints
         ├─ HTML Dashboard (Jinja2)
         └─ Neo4j Driver
                │
                ▼
┌─────────────────┐
│     Neo4j DB    │  ← Graph Database
│  (Ports 7474,   │     - 120 Prospects
│        7687)    │     - 40 Leads
└─────────────────┘     - 20 Clients
                        - 30 Industries
                        - 25 Locations
                        - 20 Services
```

---

## 🚀 Quick Start

### Prerequisites

- Docker & Docker Compose
- 4GB RAM minimum
- Ports 7474, 7687, 8000 available

### Run the Application

```bash
# Clone or navigate to project directory
cd raisin-graph-intelligence

# Start all services
docker-compose up --build

# Wait for Neo4j to initialize (~30 seconds)
# Then load seed data (one-time setup):
docker exec -it raisin-neo4j cypher-shell -u neo4j -p raisinreach2026 -f /import/seed.cypher
```

### Access the Application

- **Dashboard**: http://localhost:8000
- **API Docs**: http://localhost:8000/docs
- **Neo4j Browser**: http://localhost:7474 (neo4j / raisinreach2026)

---

## 📊 Graph Schema

### Node Types

| Node | Count | Properties |
|------|-------|------------|
| **Prospect** | 120 | id, name, score, status, website |
| **Lead** | 40 | id, name, status, value, createdDate, closedDate |
| **Client** | 20 | id, name, industry, status, joinedDate |
| **Industry** | 30 | name |
| **Location** | 25 | city, state |
| **Service** | 20 | name, category |

### Relationship Types

| Relationship | Count | Description |
|--------------|-------|-------------|
| `PROSPECT -[:IN_INDUSTRY]-> Industry` | 120 | Prospect's industry |
| `PROSPECT -[:LOCATED_IN]-> Location` | 120 | Prospect's location |
| `PROSPECT -[:OFFERS_SERVICE]-> Service` | ~200 | Services offered |
| `PROSPECT -[:CONVERTED_TO]-> Lead` | 40 | Conversion tracking |
| `LEAD -[:ASSIGNED_TO]-> Client` | 40 | Lead ownership |
| `PROSPECT -[:SIMILAR_TO]-> Prospect` | 60 | AI-scored similarity |
| `CLIENT -[:REFERRED_BY]-> Client` | 8 | Referral network |

---

## 🔗 API Endpoints

### Core Endpoints

```
GET  /                          → HTML Dashboard
GET  /api/health                → Health check
GET  /api/stats                 → Graph statistics
GET  /api/network?limit=100     → Network data for visualization
GET  /api/industries            → Industry cluster analysis
GET  /api/conversions/{id}      → Conversion path for prospect
GET  /api/similar/{id}?limit=5  → Similar prospects
GET  /docs                      → Interactive API documentation
```

### Example Queries

```bash
# Get graph statistics
curl http://localhost:8000/api/stats

# Get conversion path for prospect P001
curl http://localhost:8000/api/conversions/P001

# Get similar prospects to P015
curl http://localhost:8000/api/similar/P015

# Get network data (50 nodes)
curl http://localhost:8000/api/network?limit=50
```

---

## 🧪 Testing

```bash
# Install dependencies locally (optional)
pip install -r requirements.txt

# Run tests
pytest tests/ -v

# Run with coverage
pytest tests/ --cov=app --cov-report=html
```

---

## 📁 Project Structure

```
raisin-graph-intelligence/
├── app/
│   ├── __init__.py
│   ├── main.py           # FastAPI application
│   ├── database.py       # Neo4j connection
│   ├── models.py         # Pydantic models
│   ├── queries.py        # Graph query functions
│   └── templates/
│       └── index.html    # Dashboard template
├── neo4j/
│   └── seed.cypher       # Graph seed data (350+ nodes)
├── tests/
│   ├── conftest.py
│   ├── test_api.py
│   └── test_queries.py
├── .github/
│   └── workflows/
│       └── ci.yml        # GitHub Actions CI/CD
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── .dockerignore
├── .gitignore
└── README.md
```

---

## 🎓 Academic Requirements Met

| Requirement | Implementation |
|-------------|----------------|
| **Python** ✅ | FastAPI app, all business logic in Python |
| **Graph Database** ✅ | Neo4j with 6 node types, 7 relationship types |
| **Containers** ✅ | Docker + Docker Compose (2 services) |
| **Tests** ✅ | pytest with ~10 tests |
| **CI/CD** ✅ | GitHub Actions workflow |
| **Observability** ✅ | Health checks, structured logging |
| **API Design** ✅ | RESTful API with auto-generated docs |

---

## 🛠️ Technology Stack

- **Language**: Python 3.11
- **Web Framework**: FastAPI 0.115.0
- **Database**: Neo4j 5.13.0
- **Driver**: neo4j-driver 5.24.0
- **Server**: Uvicorn
- **Templating**: Jinja2
- **Testing**: pytest
- **Containerization**: Docker & Docker Compose

---

## 📈 Sample Data

The graph includes realistic B2B sales data:

- **120 Prospects** across 8 US regions (Phoenix, Dallas, Atlanta, Chicago, Miami, Denver, Seattle, California)
- **40 Leads** in various stages (NEW, CONTACTED, QUALIFIED, WON, LOST)
- **20 Active Clients** with referral networks
- **30 Industries** (HVAC, Plumbing, Electrical, Roofing, etc.)
- **25 Major US Cities**
- **Conversion Rate**: 33.3% (40 leads from 120 prospects)

---

## 🔒 Security Notes

**For Development/Demo Only**

- Default credentials: `neo4j / raisinreach2026`
- No authentication on FastAPI endpoints
- Not production-ready

---

## 📝 License

Academic Project - Data Science Course 2026

---

## 👤 Author

Isaac - Data Science Student

**Course**: Advanced Data Science & Machine Learning  
**Professor**: Dr. Rao Mikkilineni, Ph.D.  
**Institution**: [University Name]  
**Date**: April 2026
