/*
Database "34ae4719-2593-4ed4-ac3e-0ac797f0e7af" guid = 7559278d-60b5-4015-adcb-7584cc2537fd
 */
CREATE DATABASE "34ae4719-2593-4ed4-ac3e-0ac797f0e7af";

USE "34ae4719-2593-4ed4-ac3e-0ac797f0e7af";


/*
Schema "dev_saas_clusters_p8QznI4" guid = 0f43356d-f622-4a0c-bf89-8840e03e5ae6
 */
CREATE SCHEMA "dev_saas_clusters_p8QznI4";


/*
Table "table_this_cluster_credits" guid = 8fb10389-fac7-4132-a6e1-1984e4b5b0df
Column "id" guid = 6a7f5449-af17-42c7-81c5-712e6f0367c7"id" compression AUTO
Column "cluster_id" guid = 229b470e-30fa-435c-8e51-39b304a11737"cluster_id" compression AUTO
Column "updated_at" guid = f72c36af-2b4b-4f06-afda-c4f5fd79d868"updated_at" compression AUTO
Column "credits" guid = 1f698404-d3d2-4ad7-90d5-5704e23de9bf"credits" compression AUTO
 */
CREATE TABLE "dev_saas_clusters_p8QznI4"."table_this_cluster_credits" (
    "id" bigint,
    "cluster_id" varchar(0),
    "updated_at" DATETIME,
    "credits" bigint
);


/*
Table "table_this_cluster_user_activity" guid = fbdb0f33-ca8d-45b0-87ec-957a36eb7465
Column "id" guid = 2f3215ec-0324-4322-962f-92098de0f2bf"id" compression AUTO
Column "cluster_id" guid = c93b6dfb-9357-493e-bc0b-bb3c6deae78f"cluster_id" compression AUTO
Column "uguid" guid = 2ee3a4e1-d215-41e9-a6e0-6c4e302978ea"uguid" compression AUTO
Column "event_timestamp" guid = 599d0c3d-fc50-4e21-9710-08c39d412a0e"event_timestamp" compression AUTO
Column "server_event_time" guid = 3bb98de9-68f6-4797-82c9-0b53b097ead1"server_event_time" compression AUTO
Column "event_name" guid = 7e6b98bb-3a6a-4bd1-9c04-1e5ff69135b7"event_name" compression AUTO
Column "activity_window" guid = 0f9c74a0-12a3-4f17-b98e-8b901c96e76f"activity_window" compression AUTO
Column "window_id" guid = 34f4a43c-0f5d-43c4-b2ac-5d8e6250e391"window_id" compression AUTO
Column "window_rank" guid = b230c5ab-8623-4daa-a3d8-43594524857e"window_rank" compression AUTO
Column "http_method" guid = 53cb98a1-c86e-4f63-89bd-b1d69c7bd82f"http_method" compression AUTO
Column "request" guid = a6da7630-52e5-4a2d-b529-cbfa3948b04f"request" compression AUTO
Column "request_len" guid = 9733cd6d-da11-40c1-b8f2-cebffe324430"request_len" compression AUTO
Column "request_time" guid = ebbda734-d142-4ab8-814c-5057eece267d"request_time" compression AUTO
Column "rel_version" guid = 7399beb7-44f1-4c95-82f7-a1099ff45aeb"rel_version" compression AUTO
Column "bytes_sent" guid = 19176504-55a8-4f4a-8d64-1ef3d8ab2891"bytes_sent" compression AUTO
 */
CREATE TABLE "dev_saas_clusters_p8QznI4"."table_this_cluster_user_activity" (
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
    "bytes_sent" int
);
