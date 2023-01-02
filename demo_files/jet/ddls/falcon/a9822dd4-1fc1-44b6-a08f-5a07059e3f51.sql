/*
Database "a9822dd4-1fc1-44b6-a08f-5a07059e3f51" guid = 2d98e514-0e59-4d56-802f-a4a9d79fe673
 */
CREATE DATABASE "a9822dd4-1fc1-44b6-a08f-5a07059e3f51";

USE "a9822dd4-1fc1-44b6-a08f-5a07059e3f51";


/*
Schema "dev_saas_clusters_Y6qeCEI" guid = fa74abeb-6233-41b2-8bae-6f0179c023a4
 */
CREATE SCHEMA "dev_saas_clusters_Y6qeCEI";


/*
Table "table_this_cluster_credits" guid = db4e56e4-726c-4ac9-b03f-00261e33293a
Column "id" guid = d9c5cb6e-da78-47e6-ae51-913aee5d5485"id" compression AUTO
Column "cluster_id" guid = c39cba34-1385-4afe-9acf-93637aa341da"cluster_id" compression AUTO
Column "updated_at" guid = 06a72396-270d-43e5-9abb-3d582d548485"updated_at" compression AUTO
Column "credits" guid = 6a53cc81-3f8b-4a2a-913f-e7acfffac961"credits" compression AUTO
 */
CREATE TABLE "dev_saas_clusters_Y6qeCEI"."table_this_cluster_credits" (
  "id" bigint,
  "cluster_id" varchar(0),
  "updated_at" DATETIME,
  "credits" bigint
);


/*
Table "table_this_cluster_user_activity" guid = c3ad83b2-4b91-4eab-8c9b-88ee8c6523de
Column "id" guid = d0bc7008-16b4-42b3-b4aa-c29eb3390965"id" compression AUTO
Column "cluster_id" guid = 69fd957b-f072-4c3f-a7df-b8c5e6b08b1a"cluster_id" compression AUTO
Column "uguid" guid = cc9f4c47-17e0-4768-85dc-05e140b7c00f"uguid" compression AUTO
Column "event_timestamp" guid = f15a4fff-2464-4a7c-81ab-ea088d80586c"event_timestamp" compression AUTO
Column "server_event_time" guid = 331f671a-efb5-48b2-98df-acd8e1f50d09"server_event_time" compression AUTO
Column "event_name" guid = 3ac65e87-7c05-484e-9c3b-9bb05c4b3876"event_name" compression AUTO
Column "activity_window" guid = 0f228f62-3ded-4c5a-908d-a288e45244b0"activity_window" compression AUTO
Column "window_id" guid = 756af4a8-7dcd-40af-b5e0-a97a3eb01d0f"window_id" compression AUTO
Column "window_rank" guid = fd08d9cb-5aeb-4290-bfa0-3e4d62690e13"window_rank" compression AUTO
Column "http_method" guid = d5a976e3-7f2c-4076-b177-c64d080f3996"http_method" compression AUTO
Column "request" guid = 7e7b725b-c3d4-4359-9f9d-e02ebae47ed6"request" compression AUTO
Column "request_len" guid = f2dc65d1-533b-45d1-93c5-63b6e460e3c1"request_len" compression AUTO
Column "request_time" guid = f5246eb9-f5a0-4731-ac4d-c8c1b6b11d5a"request_time" compression AUTO
Column "rel_version" guid = bd9034be-2120-4885-8bcf-22778281d3f8"rel_version" compression AUTO
Column "bytes_sent" guid = 268696d8-fbea-41e9-9845-2fd9d19b71e4"bytes_sent" compression AUTO
Column "username" guid = b3a271de-6c4b-4601-a1fa-5e798c016333"username" compression AUTO
Live Schema Version 1
 */
CREATE TABLE "dev_saas_clusters_Y6qeCEI"."table_this_cluster_user_activity" (
  "id" bigint,
  "cluster_id" varchar(0),
  "uguid" varchar(0),
  "event_timestamp" bigint,
  "server_event_time" DATETIME,
  "event_name" varchar(0),
  "activity_window" int,
  "window_id" bigint,
  "window_rank" int,
  "http_method" varchar(0),
  "request" varchar(0),
  "request_len" int,
  "request_time" double,
  "rel_version" varchar(0),
  "bytes_sent" int,
  "username" varchar(0)
);
