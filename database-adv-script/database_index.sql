-- Create indexes
CREATE INDEX ON User (email);
CREATE INDEX ON User (user_id);
CREATE INDEX ON Booking (property_id);
CREATE INDEX ON Booking (user_id);
CREATE INDEX ON Booking (start_date, end_date);
CREATE INDEX ON Property (host_id);
CREATE INDEX ON Property (property_id);
