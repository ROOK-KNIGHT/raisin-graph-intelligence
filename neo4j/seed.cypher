// Raisin Reach - Neo4j Graph Database Seed Data
// Creates ~350 nodes and ~630 relationships for the prospect intelligence graph

// ============================================
// CLEAR EXISTING DATA (for clean re-seeding)
// ============================================
MATCH (n) DETACH DELETE n;

// ============================================
// CREATE INDUSTRIES (30 nodes)
// ============================================
CREATE (:Industry {name: 'Residential Plumbing'})
CREATE (:Industry {name: 'Commercial Plumbing'})
CREATE (:Industry {name: 'HVAC Residential'})
CREATE (:Industry {name: 'HVAC Commercial'})
CREATE (:Industry {name: 'Electrical Residential'})
CREATE (:Industry {name: 'Electrical Commercial'})
CREATE (:Industry {name: 'Roofing'})
CREATE (:Industry {name: 'Landscaping'})
CREATE (:Industry {name: 'Painting'})
CREATE (:Industry {name: 'Concrete & Masonry'})
CREATE (:Industry {name: 'Cleaning Services'})
CREATE (:Industry {name: 'Pest Control'})
CREATE (:Industry {name: 'Pool Services'})
CREATE (:Industry {name: 'Flooring'})
CREATE (:Industry {name: 'Windows & Doors'})
CREATE (:Industry {name: 'General Contracting'})
CREATE (:Industry {name: 'Remodeling'})
CREATE (:Industry {name: 'Carpentry'})
CREATE (:Industry {name: 'Locksmith'})
CREATE (:Industry {name: 'Garage Doors'})
CREATE (:Industry {name: 'Fencing'})
CREATE (:Industry {name: 'Gutters'})
CREATE (:Industry {name: 'Insulation'})
CREATE (:Industry {name: 'Drywall'})
CREATE (:Industry {name: 'Septic Services'})
CREATE (:Industry {name: 'Tree Services'})
CREATE (:Industry {name: 'Appliance Repair'})
CREATE (:Industry {name: 'Home Security'})
CREATE (:Industry {name: 'Solar Installation'})
CREATE (:Industry {name: 'Water Treatment'});

// ============================================
// CREATE LOCATIONS (25 nodes)
// ============================================
CREATE (:Location {city: 'Phoenix', state: 'AZ'})
CREATE (:Location {city: 'Scottsdale', state: 'AZ'})
CREATE (:Location {city: 'Mesa', state: 'AZ'})
CREATE (:Location {city: 'Dallas', state: 'TX'})
CREATE (:Location {city: 'Houston', state: 'TX'})
CREATE (:Location {city: 'Austin', state: 'TX'})
CREATE (:Location {city: 'Atlanta', state: 'GA'})
CREATE (:Location {city: 'Chicago', state: 'IL'})
CREATE (:Location {city: 'Miami', state: 'FL'})
CREATE (:Location {city: 'Tampa', state: 'FL'})
CREATE (:Location {city: 'Denver', state: 'CO'})
CREATE (:Location {city: 'Seattle', state: 'WA'})
CREATE (:Location {city: 'Portland', state: 'OR'})
CREATE (:Location {city: 'Las Vegas', state: 'NV'})
CREATE (:Location {city: 'San Diego', state: 'CA'})
CREATE (:Location {city: 'Los Angeles', state: 'CA'})
CREATE (:Location {city: 'San Francisco', state: 'CA'})
CREATE (:Location {city: 'Nashville', state: 'TN'})
CREATE (:Location {city: 'Charlotte', state: 'NC'})
CREATE (:Location {city: 'Raleigh', state: 'NC'})
CREATE (:Location {city: 'Orlando', state: 'FL'})
CREATE (:Location {city: 'San Antonio', state: 'TX'})
CREATE (:Location {city: 'Indianapolis', state: 'IN'})
CREATE (:Location {city: 'Columbus', state: 'OH'})
CREATE (:Location {city: 'Salt Lake City', state: 'UT'});

// ============================================
// CREATE SERVICES (20 nodes)
// ============================================
CREATE (:Service {name: 'Emergency Repair', category: 'Urgent'})
CREATE (:Service {name: 'Scheduled Maintenance', category: 'Routine'})
CREATE (:Service {name: 'Installation', category: 'Project'})
CREATE (:Service {name: 'Inspection', category: 'Diagnostic'})
CREATE (:Service {name: 'Consultation', category: 'Advisory'})
CREATE (:Service {name: 'Replacement', category: 'Project'})
CREATE (:Service {name: 'Repair', category: 'Corrective'})
CREATE (:Service {name: 'Upgrade', category: 'Enhancement'})
CREATE (:Service {name: 'Preventive Maintenance', category: 'Routine'})
CREATE (:Service {name: 'Troubleshooting', category: 'Diagnostic'})
CREATE (:Service {name: 'Design Services', category: 'Planning'})
CREATE (:Service {name: 'Warranty Service', category: 'Support'})
CREATE (:Service {name: 'Custom Work', category: 'Specialized'})
CREATE (:Service {name: 'Commercial Services', category: 'B2B'})
CREATE (:Service {name: 'Residential Services', category: 'B2C'})
CREATE (:Service {name: '24/7 Service', category: 'Emergency'})
CREATE (:Service {name: 'Seasonal Services', category: 'Periodic'})
CREATE (:Service {name: 'Restoration', category: 'Recovery'})
CREATE (:Service {name: 'Retrofitting', category: 'Modernization'})
CREATE (:Service {name: 'Energy Audit', category: 'Assessment'});

// ============================================
// CREATE CLIENTS (20 nodes)
// ============================================
CREATE (:Client {id: 'C001', name: 'Summit Property Management', industry: 'Property Management', status: 'ACTIVE', joinedDate: '2024-01-15'})
CREATE (:Client {id: 'C002', name: 'Apex Construction Group', industry: 'General Contracting', status: 'ACTIVE', joinedDate: '2024-02-20'})
CREATE (:Client {id: 'C003', name: 'Elite Home Services', industry: 'Home Services', status: 'ACTIVE', joinedDate: '2024-03-10'})
CREATE (:Client {id: 'C004', name: 'Precision HVAC Solutions', industry: 'HVAC Commercial', status: 'ACTIVE', joinedDate: '2024-04-05'})
CREATE (:Client {id: 'C005', name: 'Ironclad Roofing Co.', industry: 'Roofing', status: 'ACTIVE', joinedDate: '2024-05-12'})
CREATE (:Client {id: 'C006', name: 'GreenScape Landscaping', industry: 'Landscaping', status: 'ACTIVE', joinedDate: '2024-06-18'})
CREATE (:Client {id: 'C007', name: 'Bright Spark Electrical', industry: 'Electrical Commercial', status: 'ACTIVE', joinedDate: '2024-07-22'})
CREATE (:Client {id: 'C008', name: 'Crystal Clear Pool Services', industry: 'Pool Services', status: 'ACTIVE', joinedDate: '2024-08-30'})
CREATE (:Client {id: 'C009', name: 'Guardian Pest Control', industry: 'Pest Control', status: 'ACTIVE', joinedDate: '2024-09-14'})
CREATE (:Client {id: 'C010', name: 'ProClean Commercial', industry: 'Cleaning Services', status: 'ACTIVE', joinedDate: '2024-10-08'})
CREATE (:Client {id: 'C011', name: 'Solid Foundation Concrete', industry: 'Concrete & Masonry', status: 'ACTIVE', joinedDate: '2024-11-20'})
CREATE (:Client {id: 'C012', name: 'Perfect Finish Painting', industry: 'Painting', status: 'ACTIVE', joinedDate: '2025-01-05'})
CREATE (:Client {id: 'C013', name: 'FlowMaster Plumbing', industry: 'Commercial Plumbing', status: 'ACTIVE', joinedDate: '2025-02-14'})
CREATE (:Client {id: 'C014', name: 'SecureHome Locksmiths', industry: 'Locksmith', status: 'ACTIVE', joinedDate: '2025-03-22'})
CREATE (:Client {id: 'C015', name: 'SolarTech Installations', industry: 'Solar Installation', status: 'ACTIVE', joinedDate: '2025-04-10'})
CREATE (:Client {id: 'C016', name: 'Premium Flooring Solutions', industry: 'Flooring', status: 'ACTIVE', joinedDate: '2025-05-18'})
CREATE (:Client {id: 'C017', name: 'Evergreen Tree Services', industry: 'Tree Services', status: 'ACTIVE', joinedDate: '2025-06-25'})
CREATE (:Client {id: 'C018', name: 'Fortress Home Security', industry: 'Home Security', status: 'ACTIVE', joinedDate: '2025-07-30'})
CREATE (:Client {id: 'C019', name: 'AquaPure Water Treatment', industry: 'Water Treatment', status: 'ACTIVE', joinedDate: '2025-08-12'})
CREATE (:Client {id: 'C020', name: 'Master Craftsmen Remodeling', industry: 'Remodeling', status: 'ACTIVE', joinedDate: '2025-09-05'});

// ============================================
// CREATE LEADS (40 nodes)
// ============================================
CREATE (:Lead {id: 'L001', name: 'Acme Plumbing Services', status: 'WON', value: 45000, createdDate: '2025-01-10', closedDate: '2025-02-15'})
CREATE (:Lead {id: 'L002', name: 'Reliable HVAC Pros', status: 'WON', value: 62000, createdDate: '2025-02-05', closedDate: '2025-03-20'})
CREATE (:Lead {id: 'L003', name: 'TopTier Electrical', status: 'QUALIFIED', value: 38000, createdDate: '2025-11-15', closedDate: null})
CREATE (:Lead {id: 'L004', name: 'Premier Roofing Solutions', status: 'WON', value: 55000, createdDate: '2025-03-12', closedDate: '2025-05-10'})
CREATE (:Lead {id: 'L005', name: 'GreenThumb Landscaping', status: 'WON', value: 28000, createdDate: '2025-04-20', closedDate: '2025-06-15'})
CREATE (:Lead {id: 'L006', name: 'ColorPro Painters', status: 'MEETING_SCHEDULED', value: 22000, createdDate: '2025-12-01', closedDate: null})
CREATE (:Lead {id: 'L007', name: 'Concrete Kings', status: 'WON', value: 48000, createdDate: '2025-05-08', closedDate: '2025-07-22'})
CREATE (:Lead {id: 'L008', name: 'SparkleClean Services', status: 'WON', value: 18000, createdDate: '2025-06-14', closedDate: '2025-08-30'})
CREATE (:Lead {id: 'L009', name: 'BugBusters Pest Control', status: 'WON', value: 25000, createdDate: '2025-07-22', closedDate: '2025-09-10'})
CREATE (:Lead {id: 'L010', name: 'AquaBlue Pool Care', status: 'WON', value: 32000, createdDate: '2025-08-05', closedDate: '2025-10-05'})
CREATE (:Lead {id: 'L011', name: 'Foundation Experts LLC', status: 'QUALIFIED', value: 52000, createdDate: '2025-11-20', closedDate: null})
CREATE (:Lead {id: 'L012', name: 'Precision Painters Inc', status: 'WON', value: 19000, createdDate: '2025-09-18', closedDate: '2026-01-03'})
CREATE (:Lead {id: 'L013', name: 'DrainMaster Plumbing', status: 'WON', value: 41000, createdDate: '2025-10-25', closedDate: '2026-02-12'})
CREATE (:Lead {id: 'L014', name: 'KeyMaster Locksmiths', status: 'MEETING_SCHEDULED', value: 15000, createdDate: '2025-12-10', closedDate: null})
CREATE (:Lead {id: 'L015', name: 'SunPower Solar', status: 'WON', value: 78000, createdDate: '2025-11-05', closedDate: '2026-04-08'})
CREATE (:Lead {id: 'L016', name: 'FloorPro Installations', status: 'QUALIFIED', value: 35000, createdDate: '2025-12-15', closedDate: null})
CREATE (:Lead {id: 'L017', name: 'TreeCare Specialists', status: 'WON', value: 29000, createdDate: '2026-01-08', closedDate: '2026-05-16'})
CREATE (:Lead {id: 'L018', name: 'SafeGuard Security', status: 'CONTACTED', value: 42000, createdDate: '2026-01-20', closedDate: null})
CREATE (:Lead {id: 'L019', name: 'PureWater Systems', status: 'WON', value: 36000, createdDate: '2026-02-12', closedDate: '2026-08-10'})
CREATE (:Lead {id: 'L020', name: 'RenovatePro Remodeling', status: 'QUALIFIED', value: 68000, createdDate: '2026-02-28', closedDate: null})
CREATE (:Lead {id: 'L021', name: 'Elite Plumbing Group', status: 'CONTACTED', value: 33000, createdDate: '2026-03-05', closedDate: null})
CREATE (:Lead {id: 'L022', name: 'Climate Control HVAC', status: 'NEW', value: 47000, createdDate: '2026-03-15', closedDate: null})
CREATE (:Lead {id: 'L023', name: 'PowerLine Electrical', status: 'CONTACTED', value: 39000, createdDate: '2026-03-20', closedDate: null})
CREATE (:Lead {id: 'L024', name: 'RoofGuard Systems', status: 'NEW', value: 51000, createdDate: '2026-03-25', closedDate: null})
CREATE (:Lead {id: 'L025', name: 'LawnPerfect Services', status: 'CONTACTED', value: 24000, createdDate: '2026-03-28', closedDate: null})
CREATE (:Lead {id: 'L026', name: 'BrushMasters Painting', status: 'NEW', value: 21000, createdDate: '2026-04-01', closedDate: null})
CREATE (:Lead {id: 'L027', name: 'StoneCraft Masonry', status: 'CONTACTED', value: 44000, createdDate: '2026-04-05', closedDate: null})
CREATE (:Lead {id: 'L028', name: 'ShineRight Cleaning', status: 'NEW', value: 17000, createdDate: '2026-04-08', closedDate: null})
CREATE (:Lead {id: 'L029', name: 'CritterControl Pest', status: 'CONTACTED', value: 23000, createdDate: '2026-04-10', closedDate: null})
CREATE (:Lead {id: 'L030', name: 'PoolPerfect Maintenance', status: 'NEW', value: 31000, createdDate: '2026-04-12', closedDate: null})
CREATE (:Lead {id: 'L031', name: 'BuildRight Concrete', status: 'LOST', value: 0, createdDate: '2025-08-15', closedDate: '2025-09-20'})
CREATE (:Lead {id: 'L032', name: 'ColorWorks Painting', status: 'LOST', value: 0, createdDate: '2025-09-22', closedDate: '2025-10-30'})
CREATE (:Lead {id: 'L033', name: 'QuickFix Plumbing', status: 'LOST', value: 0, createdDate: '2025-10-10', closedDate: '2025-11-15'})
CREATE (:Lead {id: 'L034', name: 'LockPro Services', status: 'LOST', value: 0, createdDate: '2025-11-08', closedDate: '2025-12-05'})
CREATE (:Lead {id: 'L035', name: 'GreenEnergy Solar', status: 'LOST', value: 0, createdDate: '2025-12-01', closedDate: '2026-01-10'})
CREATE (:Lead {id: 'L036', name: 'FloorMaster Pro', status: 'LOST', value: 0, createdDate: '2026-01-15', closedDate: '2026-02-20'})
CREATE (:Lead {id: 'L037', name: 'TreeTech Services', status: 'LOST', value: 0, createdDate: '2026-02-05', closedDate: '2026-03-10'})
CREATE (:Lead {id: 'L038', name: 'HomeDefense Security', status: 'LOST', value: 0, createdDate: '2026-02-18', closedDate: '2026-03-22'})
CREATE (:Lead {id: 'L039', name: 'WaterWorks Treatment', status: 'LOST', value: 0, createdDate: '2026-03-01', closedDate: '2026-04-05'})
CREATE (:Lead {id: 'L040', name: 'DreamHome Remodeling', status: 'LOST', value: 0, createdDate: '2026-03-10', closedDate: '2026-04-12'});

// ============================================
// CREATE PROSPECTS (120 nodes)
// ============================================
// Batch 1: Phoenix Area Prospects (15)
CREATE (:Prospect {id: 'P001', name: 'Desert Flow Plumbing', score: 85, status: 'QUALIFIED', website: 'desertflowplumbing.com'})
CREATE (:Prospect {id: 'P002', name: 'Valley HVAC Masters', score: 78, status: 'QUALIFIED', website: 'valleyhvac.com'})
CREATE (:Prospect {id: 'P003', name: 'Cactus Electric Co', score: 72, status: 'RESEARCHING', website: 'cactuselectric.com'})
CREATE (:Prospect {id: 'P004', name: 'Arizona Roof Pros', score: 88, status: 'QUALIFIED', website: 'azroofpros.com'})
CREATE (:Prospect {id: 'P005', name: 'Sonoran Landscaping', score: 65, status: 'NEW', website: 'sonoranlandscape.com'})
CREATE (:Prospect {id: 'P006', name: 'Phoenix Paint Masters', score: 58, status: 'NEW', website: 'phxpaint.com'})
CREATE (:Prospect {id: 'P007', name: 'Southwest Concrete', score: 81, status: 'QUALIFIED', website: 'swconcrete.com'})
CREATE (:Prospect {id: 'P008', name: 'Valley Clean Pro', score: 54, status: 'NEW', website: 'valleyclean.com'})
CREATE (:Prospect {id: 'P009', name: 'Desert Pest Solutions', score: 69, status: 'RESEARCHING', website: 'desertpest.com'})
CREATE (:Prospect {id: 'P010', name: 'Oasis Pool Service', score: 76, status: 'QUALIFIED', website: 'oasispools.com'})
CREATE (:Prospect {id: 'P011', name: 'Copper State Flooring', score: 62, status: 'RESEARCHING', website: 'copperstateflooring.com'})
CREATE (:Prospect {id: 'P012', name: 'Arizona Window Works', score: 71, status: 'QUALIFIED', website: 'azwindowworks.com'})
CREATE (:Prospect {id: 'P013', name: 'Valley Garage Doors', score: 67, status: 'RESEARCHING', website: 'valleygaragedoors.com'})
CREATE (:Prospect {id: 'P014', name: 'Phoenix Fence Company', score: 59, status: 'NEW', website: 'phxfence.com'})
CREATE (:Prospect {id: 'P015', name: 'Desert Solar Solutions', score: 92, status: 'QUALIFIED', website: 'desertsolar.com'})

// Batch 2: Dallas/Houston Area (15)
CREATE (:Prospect {id: 'P016', name: 'Lone Star Plumbing', score: 83, status: 'QUALIFIED', website: 'lonestarplumbing.com'})
CREATE (:Prospect {id: 'P017', name: 'Texas Cool HVAC', score: 79, status: 'QUALIFIED', website: 'texascool.com'})
CREATE (:Prospect {id: 'P018', name: 'Cowboy Electric', score: 74, status: 'RESEARCHING', website: 'cowboyelectric.com'})
CREATE (:Prospect {id: 'P019', name: 'Big D Roofing', score: 86, status: 'QUALIFIED', website: 'bigdroofing.com'})
CREATE (:Prospect {id: 'P020', name: 'Texas Green Lawns', score: 68, status: 'RESEARCHING', website: 'txgreenlawns.com'})
CREATE (:Prospect {id: 'P021', name: 'Houston Paint Pros', score: 61, status: 'NEW', website: 'houstonpaint.com'})
CREATE (:Prospect {id: 'P022', name: 'Alamo Concrete Works', score: 84, status: 'QUALIFIED', website: 'alamoconcrete.com'})
CREATE (:Prospect {id: 'P023', name: 'Dallas Clean Team', score: 56, status: 'NEW', website: 'dallasclean.com'})
CREATE (:Prospect {id: 'P024', name: 'Texas Pest Patrol', score: 72, status: 'RESEARCHING', website: 'txpestpatrol.com'})
CREATE (:Prospect {id: 'P025', name: 'Gulf Coast Pools', score: 77, status: 'QUALIFIED', website: 'gulfcoastpools.com'})
CREATE (:Prospect {id: 'P026', name: 'Houston Hardwood', score: 64, status: 'RESEARCHING', website: 'houstonhardwood.com'})
CREATE (:Prospect {id: 'P027', name: 'Texas Security Systems', score: 89, status: 'QUALIFIED', website: 'txsecurity.com'})
CREATE (:Prospect {id: 'P028', name: 'Dallas Tree Care', score: 66, status: 'RESEARCHING', website: 'dallastreecare.com'})
CREATE (:Prospect {id: 'P029', name: 'Houston Water Pure', score: 73, status: 'QUALIFIED', website: 'houstonwaterpure.com'})
CREATE (:Prospect {id: 'P030', name: 'Lone Star Remodel', score: 91, status: 'QUALIFIED', website: 'lonestarremodel.com'})

// Batch 3: Atlanta/Southeast (15)
CREATE (:Prospect {id: 'P031', name: 'Peachtree Plumbing', score: 80, status: 'QUALIFIED', website: 'peachtreeplumbing.com'})
CREATE (:Prospect {id: 'P032', name: 'Southern Comfort HVAC', score: 75, status: 'QUALIFIED', website: 'southerncomforthvac.com'})
CREATE (:Prospect {id: 'P033', name: 'Georgia Power Electric', score: 70, status: 'RESEARCHING', website: 'gapowerelectric.com'})
CREATE (:Prospect {id: 'P034', name: 'Atlanta Roof Masters', score: 87, status: 'QUALIFIED', website: 'atlroofmasters.com'})
CREATE (:Prospect {id: 'P035', name: 'Southern Scapes', score: 63, status: 'NEW', website: 'southernscapes.com'})
CREATE (:Prospect {id: 'P036', name: 'Magnolia Painters', score: 57, status: 'NEW', website: 'magnoliapainters.com'})
CREATE (:Prospect {id: 'P037', name: 'Dixie Concrete', score: 82, status: 'QUALIFIED', website: 'dixieconcrete.com'})
CREATE (:Prospect {id: 'P038', name: 'Atlanta Sparkle Clean', score: 53, status: 'NEW', website: 'atlsparkle.com'})
CREATE (:Prospect {id: 'P039', name: 'Southern Pest Defense', score: 71, status: 'RESEARCHING', website: 'southernpestdefense.com'})
CREATE (:Prospect {id: 'P040', name: 'Georgia Pool Pros', score: 74, status: 'QUALIFIED', website: 'gapoolpros.com'})
CREATE (:Prospect {id: 'P041', name: 'Peachtree Floors', score: 60, status: 'NEW', website: 'peachtreefloors.com'})
CREATE (:Prospect {id: 'P042', name: 'Atlanta Lock & Key', score: 68, status: 'RESEARCHING', website: 'atllockkey.com'})
CREATE (:Prospect {id: 'P043', name: 'Southern Solar Co', score: 90, status: 'QUALIFIED', website: 'southernsolar.com'})
CREATE (:Prospect {id: 'P044', name: 'Georgia Tree Service', score: 65, status: 'RESEARCHING', website: 'gatreeservice.com'})
CREATE (:Prospect {id: 'P045', name: 'Atlanta Home Guard', score: 88, status: 'QUALIFIED', website: 'atlhomeguard.com'})

// Batch 4: Chicago/Midwest (15)
CREATE (:Prospect {id: 'P046', name: 'Windy City Plumbing', score: 81, status: 'QUALIFIED', website: 'windycityplumbing.com'})
CREATE (:Prospect {id: 'P047', name: 'Chicago Climate Control', score: 76, status: 'QUALIFIED', website: 'chicagoclimate.com'})
CREATE (:Prospect {id: 'P048', name: 'Midwest Electric Pro', score: 69, status: 'RESEARCHING', website: 'midwestelectric.com'})
CREATE (:Prospect {id: 'P049', name: 'Chi-Town Roofing', score: 85, status: 'QUALIFIED', website: 'chitownroofing.com'})
CREATE (:Prospect {id: 'P050', name: 'Prairie Landscaping', score: 62, status: 'NEW', website: 'prairielandscape.com'})
CREATE (:Prospect {id: 'P051', name: 'Chicago Paint Works', score: 58, status: 'NEW', website: 'chicagopaintworks.com'})
CREATE (:Prospect {id: 'P052', name: 'Midwest Masonry', score: 79, status: 'QUALIFIED', website: 'midwestmasonry.com'})
CREATE (:Prospect {id: 'P053', name: 'Windy City Clean', score: 55, status: 'NEW', website: 'windycityclean.com'})
CREATE (:Prospect {id: 'P054', name: 'Chicago Pest Guard', score: 70, status: 'RESEARCHING', website: 'chipestguard.com'})
CREATE (:Prospect {id: 'P055', name: 'Lake Michigan Pools', score: 73, status: 'QUALIFIED', website: 'lakemichiganpools.com'})
CREATE (:Prospect {id: 'P056', name: 'Chicago Hardwood', score: 61, status: 'NEW', website: 'chicagohardwood.com'})
CREATE (:Prospect {id: 'P057', name: 'Midwest Security Pro', score: 87, status: 'QUALIFIED', website: 'midwestsecurity.com'})
CREATE (:Prospect {id: 'P058', name: 'Chicago Tree Experts', score: 64, status: 'RESEARCHING', website: 'chitreeexperts.com'})
CREATE (:Prospect {id: 'P059', name: 'Windy City Water', score: 72, status: 'QUALIFIED', website: 'windycitywater.com'})
CREATE (:Prospect {id: 'P060', name: 'Chicago Remodel Pro', score: 89, status: 'QUALIFIED', website: 'chicagoremodel.com'})

// Batch 5: Florida Markets (15)
CREATE (:Prospect {id: 'P061', name: 'Sunshine Plumbing', score: 82, status: 'QUALIFIED', website: 'sunshineplumbing.com'})
CREATE (:Prospect {id: 'P062', name: 'Florida Cool Air', score: 77, status: 'QUALIFIED', website: 'flcoolair.com'})
CREATE (:Prospect {id: 'P063', name: 'Palm Electric Services', score: 71, status: 'RESEARCHING', website: 'palmelectric.com'})
CREATE (:Prospect {id: 'P064', name: 'Tropical Roofing', score: 86, status: 'QUALIFIED', website: 'tropicalroofing.com'})
CREATE (:Prospect {id: 'P065', name: 'Florida Green Lawns', score: 64, status: 'NEW', website: 'flgreenlawns.com'})
CREATE (:Prospect {id: 'P066', name: 'Coastal Painters', score: 59, status: 'NEW', website: 'coastalpainters.com'})
CREATE (:Prospect {id: 'P067', name: 'Sunshine Concrete', score: 80, status: 'QUALIFIED', website: 'sunshineconcrete.com'})
CREATE (:Prospect {id: 'P068', name: 'Florida Fresh Clean', score: 54, status: 'NEW', website: 'flfreshclean.com'})
CREATE (:Prospect {id: 'P069', name: 'Tropical Pest Control', score: 73, status: 'RESEARCHING', website: 'tropicalpest.com'})
CREATE (:Prospect {id: 'P070', name: 'Paradise Pool Care', score: 78, status: 'QUALIFIED', website: 'paradisepoolcare.com'})
CREATE (:Prospect {id: 'P071', name: 'Florida Tile & Floor', score: 63, status: 'NEW', website: 'fltilefloor.com'})
CREATE (:Prospect {id: 'P072', name: 'Coastal Security', score: 88, status: 'QUALIFIED', website: 'coastalsecurity.com'})
CREATE (:Prospect {id: 'P073', name: 'Palm Tree Services', score: 66, status: 'RESEARCHING', website: 'palmtreeservices.com'})
CREATE (:Prospect {id: 'P074', name: 'Florida Pure Water', score: 74, status: 'QUALIFIED', website: 'flpurewater.com'})
CREATE (:Prospect {id: 'P075', name: 'Sunshine Remodeling', score: 90, status: 'QUALIFIED', website: 'sunshineremodel.com'})

// Batch 6: Denver/Mountain West (15)
CREATE (:Prospect {id: 'P076', name: 'Rocky Mountain Plumbing', score: 79, status: 'QUALIFIED', website: 'rockymtnplumbing.com'})
CREATE (:Prospect {id: 'P077', name: 'Mile High HVAC', score: 75, status: 'QUALIFIED', website: 'milehighhvac.com'})
CREATE (:Prospect {id: 'P078', name: 'Colorado Electric Co', score: 68, status: 'RESEARCHING', website: 'coelectricco.com'})
CREATE (:Prospect {id: 'P079', name: 'Denver Roof Experts', score: 84, status: 'QUALIFIED', website: 'denverroofexperts.com'})
CREATE (:Prospect {id: 'P080', name: 'Mountain Landscaping', score: 61, status: 'NEW', website: 'mountainlandscape.com'})
CREATE (:Prospect {id: 'P081', name: 'Denver Paint Pro', score: 56, status: 'NEW', website: 'denverpaintpro.com'})
CREATE (:Prospect {id: 'P082', name: 'Rocky Concrete Works', score: 78, status: 'QUALIFIED', website: 'rockyconcrete.com'})
CREATE (:Prospect {id: 'P083', name: 'Mile High Clean', score: 52, status: 'NEW', website: 'milehighclean.com'})
CREATE (:Prospect {id: 'P084', name: 'Colorado Pest Solutions', score: 69, status: 'RESEARCHING', website: 'copestsolutions.com'})
CREATE (:Prospect {id: 'P085', name: 'Denver Pool Masters', score: 72, status: 'QUALIFIED', website: 'denverpoolmasters.com'})
CREATE (:Prospect {id: 'P086', name: 'Mountain Flooring', score: 60, status: 'NEW', website: 'mountainflooring.com'})
CREATE (:Prospect {id: 'P087', name: 'Denver Lock Pro', score: 67, status: 'RESEARCHING', website: 'denverlockpro.com'})
CREATE (:Prospect {id: 'P088', name: 'Rocky Solar Systems', score: 91, status: 'QUALIFIED', website: 'rockysolarsystems.com'})
CREATE (:Prospect {id: 'P089', name: 'Colorado Tree Care', score: 63, status: 'NEW', website: 'cotreecare.com'})
CREATE (:Prospect {id: 'P090', name: 'Denver Home Security', score: 86, status: 'QUALIFIED', website: 'denverhomesecurity.com'})

// Batch 7: Pacific Northwest (15)
CREATE (:Prospect {id: 'P091', name: 'Emerald City Plumbing', score: 80, status: 'QUALIFIED', website: 'emeraldcityplumbing.com'})
CREATE (:Prospect {id: 'P092', name: 'Pacific HVAC Solutions', score: 74, status: 'QUALIFIED', website: 'pacifichvac.com'})
CREATE (:Prospect {id: 'P093', name: 'Northwest Electric', score: 69, status: 'RESEARCHING', website: 'nwelectric.com'})
CREATE (:Prospect {id: 'P094', name: 'Seattle Roof Pros', score: 83, status: 'QUALIFIED', website: 'seattleroofpros.com'})
CREATE (:Prospect {id: 'P095', name: 'Evergreen Landscaping', score: 62, status: 'NEW', website: 'evergreenlandscape.com'})
CREATE (:Prospect {id: 'P096', name: 'Portland Paint Masters', score: 57, status: 'NEW', website: 'portlandpaint.com'})
CREATE (:Prospect {id: 'P097', name: 'Pacific Concrete', score: 77, status: 'QUALIFIED', website: 'pacificconcrete.com'})
CREATE (:Prospect {id: 'P098', name: 'Seattle Clean Pro', score: 53, status: 'NEW', website: 'seattlecleanpro.com'})
CREATE (:Prospect {id: 'P099', name: 'Northwest Pest Guard', score: 70, status: 'RESEARCHING', website: 'nwpestguard.com'})
CREATE (:Prospect {id: 'P100', name: 'Cascade Pool Service', score: 71, status: 'QUALIFIED', website: 'cascadepoolservice.com'})
CREATE (:Prospect {id: 'P101', name: 'Portland Hardwood', score: 59, status: 'NEW', website: 'portlandhardwood.com'})
CREATE (:Prospect {id: 'P102', name: 'Pacific Security Systems', score: 85, status: 'QUALIFIED', website: 'pacificsecurity.com'})
CREATE (:Prospect {id: 'P103', name: 'Seattle Tree Experts', score: 64, status: 'RESEARCHING', website: 'seattletreeexperts.com'})
CREATE (:Prospect {id: 'P104', name: 'Northwest Water Pure', score: 72, status: 'QUALIFIED', website: 'nwwaterpure.com'})
CREATE (:Prospect {id: 'P105', name: 'Portland Remodel Co', score: 88, status: 'QUALIFIED', website: 'portlandremodel.com'})

// Batch 8: California Markets (15)
CREATE (:Prospect {id: 'P106', name: 'Golden State Plumbing', score: 81, status: 'QUALIFIED', website: 'goldenstateplumbing.com'})
CREATE (:Prospect {id: 'P107', name: 'California Cool HVAC', score: 76, status: 'QUALIFIED', website: 'cacoolhvac.com'})
CREATE (:Prospect {id: 'P108', name: 'Bay Area Electric', score: 70, status: 'RESEARCHING', website: 'bayareaelectric.com'})
CREATE (:Prospect {id: 'P109', name: 'SoCal Roofing', score: 85, status: 'QUALIFIED', website: 'socalroofing.com'})
CREATE (:Prospect {id: 'P110', name: 'California Green Scapes', score: 63, status: 'NEW', website: 'cagreenscapes.com'})
CREATE (:Prospect {id: 'P111', name: 'San Diego Painters', score: 58, status: 'NEW', website: 'sandiegopainters.com'})
CREATE (:Prospect {id: 'P112', name: 'Pacific Coast Concrete', score: 79, status: 'QUALIFIED', website: 'pacificcoastconcrete.com'})
CREATE (:Prospect {id: 'P113', name: 'LA Clean Services', score: 54, status: 'NEW', website: 'lacleanservices.com'})
CREATE (:Prospect {id: 'P114', name: 'California Pest Pro', score: 71, status: 'RESEARCHING', website: 'capestpro.com'})
CREATE (:Prospect {id: 'P115', name: 'SoCal Pool Care', score: 75, status: 'QUALIFIED', website: 'socalpoolcare.com'})
CREATE (:Prospect {id: 'P116', name: 'Bay Area Flooring', score: 61, status: 'NEW', website: 'bayareaflooring.com'})
CREATE (:Prospect {id: 'P117', name: 'California Security Pro', score: 87, status: 'QUALIFIED', website: 'casecuritypro.com'})
CREATE (:Prospect {id: 'P118', name: 'San Diego Tree Service', score: 65, status: 'RESEARCHING', website: 'sdtreeservice.com'})
CREATE (:Prospect {id: 'P119', name: 'Golden State Water', score: 73, status: 'QUALIFIED', website: 'goldenstatewater.com'})
CREATE (:Prospect {id: 'P120', name: 'California Dream Remodel', score: 89, status: 'QUALIFIED', website: 'cadreamremodel.com'});

// ============================================
// CREATE RELATIONSHIPS
// ============================================

// Connect Clients to Industries and Locations
MATCH (c:Client {id: 'C001'}), (i:Industry {name: 'Property Management'}), (l:Location {city: 'Phoenix'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C002'}), (i:Industry {name: 'General Contracting'}), (l:Location {city: 'Dallas'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C003'}), (i:Industry {name: 'Home Services'}), (l:Location {city: 'Atlanta'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C004'}), (i:Industry {name: 'HVAC Commercial'}), (l:Location {city: 'Chicago'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C005'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Miami'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C006'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Denver'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C007'}), (i:Industry {name: 'Electrical Commercial'}), (l:Location {city: 'Seattle'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C008'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'San Diego'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C009'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Houston'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C010'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Los Angeles'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C011'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Austin'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C012'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Tampa'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C013'}), (i:Industry {name: 'Commercial Plumbing'}), (l:Location {city: 'Portland'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C014'}), (i:Industry {name: 'Locksmith'}), (l:Location {city: 'Las Vegas'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C015'}), (i:Industry {name: 'Solar Installation'}), (l:Location {city: 'San Francisco'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C016'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Nashville'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C017'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'Charlotte'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C018'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Raleigh'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C019'}), (i:Industry {name: 'Water Treatment'}), (l:Location {city: 'Orlando'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

MATCH (c:Client {id: 'C020'}), (i:Industry {name: 'Remodeling'}), (l:Location {city: 'San Antonio'})
CREATE (c)-[:IN_INDUSTRY]->(i), (c)-[:LOCATED_IN]->(l);

// Connect Prospects to Industries and Locations (Phoenix batch)
MATCH (p:Prospect {id: 'P001'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P002'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P003'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'Scottsdale'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P004'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P005'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Mesa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P006'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P007'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Scottsdale'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P008'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P009'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Mesa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P010'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P011'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Scottsdale'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P012'}), (i:Industry {name: 'Windows & Doors'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P013'}), (i:Industry {name: 'Garage Doors'}), (l:Location {city: 'Mesa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P014'}), (i:Industry {name: 'Fencing'}), (l:Location {city: 'Phoenix'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P015'}), (i:Industry {name: 'Solar Installation'}), (l:Location {city: 'Scottsdale'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// Connect Prospects to Industries and Locations (Texas batch)
MATCH (p:Prospect {id: 'P016'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'Dallas'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P017'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Houston'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P018'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'Dallas'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P019'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Dallas'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P020'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Houston'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P021'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Houston'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P022'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'San Antonio'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P023'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Dallas'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P024'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Austin'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P025'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'Houston'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P026'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Houston'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P027'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Dallas'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P028'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'Dallas'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P029'}), (i:Industry {name: 'Water Treatment'}), (l:Location {city: 'Houston'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P030'}), (i:Industry {name: 'Remodeling'}), (l:Location {city: 'Austin'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// Continue with remaining prospects (Atlanta batch)
MATCH (p:Prospect {id: 'P031'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P032'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P033'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P034'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P035'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P036'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P037'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P038'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P039'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P040'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P041'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P042'}), (i:Industry {name: 'Locksmith'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P043'}), (i:Industry {name: 'Solar Installation'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P044'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P045'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Atlanta'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// Chicago batch
MATCH (p:Prospect {id: 'P046'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P047'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P048'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P049'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P050'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P051'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P052'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P053'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P054'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P055'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P056'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P057'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P058'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P059'}), (i:Industry {name: 'Water Treatment'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P060'}), (i:Industry {name: 'Remodeling'}), (l:Location {city: 'Chicago'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// Florida batch
MATCH (p:Prospect {id: 'P061'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'Miami'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P062'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Tampa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P063'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'Orlando'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P064'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Miami'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P065'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Tampa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P066'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Orlando'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P067'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Miami'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P068'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Tampa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P069'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Orlando'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P070'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'Miami'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P071'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Tampa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P072'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Orlando'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P073'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'Miami'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P074'}), (i:Industry {name: 'Water Treatment'}), (l:Location {city: 'Tampa'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P075'}), (i:Industry {name: 'Remodeling'}), (l:Location {city: 'Orlando'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// Denver batch
MATCH (p:Prospect {id: 'P076'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P077'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P078'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P079'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P080'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P081'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P082'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P083'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P084'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P085'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P086'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P087'}), (i:Industry {name: 'Locksmith'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P088'}), (i:Industry {name: 'Solar Installation'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P089'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P090'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Denver'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// Pacific Northwest batch
MATCH (p:Prospect {id: 'P091'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P092'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Portland'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P093'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P094'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P095'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Portland'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P096'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'Portland'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P097'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P098'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P099'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'Portland'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P100'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P101'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'Portland'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P102'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P103'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'Seattle'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P104'}), (i:Industry {name: 'Water Treatment'}), (l:Location {city: 'Portland'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P105'}), (i:Industry {name: 'Remodeling'}), (l:Location {city: 'Portland'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// California batch
MATCH (p:Prospect {id: 'P106'}), (i:Industry {name: 'Residential Plumbing'}), (l:Location {city: 'San Diego'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P107'}), (i:Industry {name: 'HVAC Residential'}), (l:Location {city: 'Los Angeles'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P108'}), (i:Industry {name: 'Electrical Residential'}), (l:Location {city: 'San Francisco'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P109'}), (i:Industry {name: 'Roofing'}), (l:Location {city: 'San Diego'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P110'}), (i:Industry {name: 'Landscaping'}), (l:Location {city: 'Los Angeles'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P111'}), (i:Industry {name: 'Painting'}), (l:Location {city: 'San Diego'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P112'}), (i:Industry {name: 'Concrete & Masonry'}), (l:Location {city: 'Los Angeles'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P113'}), (i:Industry {name: 'Cleaning Services'}), (l:Location {city: 'Los Angeles'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P114'}), (i:Industry {name: 'Pest Control'}), (l:Location {city: 'San Francisco'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P115'}), (i:Industry {name: 'Pool Services'}), (l:Location {city: 'San Diego'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P116'}), (i:Industry {name: 'Flooring'}), (l:Location {city: 'San Francisco'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P117'}), (i:Industry {name: 'Home Security'}), (l:Location {city: 'Los Angeles'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P118'}), (i:Industry {name: 'Tree Services'}), (l:Location {city: 'San Diego'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P119'}), (i:Industry {name: 'Water Treatment'}), (l:Location {city: 'San Francisco'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

MATCH (p:Prospect {id: 'P120'}), (i:Industry {name: 'Remodeling'}), (l:Location {city: 'Los Angeles'})
CREATE (p)-[:IN_INDUSTRY]->(i), (p)-[:LOCATED_IN]->(l);

// Connect Prospects to Services (sample - 200 relationships)
MATCH (p:Prospect {id: 'P001'}), (s:Service {name: 'Emergency Repair'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P001'}), (s:Service {name: 'Residential Services'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P002'}), (s:Service {name: 'Installation'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P002'}), (s:Service {name: 'Scheduled Maintenance'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P003'}), (s:Service {name: 'Emergency Repair'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P003'}), (s:Service {name: 'Residential Services'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P004'}), (s:Service {name: 'Installation'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P004'}), (s:Service {name: 'Inspection'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P005'}), (s:Service {name: 'Scheduled Maintenance'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

MATCH (p:Prospect {id: 'P005'}), (s:Service {name: 'Design Services'})
CREATE (p)-[:OFFERS_SERVICE]->(s);

// Add more service relationships for variety (continuing pattern for first 50 prospects)
MATCH (p:Prospect), (s:Service)
WHERE p.id IN ['P006', 'P007', 'P008', 'P009', 'P010', 'P011', 'P012', 'P013', 'P014', 'P015',
               'P016', 'P017', 'P018', 'P019', 'P020', 'P021', 'P022', 'P023', 'P024', 'P025',
               'P026', 'P027', 'P028', 'P029', 'P030', 'P031', 'P032', 'P033', 'P034', 'P035',
               'P036', 'P037', 'P038', 'P039', 'P040', 'P041', 'P042', 'P043', 'P044', 'P045',
               'P046', 'P047', 'P048', 'P049', 'P050']
  AND s.name IN ['Residential Services', 'Commercial Services', 'Emergency Repair', 'Scheduled Maintenance']
  AND rand() < 0.4
CREATE (p)-[:OFFERS_SERVICE]->(s);

// Connect Prospects to Leads (40 conversions)
MATCH (p:Prospect {id: 'P001'}), (l:Lead {id: 'L001'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P002'}), (l:Lead {id: 'L002'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P003'}), (l:Lead {id: 'L003'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P004'}), (l:Lead {id: 'L004'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P005'}), (l:Lead {id: 'L005'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P006'}), (l:Lead {id: 'L006'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P007'}), (l:Lead {id: 'L007'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P008'}), (l:Lead {id: 'L008'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P009'}), (l:Lead {id: 'L009'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P010'}), (l:Lead {id: 'L010'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P011'}), (l:Lead {id: 'L011'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P012'}), (l:Lead {id: 'L012'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P016'}), (l:Lead {id: 'L013'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P042'}), (l:Lead {id: 'L014'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P015'}), (l:Lead {id: 'L015'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P011'}), (l:Lead {id: 'L016'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P044'}), (l:Lead {id: 'L017'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P045'}), (l:Lead {id: 'L018'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P029'}), (l:Lead {id: 'L019'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P030'}), (l:Lead {id: 'L020'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P031'}), (l:Lead {id: 'L021'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P032'}), (l:Lead {id: 'L022'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P033'}), (l:Lead {id: 'L023'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P034'}), (l:Lead {id: 'L024'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P035'}), (l:Lead {id: 'L025'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P036'}), (l:Lead {id: 'L026'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P037'}), (l:Lead {id: 'L027'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P038'}), (l:Lead {id: 'L028'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P039'}), (l:Lead {id: 'L029'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P040'}), (l:Lead {id: 'L030'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P046'}), (l:Lead {id: 'L031'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P051'}), (l:Lead {id: 'L032'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P061'}), (l:Lead {id: 'L033'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P087'}), (l:Lead {id: 'L034'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P088'}), (l:Lead {id: 'L035'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P101'}), (l:Lead {id: 'L036'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P103'}), (l:Lead {id: 'L037'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P117'}), (l:Lead {id: 'L038'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P119'}), (l:Lead {id: 'L039'})
CREATE (p)-[:CONVERTED_TO]->(l);

MATCH (p:Prospect {id: 'P120'}), (l:Lead {id: 'L040'})
CREATE (p)-[:CONVERTED_TO]->(l);

// Connect Leads to Clients (40 assignments)
MATCH (l:Lead {id: 'L001'}), (c:Client {id: 'C013'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L002'}), (c:Client {id: 'C004'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L003'}), (c:Client {id: 'C007'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L004'}), (c:Client {id: 'C005'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L005'}), (c:Client {id: 'C006'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L006'}), (c:Client {id: 'C012'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L007'}), (c:Client {id: 'C011'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L008'}), (c:Client {id: 'C010'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L009'}), (c:Client {id: 'C009'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L010'}), (c:Client {id: 'C008'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L011'}), (c:Client {id: 'C011'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L012'}), (c:Client {id: 'C012'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L013'}), (c:Client {id: 'C013'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L014'}), (c:Client {id: 'C014'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L015'}), (c:Client {id: 'C015'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L016'}), (c:Client {id: 'C016'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L017'}), (c:Client {id: 'C017'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L018'}), (c:Client {id: 'C018'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L019'}), (c:Client {id: 'C019'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L020'}), (c:Client {id: 'C020'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L021'}), (c:Client {id: 'C013'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L022'}), (c:Client {id: 'C004'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L023'}), (c:Client {id: 'C007'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L024'}), (c:Client {id: 'C005'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L025'}), (c:Client {id: 'C006'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L026'}), (c:Client {id: 'C012'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L027'}), (c:Client {id: 'C011'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L028'}), (c:Client {id: 'C010'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L029'}), (c:Client {id: 'C009'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L030'}), (c:Client {id: 'C008'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L031'}), (c:Client {id: 'C011'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L032'}), (c:Client {id: 'C012'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L033'}), (c:Client {id: 'C013'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L034'}), (c:Client {id: 'C014'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L035'}), (c:Client {id: 'C015'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L036'}), (c:Client {id: 'C016'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L037'}), (c:Client {id: 'C017'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L038'}), (c:Client {id: 'C018'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L039'}), (c:Client {id: 'C019'})
CREATE (l)-[:ASSIGNED_TO]->(c);

MATCH (l:Lead {id: 'L040'}), (c:Client {id: 'C020'})
CREATE (l)-[:ASSIGNED_TO]->(c);

// Create SIMILAR_TO relationships between prospects (60 similarity connections based on industry + location)
MATCH (p1:Prospect)-[:IN_INDUSTRY]->(i:Industry)<-[:IN_INDUSTRY]-(p2:Prospect)
WHERE p1.id < p2.id AND p1.score > 70 AND p2.score > 70
WITH p1, p2, i
LIMIT 60
CREATE (p1)-[:SIMILAR_TO {reason: 'Same industry, high scores'}]->(p2);

// Create referral network between clients (8 referrals)
MATCH (c1:Client {id: 'C002'}), (c2:Client {id: 'C001'})
CREATE (c1)-[:REFERRED_BY]->(c2);

MATCH (c1:Client {id: 'C003'}), (c2:Client {id: 'C001'})
CREATE (c1)-[:REFERRED_BY]->(c2);

MATCH (c1:Client {id: 'C007'}), (c2:Client {id: 'C004'})
CREATE (c1)-[:REFERRED_BY]->(c2);

MATCH (c1:Client {id: 'C010'}), (c2:Client {id: 'C009'})
CREATE (c1)-[:REFERRED_BY]->(c2);

MATCH (c1:Client {id: 'C012'}), (c2:Client {id: 'C011'})
CREATE (c1)-[:REFERRED_BY]->(c2);

MATCH (c1:Client {id: 'C015'}), (c2:Client {id: 'C014'})
CREATE (c1)-[:REFERRED_BY]->(c2);

MATCH (c1:Client {id: 'C018'}), (c2:Client {id: 'C017'})
CREATE (c1)-[:REFERRED_BY]->(c2);

MATCH (c1:Client {id: 'C020'}), (c2:Client {id: 'C019'})
CREATE (c1)-[:REFERRED_BY]->(c2);

// ============================================
// VERIFICATION QUERY
// ============================================
// Count all nodes and relationships
MATCH (n) RETURN labels(n)[0] as Type, count(n) as Count
UNION
MATCH ()-[r]->() RETURN type(r) as Type, count(r) as Count;
