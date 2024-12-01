# Normalization

There appear to be a transitive dependency in the host_id property of the Property table.
We can eliminate this by creating a new Host table with specific information about the host.

## Host table attributes

- *host_id*: PK, UUID, Indexed
  
- *user_id*: FK, references User(user_id)

- *created_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

- *updated_at*: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
  

## New Property table

- *property_id*: PK, UUID, Indexed
  
- *host_id*: FK, references Host(host_id)

- *name*: VARCHAR, NOT NULL

- *description*: TEXT, NOT NULL

- *location*: VARCHAR, NOT NULL

- *price_per_night*: DECIMAL, NOT NULL

- *created_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

- *updated_at*: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP


## Diagram

![Normalized E-R Diagram](https://github.com/user-attachments/assets/f818f1df-ae02-4e99-8d1d-090c7f1d601f)

