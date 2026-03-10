

Option 2: Airbnb Hospitality & Booking Trends 


-- =============Hosts Table====================
CREATE TABLE hosts (
    host_id INT PRIMARY KEY AUTO_INCREMENT,
    host_name VARCHAR(100),
    is_superhost BOOLEAN
);

-- =================Properties Table================
CREATE TABLE properties (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    host_id INT,
    property_type VARCHAR(50),
    location VARCHAR(100),
    price DECIMAL(10,2),
    rating DECIMAL(3,2),
    FOREIGN KEY (host_id) REFERENCES hosts(host_id)
);

-- ====================Guests Table=====================
CREATE TABLE guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_name VARCHAR(100),
    nationality VARCHAR(50),
    age INT
);

-- ==================Bookings Table====================
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT,
    guest_id INT,
    booking_date DATE,
    nights INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);

2. Key SQL Tasks
-- =======Host Success (Superhosts & Total Bookings)===========

SELECT h.host_name,
       h.is_superhost,
       COUNT(b.booking_id) AS Total_Bookings
FROM hosts h
JOIN properties p ON h.host_id = p.host_id
JOIN bookings b ON p.property_id = b.property_id
GROUP BY h.host_name, h.is_superhost
ORDER BY Total_Bookings DESC;

--  ================Property Revenue (Revenue by Property Type)======

SELECT p.property_type,
       SUM(b.total_price) AS Total_Revenue
FROM properties p
JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_type
ORDER BY Total_Revenue DESC;

-- ===========Guest Demographics (Average Price by Age Group)=========
SELECT CASE
           WHEN g.age < 25 THEN 'Under 25'
           WHEN g.age BETWEEN 25 AND 40 THEN '25-40'
           WHEN g.age BETWEEN 41 AND 60 THEN '41-60'
           ELSE '60+'
       END AS Age_Group,
       AVG(b.total_price) AS Avg_Booking_Price
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY Age_Group
ORDER BY Avg_Booking_Price DESC;

-- ========Booking Origins (Total Bookings by Nationality)=======
SELECT g.nationality,
       COUNT(b.booking_id) AS Total_Bookings
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY g.nationality
ORDER BY Total_Bookings DESC;

-- ========Rating Analysis (Properties with Avg Rating > 4.5)======
SELECT property_type,
       AVG(rating) AS Avg_Rating
FROM properties
GROUP BY property_type
HAVING AVG(rating) > 4.5
ORDER BY Avg_Rating DESC;

