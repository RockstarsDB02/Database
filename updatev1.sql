ALTER TABLE question RENAME COLUMN text TO description;
ALTER TABLE question ADD COLUMN title VARCHAR(255);