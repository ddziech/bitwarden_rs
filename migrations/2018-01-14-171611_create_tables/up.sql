CREATE TABLE users (
  `uuid`                 VARCHAR(255)     NOT NULL PRIMARY KEY,
  `created_at`           DATETIME NOT NULL,
  `updated_at`           DATETIME NOT NULL,
  `email`                VARCHAR(255)     NOT NULL UNIQUE,
  `name`                 VARCHAR(255)     NOT NULL,
  `password_hash`        BLOB     NOT NULL,
  `salt`                 BLOB     NOT NULL,
  `password_iterations`  INTEGER  NOT NULL,
  `password_hint`        VARCHAR(255),
  `key`                 VARCHAR(255)     NOT NULL,
  `private_key`          VARCHAR(255),
  `public_key`           VARCHAR(255),
  `totp_secret`          VARCHAR(255),
  `totp_recover`         VARCHAR(255),
  `security_stamp`       VARCHAR(255)     NOT NULL,
  `equivalent_domains`   VARCHAR(255)     NOT NULL,
  `excluded_globals`     VARCHAR(255)     NOT NULL
);

CREATE TABLE devices (
  `uuid`          VARCHAR(255)     NOT NULL PRIMARY KEY,
  `created_at`    DATETIME NOT NULL,
  `updated_at`    DATETIME NOT NULL,
  `user_uuid`     VARCHAR(255)     NOT NULL REFERENCES users (uuid),
  `name`          VARCHAR(255)     NOT NULL,
  `type`          INTEGER  NOT NULL,
  `push_token`    VARCHAR(255),
  `refresh_token` VARCHAR(255)     NOT NULL
);

CREATE TABLE ciphers (
  `uuid`              VARCHAR(255)     NOT NULL PRIMARY KEY,
  `created_at`        DATETIME NOT NULL,
  `updated_at`        DATETIME NOT NULL,
  `user_uuid`         VARCHAR(255)     NOT NULL REFERENCES users (uuid),
  `folder_uuid`       VARCHAR(255) REFERENCES folders (uuid),
  `organization_uuid` VARCHAR(255),
  `type`              INTEGER  NOT NULL,
  `name`              VARCHAR(255)     NOT NULL,
  `notes`             VARCHAR(255),
  `fields`            VARCHAR(255),
  `data`              VARCHAR(255)     NOT NULL,
  `favorite`          BOOLEAN  NOT NULL
);

CREATE TABLE attachments (
  `id`          VARCHAR(255)    NOT NULL PRIMARY KEY,
  `cipher_uuid` VARCHAR(255)    NOT NULL REFERENCES ciphers (`uuid`),
  `file_name`   VARCHAR(255)    NOT NULL,
  `file_size`   INTEGER NOT NULL

);

CREATE TABLE folders (
  uuid       VARCHAR(255)     NOT NULL PRIMARY KEY,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  user_uuid  VARCHAR(255)     NOT NULL REFERENCES users (uuid),
  name       VARCHAR(255)     NOT NULL
);
