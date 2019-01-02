create table if not exists attachments
(
  id text null,
  cipher_uuid text null,
  file_name text null,
  file_size int null,
  `key` text null
)
;

create table if not exists ciphers
(
  uuid varchar (255) NOT null PRIMARY KEY,
  created_at datetime null,
  updated_at datetime null,
  user_uuid text null,
  organization_uuid text null,
  type int null,
  name text null,
  notes text null,
  fields text null,
  data text null,
  favorite text null,
  password_history text null
)
;

create table if not exists ciphers_collections
(
  cipher_uuid text null,
  collection_uuid text null
)
;

create table if not exists collections
(
  uuid varchar (255) NOT null PRIMARY KEY,
  org_uuid text null,
  name text null
)
;

create table if not exists devices
(
  uuid varchar (255) NOT null PRIMARY KEY,
  created_at datetime null,
  updated_at datetime null,
  user_uuid text null,
  name text null,
  type int null,
  push_token text null,
  refresh_token text null,
  twofactor_remember text null
)
;

create table if not exists folders
(
  uuid varchar (255) NOT null PRIMARY KEY,
  created_at datetime null,
  updated_at datetime null,
  user_uuid text null,
  name text null
)
;

create table if not exists folders_ciphers
(
  cipher_uuid text null,
  folder_uuid text null
)
;

create table if not exists invitations
(
  email text null
)
;

create table if not exists organizations
(
  uuid varchar (255) NOT null PRIMARY KEY,
  name text null,
  billing_email text null
)
;

create table if not exists twofactor
(
  uuid varchar (255) NOT null PRIMARY KEY,
  user_uuid text null,
  type int null,
  enabled text null,
  data text null
)
;

create table if not exists users
(
  uuid varchar (255) NOT null PRIMARY KEY,
  created_at datetime null,
  updated_at datetime null,
  email text null,
  name text null,
  password_hash blob null,
  salt blob null,
  password_iterations int null,
  password_hint text null,
  `key` text null,
  private_key text null,
  public_key text null,
  totp_secret text null,
  totp_recover text null,
  security_stamp text null,
  equivalent_domains text null,
  excluded_globals text null,
  client_kdf_type int null,
  client_kdf_iter int null
)
;

create table if not exists users_collections
(
  user_uuid text null,
  collection_uuid text null,
  `read_only` text null
)
;

create table if not exists users_organizations
(
  uuid varchar (255) NOT null PRIMARY KEY,
  user_uuid text null,
  org_uuid text null,
  access_all text null,
  `key` text null,
  status int null,
  `type` int null
)
;

