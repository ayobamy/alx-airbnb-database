SELECT b.booking_id, b.user_id, u.first_name, u.last_name, u.email,
       b.property_id, p.name AS property_name, p.location,
       pa.payment_id, pa.amount, pa.payment_date, pa.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pa ON b.booking_id = pa.booking_id;
