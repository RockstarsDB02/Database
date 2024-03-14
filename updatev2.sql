-- Add "flagged" bool to "answer" table, that is false by default

ALTER TABLE answer ADD COLUMN flagged BOOLEAN DEFAULT FALSE;