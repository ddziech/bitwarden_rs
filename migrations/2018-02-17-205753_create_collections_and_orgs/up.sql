CREATE TABLE collections (
  uuid     VARCHAR(255) NOT NULL PRIMARY KEY,
  org_uuid VARCHAR(255) NOT NULL REFERENCES organizations (uuid),
  name     VARCHAR(255) NOT NULL
);

CREATE TABLE organizations (
  uuid          VARCHAR(255) NOT NULL PRIMARY KEY,
  name          VARCHAR(255) NOT NULL,
  billing_email VARCHAR(255) NOT NULL
);


CREATE TABLE users_collections (
  user_uuid       VARCHAR(255) NOT NULL REFERENCES users (uuid),
  collection_uuid VARCHAR(255) NOT NULL REFERENCES collections (uuid),
  PRIMARY KEY (user_uuid, collection_uuid)
);

CREATE TABLE users_organizations (
  uuid       VARCHAR(255)    NOT NULL PRIMARY KEY,
  user_uuid  VARCHAR(255)    NOT NULL REFERENCES users (uuid),
  org_uuid   VARCHAR(255)    NOT NULL REFERENCES organizations (uuid),

  access_all BOOLEAN NOT NULL,
  `key`        VARCHAR(255)    NOT NULL,
  status     INTEGER NOT NULL,
  type       INTEGER NOT NULL,

  UNIQUE (user_uuid, org_uuid)
);
