CREATE TABLE twofactor (
  uuid      VARCHAR(255)     NOT NULL PRIMARY KEY,
  user_uuid VARCHAR(255)     NOT NULL REFERENCES users (uuid),
  type      INTEGER  NOT NULL,
  enabled   BOOLEAN  NOT NULL,
  data      VARCHAR(255)     NOT NULL,

  UNIQUE (user_uuid, type)
);


INSERT INTO twofactor (uuid, user_uuid, type, enabled, data) 
SELECT lower(hex(randomblob(16))) , uuid, 0, 1, u.totp_secret FROM users u where u.totp_secret IS NOT NULL;

UPDATE users SET totp_secret = NULL; -- Instead of recreating the table, just leave the columns empty
