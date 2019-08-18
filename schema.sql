CREATE DATABASE retrospection;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(300),
    password_digest VARCHAR(400),
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    details TEXT,
    start_at TIMESTAMPTZ,
    end_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE RESTRICT
);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    image_url TEXT,
    timestamp TIMESTAMPTZ,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    user_id INTEGER,
    event_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE RESTRICT,
    FOREIGN KEY (event_id) REFERENCES events (id) ON DELETE RESTRICT
);