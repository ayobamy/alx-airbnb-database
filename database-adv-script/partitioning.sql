-- Partition Booking table
CREATE TABLE Booking_Partitioned (
  booking_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);

-- Create partitions for each quarter
CREATE TABLE Booking_Partitioned_Q1 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE Booking_Partitioned_Q2 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE Booking_Partitioned_Q3 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE Booking_Partitioned_Q4 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');
