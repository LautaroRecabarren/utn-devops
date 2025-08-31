CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  text VARCHAR(255) NOT NULL
);

INSERT INTO messages (text)
SELECT 'Database connected successfully'
WHERE NOT EXISTS (SELECT 1 FROM messages);
