-- Example: database schema migration (PostgreSQL)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255),
  phone VARCHAR(30),
  role VARCHAR(16),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(128),
  organizer_id INTEGER REFERENCES users(id),
  genre VARCHAR(64),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE members (
  user_id INTEGER REFERENCES users(id),
  band_id INTEGER REFERENCES bands(id),
  joined_at TIMESTAMP,
  PRIMARY KEY (user_id, band_id)
);
CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  datetime TIMESTAMP,
  location VARCHAR(128),
  created_by INTEGER REFERENCES users(id),
  notes TEXT
);
CREATE TABLE attendance (
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  member_id INTEGER,
  status VARCHAR(16),
  PRIMARY KEY (rehearsal_id, member_id)
);
CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  message TEXT,
  sent_at TIMESTAMP,
  type VARCHAR(16)
);
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  member_id INTEGER,
  amount NUMERIC(10,2),
  status VARCHAR(16)
);
