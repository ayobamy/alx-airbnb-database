-- Insert data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID(), 'Ahmed', 'Olawale', 'ayobamyahmed@gmail.com', 'abc123', '012345678', 'guest'),
  (UUID(), 'Jane', 'Doe', 'jane.doe@example.com', 'def456', '5678901245', 'host');

-- Insert data into Host table
INSERT INTO Host (host_id, user_id)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'jane.doe@example.com'));

-- Insert data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
  (UUID(), (SELECT host_id FROM Host WHERE user_id = (SELECT user_id FROM User WHERE email = 'jane.doe@example.com')), 'Cozy Apartment', 'A charming one-bedroom apartment in the heart of the city.', 'Ibadan', 150.00);

-- Insert data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), (SELECT user_id FROM User WHERE email = 'ayobamyahmed@gmail.com'), '2024-11-28', '2024-12-01', 900.00, 'confirmed');

-- Insert data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (UUID(), (SELECT booking_id FROM Booking WHERE user_id = (SELECT user_id FROM User WHERE email = 'ayobamyahmed@gmail.com') AND property_id = (SELECT property_id FROM Property WHERE name = 'Cozy Apartment')), 900.00, '2024-11-28', 'credit_card');

-- Insert data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), (SELECT user_id FROM User WHERE email = 'ayobamyahmed@gmail.com'), 4, 'Great apartment, perfect for my stay!');

-- Insert data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'ayobamyahmed@gmail.com'), (SELECT user_id FROM User WHERE email = 'jane.doe@example.com'), 'Hi, I booked the Cozy Apartment for my upcoming trip.', '2023-05-15 10:30:00'),
  (UUID(), (SELECT user_id FROM User WHERE email = 'jane.doe@example.com'), (SELECT user_id FROM User WHERE email = 'ayobamyahmed@gmail.com'), 'Wonderful, I'm glad you were able to book the apartment.', '2023-05-15 11:00:00');