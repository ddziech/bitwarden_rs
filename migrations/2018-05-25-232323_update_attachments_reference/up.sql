ALTER TABLE attachments RENAME TO oldAttachments;

CREATE TABLE attachments (
  id          VARCHAR(255)    NOT NULL PRIMARY KEY,
  cipher_uuid VARCHAR(255)    NOT NULL REFERENCES ciphers (uuid),
  file_name   VARCHAR(255)    NOT NULL,
  file_size   INTEGER NOT NULL

);

INSERT INTO attachments (id, cipher_uuid, file_name, file_size) 
SELECT id, cipher_uuid, file_name, file_size FROM oldAttachments;

DROP TABLE oldAttachments;
