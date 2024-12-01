-- inner join
SELECT b.booking_id, b.user_id, u.first_name, u.last_name, u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;

-- left join
SELECT p.property_id, p.name, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

-- full outer join
SELECT u.user_id, u.first_name, u.last_name, b.booking_id, b.start_date, b.end_date
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
