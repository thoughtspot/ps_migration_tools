/*
Database "thoughtspot_internal_stats" guid = 06b7ff8b-0ccb-463d-9c81-ead8b9d994af
 */
CREATE DATABASE "thoughtspot_internal_stats";

USE "thoughtspot_internal_stats";


/*
Schema "falcon_default_schema" guid = 2734a6bc-a3f3-4fca-adc0-d2b1b2553974
 */
CREATE SCHEMA "falcon_default_schema";


/*
Table "stats_falcon_worker" guid = e43cad8a-3bda-471e-a220-cc7238f7ff82
Column "timestamp" guid = cc538e75-0667-457d-b6e7-4db6311c942c parsing hint %Y%m%d %H:%M:%S
Column "sunit_index" guid = 13908fe2-1509-4971-95ff-b427d3b769a7
Column "sunit_oid" guid = cb2c571a-df73-4c76-9acd-5cf51a1303dd
Column "pid" guid = cfa8b063-f51e-40da-b26c-0ecb73517a73
Column "hostname" guid = 1453adae-5024-49dd-8256-21640cd93f99
Column "common.uptime" guid = 9d454de3-199d-40e1-be6c-dd25d3b57e89
Column "falcon.worker.results_cache.byte_size" guid = e1196c84-72ed-4396-bedb-b99391502a55
Column "falcon.worker.results_cache.hits" guid = c691ec8a-2cf6-4430-b4db-e6f8d1cbe1f0
Column "falcon.worker.results_cache.lookups" guid = b3e0af29-176e-4c76-b4e5-d6633185e491
Column "falcon.worker.results_cache.num_entries" guid = 81c48957-79d6-45a6-83a3-6bb1b90697fe
Column "falcon.worker.compiler_cache.hits" guid = 71e0606d-cc72-44ac-98d7-bfcdf97d118e
Column "falcon.worker.compiler_cache.lookups" guid = 03d7e8b6-1f84-4d95-8a00-3a5863aa1efe
Column "falcon.worker.compiler_cache.num_entries" guid = c9beaccb-a4cd-4438-9be7-12de3bc70179
Column "rpc-falcon.FalconRequest-received" guid = 675b6b99-8f7a-42b8-b851-a0fd45f8e7a2
Column "rpc-falcon.FalconRequest-received-errors" guid = 5c2d737d-81c1-43ec-86e8-a681c9048ec1
Column "rpc-falcon.WorkerQueryRequest-received" guid = 6d4d7c3a-1fae-4d00-bf49-bec1ddfca649
Column "rpc-falcon.WorkerQueryRequest-received-errors" guid = 10383a27-798d-4a81-b9fb-c2575738b20a
Column "rpc-falcon.WorkerQueryRequest-sent" guid = 0b1a2249-7595-4f59-9844-1f12f2ffa08c
Column "rpc-falcon.WorkerQueryRequest-sent-errors" guid = 8eaca26d-03a2-4853-8856-60dfc6c89e0c
Live Schema Version 9
 */
CREATE TABLE "falcon_default_schema"."stats_falcon_worker" (
    "timestamp" DATETIME,
    "sunit_index" int,
    "sunit_oid" bigint,
    "pid" bigint,
    "hostname" varchar(255),
    "common.uptime" bigint,
    "falcon.worker.results_cache.byte_size" bigint,
    "falcon.worker.results_cache.hits" bigint,
    "falcon.worker.results_cache.lookups" bigint,
    "falcon.worker.results_cache.num_entries" bigint,
    "falcon.worker.compiler_cache.hits" bigint,
    "falcon.worker.compiler_cache.lookups" bigint,
    "falcon.worker.compiler_cache.num_entries" bigint,
    "rpc-falcon.FalconRequest-received" bigint,
    "rpc-falcon.FalconRequest-received-errors" bigint,
    "rpc-falcon.WorkerQueryRequest-received" bigint,
    "rpc-falcon.WorkerQueryRequest-received-errors" bigint,
    "rpc-falcon.WorkerQueryRequest-sent" bigint,
    "rpc-falcon.WorkerQueryRequest-sent-errors" bigint
);


/*
Table "stats_falcon_manager_falcon_manager" guid = dd09601a-7db2-48c3-ba1c-a83d4cc595a4
Column "timestamp" guid = b3e083a7-a879-47e3-817c-eb8df5be66c2 parsing hint %Y%m%d %H:%M:%S
Column "sunit_index" guid = 62eca1c7-32a5-474d-9249-ea34a05c7a69
Column "sunit_oid" guid = d063b8ce-2cd9-4538-913b-a9330ed66d7e
Column "pid" guid = 77de44c0-cee6-4e6e-b363-1bb0532e9d5d
Column "hostname" guid = 8d33f2ea-fc01-44ee-8e4e-00b81d15b61a
Column "common.uptime" guid = 35f78e45-cfa3-4981-89e0-089d3b7678b4
Column "rpc-falcon.StartLoadCycleRequest-received" guid = b832757f-7622-498d-a166-8ab2dd5eec56
Column "rpc-falcon.StartLoadCycleRequest-received-errors" guid = 7046de34-7f6e-4813-b46e-513d0fdb4cce
Column "rpc-falcon.EndLoadCycleRequest-received" guid = d502f0fd-d11b-4f4e-ab87-24c283770c53
Column "rpc-falcon.EndLoadCycleRequest-received-errors" guid = 4e74b12a-92eb-4c75-9371-fcaba2495add
Column "rpc-falcon.UpdateTableSetMappingRequest-received" guid = 1ab7bc4d-87b0-48c6-9ebb-455dd22a0cc2"rpc-falcon.UpdateTableSetMappingRequest-received" default null
Column "rpc-falcon.UpdateTableSetMappingRequest-received-errors" guid = 3abc9b23-692c-427e-9dc8-197c05fe1b7c"rpc-falcon.UpdateTableSetMappingRequest-received-errors" default null
Live Schema Version 3
 */
CREATE TABLE "falcon_default_schema"."stats_falcon_manager_falcon_manager" (
    "timestamp" DATETIME,
    "sunit_index" int,
    "sunit_oid" bigint,
    "pid" bigint,
    "hostname" varchar(255),
    "common.uptime" bigint,
    "rpc-falcon.StartLoadCycleRequest-received" bigint,
    "rpc-falcon.StartLoadCycleRequest-received-errors" bigint,
    "rpc-falcon.EndLoadCycleRequest-received" bigint,
    "rpc-falcon.EndLoadCycleRequest-received-errors" bigint,
    "rpc-falcon.UpdateTableSetMappingRequest-received" bigint,
    "rpc-falcon.UpdateTableSetMappingRequest-received-errors" bigint
);


/*
Table "stats_tomcat_tomcat" guid = 515072e3-faa0-4a03-ad80-550189e1e788
Column "timestamp" guid = 97207d72-837a-48af-af6f-4589de2cfb62 parsing hint %Y%m%d %H:%M:%S
Column "sunit_index" guid = 5104b798-c22a-443a-a29d-7fba20b445af
Column "sunit_oid" guid = 9a6934d1-7193-4248-9fe8-cec0c8862e5c
Column "pid" guid = 6c41be25-66cd-434e-beee-7d4223a268b0
Column "hostname" guid = ccfcb907-2132-4f31-bffd-b7448ccb3e8b
Column "response_us" guid = ed417650-59ee-4bfd-8495-fd38de4d6016
Column "response_size" guid = c185a350-e236-4d07-8087-413e7226b4bb
Column "incident_id" guid = 86669501-a2c7-4a80-a1a2-8352220a62ce
Column "url" guid = fce00560-9cd4-40eb-b441-820342a26ad1
Column "http_response_code" guid = 38252769-167c-4a95-bb50-4593380e610b
Column "user_guid" guid = 791f5a29-7464-4178-aeb0-0375a927ccca
Column "user_name" guid = 366af42b-941c-42e1-855d-a1225fd9b100
Column "user_locale" guid = a52ccfbb-9e74-4d70-afc9-e2945dd1fe8a
Column "user_timezone" guid = e03a352c-e043-4cb9-a890-8e3dd8c80a53
Column "session_id" guid = 7894a6a1-6d45-48fe-9a26-0a4bdf927261
Column "rdbms_access_time_us" guid = ba3386cd-9c63-4738-b297-10ca5d9db5d1
Column "rdbms_request_count" guid = 925b6681-2645-4c97-ad95-77fcdc9d348a
Column "falcon_access_time_us" guid = 117c36f5-539e-4283-8891-117b2ca28dd7
Column "num_measures" guid = ac8fa0e0-7623-4213-aa5c-f51c5ff2c97e
Column "num_attributes" guid = 4591c6a1-03e4-4c37-aa9d-4fab2f7c3d64
Column "num_group_limit_columns" guid = 4222337c-259a-47bc-99d4-07b9a456966e
Column "num_joins" guid = dc9c45bf-dcde-4884-bc4e-38de67f6ca91
Column "top_count" guid = cfcc1b5b-b68d-421f-ac5a-fa4e4c97fe6c
Column "growth_time_bucket" guid = 39ad003b-1eef-4fbd-ac90-10dede88a03a
Column "uses_system_table" guid = 51ec9c49-38eb-4268-b0a2-099f479a58d7
Column "uses_user_table" guid = 5af407e5-67e9-4420-b48c-294d31d8c018
Column "uses_worksheet" guid = 6378b161-74f6-4ecf-b459-dbacccfadaef
Column "query_text" guid = f854c2eb-c82e-45d2-bd78-0c08cf017d48
Column "answer_book_guid" guid = 19a297c7-69f8-467a-ad4c-896b82455123"answer_book_guid" default null
Column "answer_book_name" guid = cef59354-f01a-4b88-9472-5cac6cfdd5b8"answer_book_name" default null
Column "load_answer" guid = c9301479-f085-4343-aa28-69302a49c3ca"load_answer" default null
Column "load_pinboard" guid = bcb8521a-96b6-40c1-94b2-b06140d43d33"load_pinboard" default null
Column "error_code" guid = 6d0fc5c0-9d91-478e-be79-e161fb5b250f"error_code" default null
Column "error_string" guid = 06acc023-c3e8-4b69-9368-9cf0b9b8e6b9"error_string" default null
Column "memcache_access_time_us" guid = fc3b0564-e142-4702-a5d8-edec7a593196"memcache_access_time_us" default null
Column "num_visualizations" guid = 61cf4d8d-6af1-4fcc-9d55-fd3ce55da038"num_visualizations" default null
Column "browser_type" guid = 80d94384-2f50-4588-97ef-409b10fda3d2"browser_type" default null
Column "browser_version" guid = 5b48dcf3-2885-4310-a360-83ea76ae625d"browser_version" default null
Column "viz_id" guid = b1188384-9d76-44e4-88c3-28685e3cc173"viz_id" default null
Column "client_id" guid = 47c0c010-bc8d-4d3a-81c2-a59b80bc60d3"client_id" default null
Column "request_type" guid = 559a0c95-d053-4df0-80db-0193314c876e"request_type" default null
Column "client_type" guid = 95671a67-1f8a-446b-a9c3-7c87b97d293e"client_type" default null
Column "stats_version" guid = 14ccd567-128c-494f-bac2-bec978c34201"stats_version" default 1
Live Schema Version 28
 */
CREATE TABLE "falcon_default_schema"."stats_tomcat_tomcat" (
    "timestamp" DATETIME,
    "sunit_index" int,
    "sunit_oid" bigint,
    "pid" bigint,
    "hostname" varchar(255),
    "response_us" bigint,
    "response_size" int,
    "incident_id" varchar(255),
    "url" varchar(255),
    "http_response_code" bigint,
    "user_guid" varchar(255),
    "user_name" varchar(255),
    "user_locale" varchar(255),
    "user_timezone" varchar(255),
    "session_id" varchar(255),
    "rdbms_access_time_us" bigint,
    "rdbms_request_count" bigint,
    "falcon_access_time_us" bigint,
    "num_measures" int,
    "num_attributes" int,
    "num_group_limit_columns" int,
    "num_joins" int,
    "top_count" int,
    "growth_time_bucket" varchar(32),
    "uses_system_table" int,
    "uses_user_table" int,
    "uses_worksheet" int,
    "query_text" varchar(1024),
    "answer_book_guid" varchar(255),
    "answer_book_name" varchar(255),
    "load_answer" int,
    "load_pinboard" int,
    "error_code" int,
    "error_string" varchar(1023),
    "memcache_access_time_us" bigint,
    "num_visualizations" int,
    "browser_type" varchar(200),
    "browser_version" varchar(200),
    "viz_id" varchar(1023),
    "client_id" varchar(200),
    "request_type" varchar(200),
    "client_type" varchar(200),
    "stats_version" int
);


/*
Table "stats_sage_auto_complete" guid = 3a01fb45-fe23-4525-9fab-844b8896a081
Column "timestamp" guid = 20401cba-edf3-4ddb-8a61-4aeffce73d06 parsing hint %Y%m%d %H:%M:%S
Column "sunit_index" guid = 48434c01-8d25-425a-b13e-d504bddc5c74
Column "sunit_oid" guid = 4ebb946d-ddb0-4c73-9fbb-daca6672ec08
Column "pid" guid = 4a5dbb74-b2dd-42c3-a356-90418e679871
Column "hostname" guid = b2d96578-0da7-478c-88d6-25dd7f2c14a0
Column "common.uptime" guid = 6a760388-a27c-40a4-aa68-d15d246160f1
Column "rpc-falcon.FalconRequest-sent" guid = 19ab3bba-4182-4e40-a3fe-c261d96f2685
Column "rpc-falcon.FalconRequest-sent-errors" guid = 9b44ee3f-e70b-4bd2-bf9f-78b863d78f68
Column "sage.auto_complete.avg_query_latency_msec" guid = 17947a14-38e8-4e87-97aa-0859289f266e
Column "sage.auto_complete.num_queries" guid = a94ebe93-9fab-4950-8ad8-d5fcbb6816f4
Column "object_search.client.full_latency_ms-avg" guid = b5cf3fd8-9a6d-4e6a-826b-244f8b39ee1c"object_search.client.full_latency_ms-avg" default null
Column "object_search.client.full_latency_ms-max" guid = 712e07df-6542-4fd6-8320-c6427b475e4e"object_search.client.full_latency_ms-max" default null
Column "object_search.client.num_failed" guid = 998fc22c-5dcf-4a3e-8e85-cb8d193fc8cf"object_search.client.num_failed" default null
Column "object_search.client.num_success" guid = 05c4d891-78a7-44a9-83dd-44ab5b957996"object_search.client.num_success" default null
Column "object_search.client.num_timeout" guid = 7c46fb89-414d-4097-89ce-f7e08ab7efbe"object_search.client.num_timeout" default null
Column "object_search.client.rpc_latency_ms-avg" guid = 5f769539-be23-4e16-bdc2-0f9e8513bf14"object_search.client.rpc_latency_ms-avg" default null
Column "object_search.client.rpc_latency_ms-max" guid = 12cf8b4a-4ec6-4e62-97aa-c0761dfeb19b"object_search.client.rpc_latency_ms-max" default null
Column "object_search.client.wait_latency_ms-avg" guid = a24b2177-025b-440b-82a4-d789f88c66bd"object_search.client.wait_latency_ms-avg" default null
Column "object_search.client.wait_latency_ms-max" guid = 2bf4b08f-6081-4003-99b5-c8f1b465e2bc"object_search.client.wait_latency_ms-max" default null
Column "rpc-falcon.FalconRequest-client-latency-us-avg" guid = 27d76fdb-6630-4021-8126-80b3c3f10037"rpc-falcon.FalconRequest-client-latency-us-avg" default null
Column "rpc-falcon.FalconRequest-client-latency-us-max" guid = 253ac944-482b-477a-8c46-21ea46e19b70"rpc-falcon.FalconRequest-client-latency-us-max" default null
Column "sage.auto_complete.index_lookups_made_per_query-avg" guid = e5d2ee3b-87bd-4e13-b702-545de8e7beb3"sage.auto_complete.index_lookups_made_per_query-avg" default null
Column "sage.auto_complete.index_lookups_made_per_query-max" guid = b237bdea-0a6b-450f-90ee-cfabccc50d9a"sage.auto_complete.index_lookups_made_per_query-max" default null
Column "sage.auto_complete.num_ambiguous_join_queries" guid = 7ccba89c-6234-4117-8cfb-98bca8a49b99"sage.auto_complete.num_ambiguous_join_queries" default null
Column "sage.auto_complete.num_ambiguous_token_queries" guid = 8cc46e14-c65f-426d-bc27-dec8571c1623"sage.auto_complete.num_ambiguous_token_queries" default null
Column "sage.auto_complete.num_transformations_per_query-avg" guid = 1bf3fb2c-8fa5-452f-8841-ec234abfe158"sage.auto_complete.num_transformations_per_query-avg" default null
Column "sage.auto_complete.num_transformations_per_query-max" guid = 6195c0d8-1db1-47fc-acdf-09523834e6ad"sage.auto_complete.num_transformations_per_query-max" default null
Column "sage.auto_complete.query_latency_ms-avg" guid = cda8bf6e-1b64-43b5-a02f-2daefa206fe5"sage.auto_complete.query_latency_ms-avg" default null
Column "sage.auto_complete.query_latency_ms-max" guid = a66df259-31ed-4c58-8557-50b70b645b92"sage.auto_complete.query_latency_ms-max" default null
Column "sage.auto_complete.retries_per_query-avg" guid = 4c9892ed-d60e-4990-bf28-4a86700e25af"sage.auto_complete.retries_per_query-avg" default null
Live Schema Version 9
 */
CREATE TABLE "falcon_default_schema"."stats_sage_auto_complete" (
    "timestamp" DATETIME,
    "sunit_index" int,
    "sunit_oid" bigint,
    "pid" bigint,
    "hostname" varchar(255),
    "common.uptime" bigint,
    "rpc-falcon.FalconRequest-sent" bigint,
    "rpc-falcon.FalconRequest-sent-errors" bigint,
    "sage.auto_complete.avg_query_latency_msec" float,
    "sage.auto_complete.num_queries" bigint,
    "object_search.client.full_latency_ms-avg" float,
    "object_search.client.full_latency_ms-max" bigint,
    "object_search.client.num_failed" bigint,
    "object_search.client.num_success" bigint,
    "object_search.client.num_timeout" bigint,
    "object_search.client.rpc_latency_ms-avg" float,
    "object_search.client.rpc_latency_ms-max" bigint,
    "object_search.client.wait_latency_ms-avg" float,
    "object_search.client.wait_latency_ms-max" bigint,
    "rpc-falcon.FalconRequest-client-latency-us-avg" float,
    "rpc-falcon.FalconRequest-client-latency-us-max" bigint,
    "sage.auto_complete.index_lookups_made_per_query-avg" bigint,
    "sage.auto_complete.index_lookups_made_per_query-max" bigint,
    "sage.auto_complete.num_ambiguous_join_queries" bigint,
    "sage.auto_complete.num_ambiguous_token_queries" bigint,
    "sage.auto_complete.num_transformations_per_query-avg" float,
    "sage.auto_complete.num_transformations_per_query-max" bigint,
    "sage.auto_complete.query_latency_ms-avg" float,
    "sage.auto_complete.query_latency_ms-max" float,
    "sage.auto_complete.retries_per_query-avg" float
);


/*
FACT
Table "stats_service_resources" guid = ad35015b-bfdc-490f-a4ee-fe9975c98d0d
Column "timestamp" guid = 4714bfe9-9349-493a-aa6c-47e8edfe9616 parsing hint %Y%m%d %H:%M:%S
Column "sunit_index" guid = 8fbbbdac-2b56-4252-9fa6-f286949db1c8
Column "sunit_oid" guid = 8574e730-86dc-4a92-ba8f-d87bbe366209
Column "hostname" guid = 001c687d-fcba-4c16-8104-6f1474506ae4
Column "cpu_system" guid = 4a082ea9-d358-4922-9f6a-14456cc8363a"cpu_system" default null
Column "cpu_total" guid = 62f32ebb-b75c-4be7-82ce-b53a071318f3"cpu_total" default null
Column "cpu_user" guid = 79155786-a904-41bc-a8d2-e920710fa33a"cpu_user" default null
Column "memory_active_anon" guid = 8841d621-1ec2-4103-bf75-347b8efcdd61"memory_active_anon" default null
Column "memory_active_file" guid = d7a53e77-b9f6-4ce1-94bf-829009794aa1"memory_active_file" default null
Column "memory_cache" guid = f3502b1a-2d4c-4633-a34f-55bd62e13d25"memory_cache" default null
Column "memory_fail_count" guid = cce94320-7a8f-4965-98fd-d6dab69cfd1a"memory_fail_count" default null
Column "memory_inactive_anon" guid = 6cbf0e38-4d49-475c-8979-01484a1c6da2"memory_inactive_anon" default null
Column "memory_inactive_file" guid = 65541a53-30a9-48d1-8087-fac48e96671a"memory_inactive_file" default null
Column "memory_major_pgfault" guid = bbf6c4e7-34ca-4158-9cab-ebe8a24fe34e"memory_major_pgfault" default null
Column "memory_max_usage" guid = e40af3b1-3ed3-488b-8265-27f820a6b544"memory_max_usage" default null
Column "memory_pgfault" guid = 71985b26-1e16-4ea1-854b-40e0d37097e5"memory_pgfault" default null
Column "memory_rss" guid = f27bd3ad-b378-4b57-b0f2-f37ef557359c"memory_rss" default null
Column "memory_rss_huge" guid = a0e8d4f3-2737-4a02-b966-069c6844a58d"memory_rss_huge" default null
Column "memory_usage" guid = ee660544-38fd-4b11-ab5a-b9e035c1e323"memory_usage" default null
Column "memory_working_set" guid = 6e11c013-7255-4b0d-9302-503448f264e8"memory_working_set" default null
Column "pid" guid = dd2f9446-9789-4a36-9809-132d512770e1"pid" default null
Column "service" guid = c537823e-eb57-4edb-b295-9416a9fcc1c6"service" default null
Column "task" guid = 09fbffcb-9fb5-43c8-9fb3-58a68bd1e465"task" default null
PARTITION BY HASH  (32) KEY ("timestamp" ,"sunit_oid" )
Live Schema Version 1
 */
CREATE FACT TABLE "falcon_default_schema"."stats_service_resources" (
    "timestamp" DATETIME,
    "sunit_index" int,
    "sunit_oid" bigint,
    "hostname" varchar(255),
    "cpu_system" bigint,
    "cpu_total" bigint,
    "cpu_user" bigint,
    "memory_active_anon" bigint,
    "memory_active_file" bigint,
    "memory_cache" bigint,
    "memory_fail_count" bigint,
    "memory_inactive_anon" bigint,
    "memory_inactive_file" bigint,
    "memory_major_pgfault" bigint,
    "memory_max_usage" bigint,
    "memory_pgfault" bigint,
    "memory_rss" bigint,
    "memory_rss_huge" bigint,
    "memory_usage" bigint,
    "memory_working_set" bigint,
    "pid" int,
    "service" varchar(128),
    "task" varchar(128)
)
PARTITION BY HASH (32) KEY ("timestamp", "sunit_oid");


/*
Table "stats_metadata_table" guid = 898d34fd-2f20-471e-a46a-486e236203ae
Column "metadata_id" guid = 8dc5b223-cde8-414b-95dc-10cb4a082cd3
Column "cluster_id" guid = b0ae612c-ce0d-4d86-9542-1fa0340ebf24
Column "hostname" guid = ac091e98-9637-4f25-902e-11ef80fe417d
Column "metric_name" guid = 7b69ee36-38e9-4d54-b7e1-aec9286fc19d
Column "description" guid = 99279a60-c57a-4743-baad-83d7f314dfea
 */
CREATE TABLE "falcon_default_schema"."stats_metadata_table" (
    "metadata_id" int,
    "cluster_id" varchar(1024),
    "hostname" varchar(255),
    "metric_name" varchar(1024),
    "description" varchar(2014),
    PRIMARY KEY ("metadata_id")
);


/*
Table "stats_data_table" guid = f657afd6-5bd0-4036-97c3-dcc188f8312d
Column "metadata_id" guid = cb56a8a7-333a-48a3-9023-a179fcaeb590
Column "timestamp" guid = c584f63d-46e0-40d9-87f9-c3c567d011d7 parsing hint %Y%m%d
Column "value_int64" guid = 98a2a74c-63c7-4efa-b0d5-d4fbc4b37d39
Column "value_double" guid = fdd96460-81c4-4bb4-9a62-14297524ee91
 */
CREATE TABLE "falcon_default_schema"."stats_data_table" (
    "metadata_id" int,
    "timestamp" DATETIME,
    "value_int64" bigint,
    "value_double" double
);


/*
Table "query_stats" guid = 2b1861fe-47de-45fb-b894-318dd88ffcea
Column "id" guid = b6512be1-a3fd-43f8-9525-802d762d03c6
Column "start_time" guid = 348e6033-bf37-4190-8b23-6b433b272150 parsing hint %Y%m%d %H:%M:%S
Column "end_time" guid = 0cce2263-77a9-438a-8f12-ae95a71b6326 parsing hint %Y%m%d %H:%M:%S
Column "status" guid = 49d3826e-03f5-4186-b324-c07009416d82
Column "connection_id" guid = ace89650-dca8-4e5c-9e2d-6781d25eae2b
Column "connection_name" guid = 31cdf9bb-e8a3-426e-97ad-df704ad60049
Column "query_string" guid = 4c2978e0-6026-4f03-9c4a-67dc10aadc87
Column "user_id" guid = 10c7a7a4-b370-46d9-880d-f7d75949cef4
Column "user_name" guid = 2cff8b89-1d3c-40f4-844a-afdacc513566
Column "request_id" guid = ce13bd42-10e6-425a-81c5-bb9f901c77d2
Column "trace_id" guid = a0551d95-ba3a-4d42-9d6d-bafe9245b41e
Column "nums_rows_fetched" guid = 834d71c9-164d-4112-8cac-b8d83110d93a
Column "context" guid = e6c2adbe-a4ec-4341-b2f5-5a27dde3d660
Column "error_message" guid = 60ad2def-a1e5-4af9-931a-da4f59442b58
 */
CREATE TABLE "falcon_default_schema"."query_stats" (
    "id" varchar(20),
    "start_time" DATETIME,
    "end_time" DATETIME,
    "status" varchar(20),
    "connection_id" varchar(20),
    "connection_name" varchar(100),
    "query_string" varchar(0),
    "user_id" varchar(20),
    "user_name" varchar(100),
    "request_id" varchar(20),
    "trace_id" varchar(20),
    "nums_rows_fetched" bigint,
    "context" varchar(100),
    "error_message" varchar(0),
    PRIMARY KEY ("id")
);


/*
Table "data_load_stats" guid = fcfd9340-47ca-4501-9444-09a7d5b53047
Column "id" guid = 6aa51c5a-fb47-491c-96ac-8876caf1e846
Column "type" guid = 8baa6580-2329-4ced-a648-9b4f00e53c2f
Column "table_id" guid = 0b02a63e-8005-4a5d-ae78-950fd6a508c4
Column "status" guid = d40fc6e6-51ea-42a2-9249-c146399a1c37
Column "nums_rows_uploaded" guid = 37fe10ad-d487-4237-9460-e6bfacbb2ce1
Column "start_time" guid = ca2f9fc9-f243-48f6-b1b7-a3f0c4de712c parsing hint %Y%m%d %H:%M:%S
Column "end_time" guid = ef364cc1-0f7f-4ace-80f9-3f7445dae1dd parsing hint %Y%m%d %H:%M:%S
Column "error_message" guid = 115918aa-9a5f-4c7d-a469-221438a0ac48
Column "connection_id" guid = f88ff176-de4b-4f51-96ae-21aebe84e455
Column "connection_name" guid = e914c592-8c51-49da-8062-a6660e92d3a9
Column "table_name" guid = 1d27b678-07b7-44a4-97da-8ab1baf29780
Column "is_truncated" guid = 87fd5d75-2357-4c27-b5bc-1838a4fcedc1"is_truncated" default false
Column "is_conditional" guid = e6557014-2898-4f63-aa96-869ffd285f7f"is_conditional" default false
Column "user_id" guid = 9807db6e-b513-41c9-b40e-1dc421c79d29"user_id" default null
Column "user_name" guid = ca5c4136-8f98-40dd-a515-7ffd0b226592"user_name" default null
 */
CREATE TABLE "falcon_default_schema"."data_load_stats" (
    "id" varchar(20),
    "type" varchar(20),
    "table_id" varchar(20),
    "status" varchar(20),
    "nums_rows_uploaded" bigint,
    "start_time" DATETIME,
    "end_time" DATETIME,
    "error_message" varchar(0),
    "connection_id" varchar(20),
    "connection_name" varchar(100),
    "table_name" varchar(100),
    "is_truncated" bool,
    "is_conditional" bool,
    "user_id" varchar(20),
    "user_name" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "query_table_link" guid = 480cd86c-0f04-4a33-a6c8-cea7a3b5b186
Column "query_id" guid = 971d58c6-bff1-4933-bc85-f1001afb37bb
Column "table_id" guid = 37db2b21-6cec-4947-9248-131a3cc74d0c
Column "table_name" guid = ac7122e8-36fe-4a5d-8802-396e6285413a
Column "table_type" guid = cda49a2e-84e9-4d19-9c9d-c91247731f17
 */
CREATE TABLE "falcon_default_schema"."query_table_link" (
    "query_id" varchar(20),
    "table_id" varchar(20),
    "table_name" varchar(100),
    "table_type" varchar(20)
);


/*
Table "external_table_stats" guid = 380f8fc3-af65-4e65-ae25-28cbceca8616
Column "time" guid = 6306d163-a92f-4596-8332-89d91818cb87 parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "connection_id" guid = afa11852-9f21-4452-b159-eaa72e196b9b compression DISABLED
Column "connection_type" guid = b278fef6-9952-4cec-88f2-f72332473b97 compression DISABLED
Column "connection_name" guid = dc9ce259-d060-4210-b77f-0e08b5bdb122 compression DISABLED
Column "table_id" guid = 2fd3fcf3-8f8f-4ac9-9794-8adc4a8276e0 compression DISABLED
Column "table_name" guid = b83fbc33-021e-48b1-b7ce-c45e82a46841 compression DISABLED
Column "ext_db_name" guid = fe09d6fb-3446-46c9-84ce-9c58e6996b09 compression DISABLED
Column "ext_schema_name" guid = 39a6b6e0-cc30-4c8d-9a76-caee0a979db6 compression DISABLED
Column "ext_table_name" guid = 9834ab8f-c0f6-446a-b90f-420066e2280b compression DISABLED
Column "status" guid = f296858a-bffc-4a1f-b833-be595dca6bca compression DISABLED
Column "num_rows" guid = 8dc6d84a-e4e1-47c4-bc2f-0f394eed3df3 compression DISABLED
Column "error_message" guid = 4e8d6be8-6534-46ae-846b-4dbc674623a5 compression DISABLED
Column "is_cached" guid = 48bdcd85-99e7-4b86-a9c3-197150ad65f8 compression DISABLED
Column "last_sync_time" guid = f9d15825-b087-4013-aba9-8b2bad49f2c2 parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "sync_type" guid = dbcd63f5-ada7-4c88-aaa7-2affadb54a23 compression DISABLED
 */
CREATE TABLE "falcon_default_schema"."external_table_stats" (
    "time" DATETIME,
    "connection_id" varchar(20),
    "connection_type" varchar(50),
    "connection_name" varchar(0),
    "table_id" varchar(20),
    "table_name" varchar(0),
    "ext_db_name" varchar(0),
    "ext_schema_name" varchar(0),
    "ext_table_name" varchar(0),
    "status" varchar(20),
    "num_rows" bigint,
    "error_message" varchar(0),
    "is_cached" bool,
    "last_sync_time" DATETIME,
    "sync_type" varchar(20)
);


/*
Table "falcon_dataload_metrics" guid = e2b51b41-2ed5-49e8-9c02-7aa159fd1b82
Column "guid" guid = 16574f21-75fa-49a1-9471-ab03c9788bc5 compression DISABLED
Column "region" guid = 27d18fc5-3b3f-46fe-9a26-d9b7032c7631 compression DISABLED
Column "data_version" guid = 7f367322-89e3-4db4-9d23-c42a0a1c204d compression DISABLED
Column "schema_version" guid = ceb03bcc-5eb0-4efd-97a2-a4694187c3b0 compression DISABLED
Column "type" guid = fc30a57a-ce67-4221-9925-497f7cc7d7b7 compression DISABLED
Column "row_count" guid = 01089fca-a29d-4a46-8870-b1616be297ea compression DISABLED
Column "size_mb" guid = 0ee64152-2551-4a0c-a743-ce6f251793c3 compression DISABLED
Column "timestamp" guid = 38343703-c390-42aa-9129-55c85fcebc05 parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "duration_ms" guid = 3c482d70-7ac0-4c16-ad43-61a3c32bc7fc compression DISABLED
Column "host" guid = 196bf50d-5d31-496e-8d11-5365322ecd8c compression DISABLED
Column "worker_id" guid = 0c7c1f65-ce1b-448c-b311-3f673f7f83ed compression DISABLED
Column "start_time" guid = 00ab2cf5-6361-42dd-84e7-4312e3ecd7ec parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "trace" guid = 20bb2420-6e4f-407e-b755-dbb0704c2056 compression DISABLED
Column "in_mem_compactions" guid = 08eed473-1044-447c-a34d-35bb25a18346 compression DISABLED
 */
CREATE TABLE "falcon_default_schema"."falcon_dataload_metrics" (
    "guid" varchar(0),
    "region" varchar(0),
    "data_version" bigint,
    "schema_version" bigint,
    "type" varchar(0),
    "row_count" bigint,
    "size_mb" bigint,
    "timestamp" DATETIME,
    "duration_ms" bigint,
    "host" varchar(0),
    "worker_id" bigint,
    "start_time" DATETIME,
    "trace" varchar(0),
    "in_mem_compactions" bigint
);


/*
Table "falcon_monitor_query_summary" guid = a1f4c6b0-4ad5-4190-be50-015f54fa3f56
Column "trace_id" guid = 26b981e1-236e-462b-9363-9de4a73e47bc compression DISABLED
Column "start_timestamp" guid = dc409211-7cac-479d-b038-768db262f301 parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "end_timestamp" guid = 82e91e84-56a3-4d54-a9f3-5597e5c68a8c parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "query_signatures" guid = ac65a22c-a2a6-4943-9b9b-267facd12c44 compression DISABLED
Column "unbound_signatures" guid = 3dcc561a-34f3-4db9-814b-09c1aa4fecde compression DISABLED
Column "cost_estimate" guid = 22fd13e0-a035-4993-9578-252f1574b463 compression DISABLED
Column "status" guid = 3169ab10-1cf6-45a2-9d73-fc1d7cd6584b compression DISABLED
Column "request_source" guid = 22c2b645-6602-4236-ac8c-580733a12a2e compression DISABLED
Column "classification" guid = 227d8065-be93-42cb-a982-6ad8eea32623 compression DISABLED
Column "timeout_ms" guid = 793aed76-d91c-47da-b77f-355501810d4f compression DISABLED
Column "user" guid = 1bd459ec-9530-4b90-93b4-a908e3187a14 compression DISABLED
Column "question_id" guid = 9b04b220-1902-4a41-b2d6-54ab031c721e compression DISABLED
Column "question_name" guid = 52753517-4d96-4d0d-a3fc-24807056c4be compression DISABLED
Column "pinboard_id" guid = 61d296e5-1ed9-49c0-920a-025d3e01b08d compression DISABLED
Column "pinboard_name" guid = ac3aafab-dd8f-4812-81e5-523b9edfae02 compression DISABLED
Column "viz_id" guid = e2f51bbb-7ed2-4793-9f65-e49a705a875f compression DISABLED
Column "viz_name" guid = 94bb6eab-85a2-48fc-8fdb-2f647d13b22c compression DISABLED
Column "ip" guid = 67ea904d-23ac-4c5c-a17b-b451c15758f8 compression DISABLED
Column "skip_result_cache" guid = 46b7498b-75b8-449f-b260-43c57b0c11b4 compression DISABLED
Column "grouping_count" guid = 18d235ec-6ef7-4b91-b132-331da6676f3b compression DISABLED
Column "ordering_count" guid = 32af0668-6bb4-437e-98f8-7d598d9a5439 compression DISABLED
Column "join_count" guid = 5c9ce214-3220-4341-b60e-fc47bc650115 compression DISABLED
Column "planning_time" guid = 442971e9-4003-4f99-8907-92a32a7bcc77 compression DISABLED
Column "execution_time" guid = fb35412c-9005-4f43-a58d-bcca696ecac1 compression DISABLED
Column "network_time" guid = dc988469-9f94-4c5d-a6a6-fb99cfe017ac compression DISABLED
Column "num_rpcs" guid = 1a8e18f7-387a-4044-897e-6336cca6d47f compression DISABLED
Column "bytes_transferred" guid = 020443a2-9cf8-4cc5-a593-09ffe2e95524 compression DISABLED
Column "bandwidth" guid = 2eee8d26-d6aa-4b06-add2-9a84ae5f4c54 compression DISABLED
Column "compile_time" guid = 930c1dac-9155-4e59-be38-e1947ab71058 compression DISABLED
Column "compilation_count" guid = 9ee496c8-725f-4b6b-817d-a11ac14766db compression DISABLED
Column "compile_primary_hits" guid = efd4e3be-a63d-40b3-a828-dbf3eba85845 compression DISABLED
Column "compile_secondary_hits" guid = 25e4d38b-6d17-4a89-8998-e780e898ba59 compression DISABLED
Column "max_compile_code_len" guid = 11ee1afd-409f-4277-b946-ec4526fd8879 compression DISABLED
Column "code_lengths" guid = 91dbe932-229c-4406-a0c7-ab5968bbd0e4 compression DISABLED
Column "concurrent_compiles" guid = e32e6c84-22da-48e3-94b9-12b44afcd93a compression DISABLED
Column "jit_signatures" guid = f25fdf31-df77-43fe-958e-2a5f61ded96b compression DISABLED
Column "total_coordinator_threads" guid = b6f68293-8b72-4d84-8e9e-48064a7fb793 compression DISABLED
Column "total_worker_threads" guid = 09463fdf-7629-458e-b359-bfc63966bc00 compression DISABLED
Column "max_concurrent_threads" guid = 0f2f4c40-9de9-45d5-b2aa-755272213a60 compression DISABLED
Column "total_allocated_bytes" guid = 1ac5a8f2-a3ee-42f3-b367-3a405e8650b1 compression DISABLED
Column "highwater_memory_bytes" guid = feb4ac3b-685a-484e-bcd3-2189a2bc859f compression DISABLED
Column "start_concurrency_interactive_active" guid = 83f14e39-0e31-4ced-b54f-c98b0546ec4a compression DISABLED
Column "start_concurrency_batch_active" guid = 6da83650-87f2-422c-9edb-b5dee8679264 compression DISABLED
Column "start_concurrency_remote_active" guid = 92eadc21-6972-41c7-bfb1-6753a18f457b compression DISABLED
Column "end_concurrency_interactive_active" guid = 045f991c-aed5-412d-be97-e7b32c91cf40 compression DISABLED
Column "end_concurrency_batch_active" guid = ccf4f9c4-4241-41c5-8e8b-20cb608712f8 compression DISABLED
Column "end_concurrency_remote_active" guid = 9122e8cf-7486-468f-890f-a05778415462 compression DISABLED
Column "result_cache_lookups" guid = b3ffb0fc-45e5-49e1-8f6a-b710a82fa418 compression DISABLED
Column "result_cache_in_memory_hits" guid = 25e09dff-85ea-4179-846e-e84f1c600538 compression DISABLED
Column "result_cache_secondary_hits" guid = 37307fc2-bf20-49cf-a47e-920772229366 compression DISABLED
Column "result_cache_max_lookup_time" guid = ad4bbc1d-3edf-4f91-ae06-89fd46e83da1 compression DISABLED
Column "current_load" guid = 25771856-ac36-4b78-a502-304f5bdd6f3e compression DISABLED
Column "threshold_load" guid = 05d43a58-303b-4e14-82de-fe3921cabc63 compression DISABLED
Column "question_version" guid = aa69343b-fde3-4947-8dce-3c5d4a4d5b92 compression DISABLED
Column "pinboard_version" guid = 7afdaecd-91f9-4141-ae66-3cde8c7c35d9 compression DISABLED
Column "pinboard_viz_version" guid = 369e357a-22a1-4e64-a551-788dc34fdb1e compression DISABLED
Column "cache_hit_source" guid = 71deb283-33a2-46fa-b4e7-4334060ed5d4"cache_hit_source" default null compression DISABLED
Column "maj_pg_faults" guid = 43a82a5b-1f8c-4c4c-8d63-8f9e215b406e"maj_pg_faults" default 0 compression DISABLED
Column "num_disk_input_io" guid = 552742a1-9001-4460-b357-c19d4b5a5f05"num_disk_input_io" default 0 compression DISABLED
Column "num_disk_output_io" guid = c45e5d9b-03e8-48ef-900f-b12d911f06ea"num_disk_output_io" default 0 compression DISABLED
PARTITION BY HASH  (48) KEY ("trace_id" )
Live Schema Version 5
 */
CREATE TABLE "falcon_default_schema"."falcon_monitor_query_summary" (
    "trace_id" varchar(64),
    "start_timestamp" DATETIME,
    "end_timestamp" DATETIME,
    "query_signatures" varchar(4096),
    "unbound_signatures" varchar(4096),
    "cost_estimate" int,
    "status" varchar(32),
    "request_source" varchar(32),
    "classification" varchar(32),
    "timeout_ms" int,
    "user" varchar(64),
    "question_id" varchar(64),
    "question_name" varchar(256),
    "pinboard_id" varchar(64),
    "pinboard_name" varchar(256),
    "viz_id" varchar(64),
    "viz_name" varchar(256),
    "ip" varchar(16),
    "skip_result_cache" bool,
    "grouping_count" int,
    "ordering_count" int,
    "join_count" int,
    "planning_time" bigint,
    "execution_time" bigint,
    "network_time" bigint,
    "num_rpcs" int,
    "bytes_transferred" bigint,
    "bandwidth" int,
    "compile_time" bigint,
    "compilation_count" int,
    "compile_primary_hits" int,
    "compile_secondary_hits" int,
    "max_compile_code_len" int,
    "code_lengths" varchar(4096),
    "concurrent_compiles" varchar(2048),
    "jit_signatures" varchar(4096),
    "total_coordinator_threads" int,
    "total_worker_threads" int,
    "max_concurrent_threads" int,
    "total_allocated_bytes" bigint,
    "highwater_memory_bytes" bigint,
    "start_concurrency_interactive_active" int,
    "start_concurrency_batch_active" int,
    "start_concurrency_remote_active" int,
    "end_concurrency_interactive_active" int,
    "end_concurrency_batch_active" int,
    "end_concurrency_remote_active" int,
    "result_cache_lookups" int,
    "result_cache_in_memory_hits" int,
    "result_cache_secondary_hits" int,
    "result_cache_max_lookup_time" bigint,
    "current_load" double,
    "threshold_load" double,
    "question_version" bigint,
    "pinboard_version" bigint,
    "pinboard_viz_version" bigint,
    "cache_hit_source" varchar(32),
    "maj_pg_faults" bigint,
    "num_disk_input_io" bigint,
    "num_disk_output_io" bigint,
    PRIMARY KEY ("trace_id")
)
PARTITION BY HASH (48) KEY ("trace_id");


/*
Table "falcon_monitor_query_table_metadata" guid = 5e40fa9d-34b0-42dd-8e60-080d2418b45f
Column "trace_id" guid = 17c8a1e7-5645-4613-b4bb-db0003e1d7db compression AUTO
Column "table_guid" guid = 893c6253-be6b-49f6-892a-6670ac5a45cd compression AUTO
Column "schema_version" guid = 9e48821f-1e8e-4fc1-a079-60fda43159e5 compression AUTO
Column "data_version" guid = 1788a83a-bb28-4ff0-b9eb-c585fadf8b69 compression AUTO
Column "table_name" guid = 07466550-68ac-4fe7-b0e7-730feb812b28 compression AUTO
Column "query_start_timestamp" guid = ca7dd55c-cb3e-4f1d-88dc-63c0b96ba205 parsing hint %Y%m%d %H:%M:%S compression AUTO
PARTITION BY HASH  (48) KEY ("trace_id" )
 */
CREATE TABLE "falcon_default_schema"."falcon_monitor_query_table_metadata" (
    "trace_id" varchar(64),
    "table_guid" varchar(64),
    "schema_version" int,
    "data_version" int,
    "table_name" varchar(256),
    "query_start_timestamp" DATETIME,
    PRIMARY KEY ("trace_id", "table_guid")
)
PARTITION BY HASH (48) KEY ("trace_id");


/*
Table "falcon_monitor_dataload_global_stats" guid = 598eec54-6afa-4f4a-8208-b8be775f563e
Column "table_guid" guid = 5ee28027-c295-48b3-b3b1-d4a6cbd5f9c8 compression AUTO
Column "schema_version" guid = 5f8d0fc8-83a8-4965-94f3-140e1f66f69d compression AUTO
Column "data_version" guid = 76ebf5ee-da7f-43b7-9aad-079c0df443fc compression AUTO
Column "table_name" guid = 6f1815ad-5c27-4120-8b57-1c6803fd558d compression AUTO
Column "cycle_id" guid = 3d521095-60c8-4b0e-b9f9-f03cfe282f61 compression AUTO
Column "load_start" guid = fc43cbbf-3a9e-4893-b2cf-278f8add99ec parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "load_end" guid = 9afc261e-5fcc-4328-b6db-27c0f19423c0 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "hdfs_start" guid = 0d1138b2-a2ea-4529-b502-34a2172e56f7 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "hdfs_end" guid = 631fe6e9-34e8-41a4-a7ef-1460fbb35df2 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "trace_id" guid = 40309c3a-f287-4902-b870-2c1488120d3e compression AUTO
Column "source" guid = 6e402636-5a0f-4916-9574-25a364601293 compression AUTO
Column "total_num_rows" guid = 55ede859-2a8a-41e0-8187-4d4c6614626b compression AUTO
Column "approx_byte_size" guid = 341e868a-dae7-40b2-ab76-69576d683ee3 compression AUTO
Column "status" guid = 106a8451-b570-46e5-859f-b564af43ec9e compression AUTO
Column "error_msg" guid = 8ace3ddc-8799-4270-bee9-ce1973d5085c compression AUTO
PARTITION BY HASH  (48) KEY ("cycle_id" )
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."falcon_monitor_dataload_global_stats" (
    "table_guid" varchar(64),
    "schema_version" bigint,
    "data_version" bigint,
    "table_name" varchar(64),
    "cycle_id" varchar(64),
    "load_start" DATETIME,
    "load_end" DATETIME,
    "hdfs_start" DATETIME,
    "hdfs_end" DATETIME,
    "trace_id" varchar(64),
    "source" varchar(64),
    "total_num_rows" bigint,
    "approx_byte_size" bigint,
    "status" varchar(64),
    "error_msg" varchar(1024),
    PRIMARY KEY ("cycle_id")
)
PARTITION BY HASH (48) KEY ("cycle_id");


/*
Table "falcon_monitor_dataload_region_stats" guid = c6522846-0324-46e1-8c25-e020dd78aeeb
Column "region" guid = 78abb6d8-f3cc-49d1-a5c5-67d8787a7313 compression AUTO
Column "num_inserts" guid = 8c3ea8ec-a364-4057-8300-689adb60a57e compression AUTO
Column "num_deletes" guid = 8414979b-397b-4ab6-8aa9-b4d439524dcc compression AUTO
Column "num_updates" guid = 7e67317d-dbf8-483a-9ba8-21158a1c3c97 compression AUTO
Column "num_upserts" guid = cf867ce7-bd0e-4b0b-bdf6-3deb87afb6ff compression AUTO
Column "status" guid = 8c7d177e-e84b-46ad-8b1e-1863ebd947a2 compression AUTO
Column "region_load_start" guid = 1af321f5-5d0b-4aa2-9fa2-855c5feb0a8a parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "region_load_end" guid = a4c91e22-c985-40cd-9633-78d8ec92ecfb parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "worker_ip" guid = 2b5ca316-786c-439b-a6c2-27d34d43394e compression AUTO
Column "cycle_id" guid = 612368b8-a9f8-43be-a363-78896125eb53 compression AUTO
Column "region_num_rows" guid = 7e818d3a-55bb-4d27-adf7-aad437ce8747 compression AUTO
Column "region_num_deleted_rows" guid = 68a197d2-b5f2-49f1-9aaa-5347356fcd0b compression AUTO
Column "region_approx_byte_size" guid = d17e39ff-e26c-45db-8327-7ad1bc00f44e compression AUTO
Column "num_compactions" guid = c913c8e9-1ea5-4766-afa1-384e0de3d416 compression AUTO
Column "compaction_duration_ms" guid = 5fa232cd-92c7-4bec-a33c-b038e15596ca compression AUTO
Column "max_compaction_rows" guid = 504380d7-2222-47bd-a224-a947c8433fe4 compression AUTO
PARTITION BY HASH  (48) KEY ("cycle_id" )
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."falcon_monitor_dataload_region_stats" (
    "region" bigint,
    "num_inserts" bigint,
    "num_deletes" bigint,
    "num_updates" bigint,
    "num_upserts" bigint,
    "status" varchar(64),
    "region_load_start" DATETIME,
    "region_load_end" DATETIME,
    "worker_ip" varchar(64),
    "cycle_id" varchar(64),
    "region_num_rows" bigint,
    "region_num_deleted_rows" bigint,
    "region_approx_byte_size" bigint,
    "num_compactions" bigint,
    "compaction_duration_ms" bigint,
    "max_compaction_rows" bigint,
    PRIMARY KEY ("cycle_id", "region", "worker_ip")
)
PARTITION BY HASH (48) KEY ("cycle_id");


/*
Table "falcon_monitor_varz_stats" guid = 4343dfca-ff94-4560-871c-1c9d24cb38be
Column "timestamp" guid = b98beab2-2f8e-4a69-80be-39c4d2b6cbba parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "hostport" guid = cf1b2cad-514f-4da2-9e4a-b28ff91f5c99 compression AUTO
Column "falcon.config.load_master_build_map__distribution_min" guid = 17f44cf0-110e-4b03-b4f4-3b9fe21d39c6 compression AUTO
Column "falcon.config.load_master_build_map__distribution_max" guid = 585c6c8f-c682-4ead-9f73-dfadd87b7f55 compression AUTO
Column "falcon.config.load_master_build_map__distribution_mean" guid = 26f9ce55-c5ef-4080-8e9f-2811d8bc9011 compression AUTO
Column "falcon.config.load_master_build_map__distribution_count" guid = c9454a43-48ca-4467-a2df-3c97834a74de compression AUTO
Column "falcon.config.load_master_build_map_num_runs_" guid = 505517b5-486d-4ef2-8cb1-f7194fa47c42 compression AUTO
Column "falcon.config.load_master_create_load_ops__distribution_min" guid = 9263ace0-63ab-43b9-b67c-8b8a15058901 compression AUTO
Column "falcon.config.load_master_create_load_ops__distribution_max" guid = 1c392154-e801-4a05-b495-598c79a4208d compression AUTO
Column "falcon.config.load_master_create_load_ops__distribution_mean" guid = 991cd8ab-5046-49fb-a32c-a066ae224a21 compression AUTO
Column "falcon.config.load_master_create_load_ops__distribution_count" guid = 5efb190e-7bee-4818-92c4-eb52afdd43c4 compression AUTO
Column "falcon.config.load_master_create_load_ops_num_runs_" guid = 0d7640e1-9a1d-4543-be74-008260287f2f compression AUTO
Column "falcon.config.load_master_expired_table_removal__distribution_min" guid = 464c348c-7ea6-4892-93d4-eccf2e742e48 compression AUTO
Column "falcon.config.load_master_expired_table_removal__distribution_max" guid = 7e0e8af9-5967-40cd-8530-07ec1318eba8 compression AUTO
Column "falcon.config.load_master_expired_table_removal__distribution_mean" guid = 53801f9b-9f5c-4160-b452-991972ed1851 compression AUTO
Column "falcon.config.load_master_expired_table_removal__distribution_count" guid = f05f6c38-478a-4fbd-ad37-3ace62acd822 compression AUTO
Column "falcon.config.load_master_expired_table_removal_num_runs_" guid = aee5387e-c01d-4fe1-8b26-f88861586c25 compression AUTO
Column "falcon.config.load_master_generate_load_progress_cass__distribution_min" guid = ead3d719-1f3a-44e7-aa54-db298cd2c73b compression AUTO
Column "falcon.config.load_master_generate_load_progress_cass__distribution_max" guid = b88c978d-6459-4b36-bbe8-f63a63966369 compression AUTO
Column "falcon.config.load_master_generate_load_progress_cass__distribution_mean" guid = 4d8f5638-8c7c-4212-9466-38e88bfbb3cb compression AUTO
Column "falcon.config.load_master_generate_load_progress_cass__distribution_count" guid = 3d02b375-4465-49b5-b0c9-617c8432bb1e compression AUTO
Column "falcon.config.load_master_generate_load_progress__distribution_min" guid = 3ef983cd-58c6-421f-95c1-1d3d2e2f0c93 compression AUTO
Column "falcon.config.load_master_generate_load_progress__distribution_max" guid = 33cfd28c-d415-46e3-bc6b-4502eadca5eb compression AUTO
Column "falcon.config.load_master_generate_load_progress__distribution_mean" guid = 8ce569c7-28b9-4107-affc-05881b0ae142 compression AUTO
Column "falcon.config.load_master_generate_load_progress__distribution_count" guid = 592c5084-39da-49c9-9932-538509caa39d compression AUTO
Column "falcon.config.load_master_generate_load_progress_num_runs_" guid = 968b06fe-5952-4f38-a71f-33722f2880f8 compression AUTO
Column "falcon.config.load_master_get_status__distribution_min" guid = 599e6979-85a2-49e1-8b82-c59d3ca04fd8 compression AUTO
Column "falcon.config.load_master_get_status__distribution_max" guid = a5601df9-56f8-4dbc-ae73-e37e7fa7de50 compression AUTO
Column "falcon.config.load_master_get_status__distribution_mean" guid = 782943c6-abc9-4ffe-8a5f-8e9ef7ed29ea compression AUTO
Column "falcon.config.load_master_get_status__distribution_count" guid = b320be7f-a176-479c-aa93-924cf64735c3 compression AUTO
Column "falcon.config.load_master_get_status_num_runs_" guid = 04647a46-e50a-43c5-9ec0-c0817bb7c4cf compression AUTO
Column "falcon.config.load_master_handle_config__distribution_min" guid = 1d10bfd1-df5c-4c7a-b4aa-c2f67041beb1 compression AUTO
Column "falcon.config.load_master_handle_config__distribution_max" guid = 34f46155-4cb8-42ea-aa94-acc4e68b4353 compression AUTO
Column "falcon.config.load_master_handle_config__distribution_mean" guid = 0ea49fa4-a389-421f-a4fc-5ccb1857082a compression AUTO
Column "falcon.config.load_master_handle_config__distribution_count" guid = ba6800d5-fc5b-4b53-a0b4-3c76e3a2abf1 compression AUTO
Column "falcon.config.load_master_handle_config_num_runs_" guid = 65da76b0-3f3b-4bd8-981e-fc04740cee0f compression AUTO
Column "falcon.config.load_master_num_add_to_repository_ops_created_" guid = b269f639-cfd0-4172-89e0-d8b0e3fc13d3 compression AUTO
Column "falcon.config.load_master_num_deleted_ops_" guid = cc8bb880-d83a-4717-bc4c-d51d6467837e compression AUTO
Column "falcon.config.load_master_num_dictionary_ops_created_" guid = 6a98c99f-efde-453a-b092-d3a5b14d6d63 compression AUTO
Column "falcon.config.load_master_num_disk_read_ops_created_" guid = 61e167ac-f9ec-4704-a34a-98f3417fd965 compression AUTO
Column "falcon.config.load_master_num_disk_write_ops_created_" guid = ffc8064e-d450-4237-a091-dac70aa4b934 compression AUTO
Column "falcon.config.load_master_num_dml_ops_created_" guid = d0d92c4a-fe2e-487b-8a7f-e5b35f3beeaf compression AUTO
Column "falcon.config.load_master_num_new_ops_" guid = 0539d7bd-ff97-4831-a926-e437da5daceb compression AUTO
Column "falcon.config.load_master_num_remote_ops_created_" guid = 5f42b826-1133-4abf-a612-50e4a51a1262 compression AUTO
Column "falcon.config.load_master_num_removed_tables_" guid = 8510c5ac-5086-4ab6-9cad-45c5661aec23 compression AUTO
Column "falcon.config.load_master_num_retained_ops_" guid = e169483d-328c-4222-8868-305d1f7ed5d5 compression AUTO
Column "falcon.config.load_master_num_serialized_ops_created_" guid = fb949fb4-d5bf-4b86-bc79-0c3055ea2542 compression AUTO
Column "falcon.config.load_master_publish_status__distribution_min" guid = 08f9de4e-4b5d-42ba-99f7-1781f2581f46 compression AUTO
Column "falcon.config.load_master_publish_status__distribution_max" guid = 62d95c16-ff6a-4f61-afad-af2f6fbe9d61 compression AUTO
Column "falcon.config.load_master_publish_status__distribution_mean" guid = f04348c0-d21a-40d2-8d76-f6f9c09d11c5 compression AUTO
Column "falcon.config.load_master_publish_status__distribution_count" guid = 37b9b030-41fc-424c-936f-ff6ff7ad4ef5 compression AUTO
Column "falcon.config.load_master_publish_status_num_runs_" guid = 7f593604-5347-41e2-8005-7db19535034a compression AUTO
Column "falcon.config.load_master_schedule_loads__distribution_min" guid = ce6297aa-2909-4344-841e-d2c162ebe68d compression AUTO
Column "falcon.config.load_master_schedule_loads__distribution_max" guid = 349b0855-44a1-4bfd-8749-69d14b4ea62b compression AUTO
Column "falcon.config.load_master_schedule_loads__distribution_mean" guid = 423d5749-790c-4530-b4fe-6e2c5843a55d compression AUTO
Column "falcon.config.load_master_schedule_loads__distribution_count" guid = 4763aa04-5486-48f1-afd9-b3afc24d7108 compression AUTO
Column "falcon.config.load_master_schedule_loads_num_runs_" guid = 3ee290d1-a281-44f7-938e-b0613c5afcdb compression AUTO
Column "falcon.config.load_master_total_add_to_repository_ops_created_" guid = 8e92792d-8423-4de4-9c08-474827d7d900 compression AUTO
Column "falcon.config.load_master_total_deleted_ops_created_" guid = 1c9118ab-99ad-4cc1-8fd9-c00b50e0f29d compression AUTO
Column "falcon.config.load_master_total_dictionary_ops_created_" guid = db601b79-501a-459f-bcac-615e7d075629 compression AUTO
Column "falcon.config.load_master_total_disk_read_ops_created_" guid = 4b44a24e-790c-4601-9d1a-97e2aa7a8b52 compression AUTO
Column "falcon.config.load_master_total_disk_write_ops_created_" guid = a638bb82-80ad-41af-8612-1a14a83c6068 compression AUTO
Column "falcon.config.load_master_total_dml_ops_created_" guid = 8b6646f7-118c-4882-96ad-0d253d6646f5 compression AUTO
Column "falcon.config.load_master_total_new_ops_created_" guid = a236a66e-9e53-4cd1-90c1-d0e558d332e8 compression AUTO
Column "falcon.config.load_master_total_remote_ops_created_" guid = 0c650510-204b-42a5-a336-c11f3a68b6d4 compression AUTO
Column "falcon.config.load_master_total_removed_tables_" guid = 21541aea-6d78-40b2-a0cf-74b732f8e189 compression AUTO
Column "falcon.config.load_master_total_retained_ops_created_" guid = 7980a720-b4c3-46d0-b3b9-b3b969353e9a compression AUTO
Column "falcon.config.load_master_total_serialized_ops_created_" guid = 41f8964c-8247-4f65-a87d-5dcc30de7798 compression AUTO
Column "falcon.config.num_cancelled_dml_load_ops" guid = 483d1051-9187-4c93-a883-ec25472657d2 compression AUTO
Column "falcon.config.num_cancelled_load_ops" guid = 64c9da47-aefb-4aac-b60d-15a87b10ddcb compression AUTO
Column "falcon.config.num_cancelled_serialized_load_ops" guid = f111b96f-ba51-42a5-9556-8222facee2de compression AUTO
Column "falcon.config.num_dml_load_ops" guid = 58624a8c-27e3-4eec-9f55-0b2e50b3d8d4 compression AUTO
Column "falcon.config.num_failed_dml_load_ops" guid = fe676994-02fb-4699-a48c-989b163a1fa7 compression AUTO
Column "falcon.config.num_failed_load_ops" guid = 3b90f41b-c2e0-49f0-843b-849ccc9597b3 compression AUTO
Column "falcon.config.num_failed_serialized_load_ops" guid = 231edf41-20ef-4b83-9991-d0315d3064c7 compression AUTO
Column "falcon.config.num_load_ops" guid = 0a6103f6-6779-4ad1-896f-a6468b239fbc compression AUTO
Column "falcon.config.num_serialized_load_ops" guid = c96cc2bd-29d5-460f-988b-55fab9a6fe9d compression AUTO
Column "falcon.repository.denormalizerdenormalizer.avg_sync_with_repository_num_runs_" guid = 96c98a01-6fa7-402e-baa2-1ce12ccd6aef compression AUTO
Column "falcon.repository.denormalizerdenormalizer.build_regions__distribution_min" guid = eb35e65e-cb73-4ea5-b0b4-c344e22807f4 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.build_regions__distribution_max" guid = dab816b0-b191-4af3-9405-351e65e7add8 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.build_regions__distribution_mean" guid = 9c8abe3c-ba1d-4f21-9607-29af07e4fca4 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.build_regions__distribution_count" guid = dcfbba16-7e34-4a8a-847c-668675b02f95 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.build_regions_num_runs_" guid = 82f9cbc0-388b-4f54-8839-73c241452f86 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.num_denorm_builder_error_" guid = 443ed573-5307-424f-b907-02fabc8c38c3 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.num_denorm_tables_added_" guid = 6e96ed84-b053-4c52-aea1-f32b042b967e compression AUTO
Column "falcon.repository.denormalizerdenormalizer.num_denorm_tables_dropped_" guid = f05db276-f963-4e75-ac68-b42a87f5d6c1 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.process_rule__distribution_min" guid = 0be4de84-0232-4a55-b7ba-76945ae50370 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.process_rule__distribution_max" guid = bc2ca5b7-ad60-4d75-aac6-5a4a5ea3b916 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.process_rule__distribution_mean" guid = 209a4847-1bfe-484a-83ef-9751022dd93d compression AUTO
Column "falcon.repository.denormalizerdenormalizer.process_rule__distribution_count" guid = a9ffc825-1eea-4932-8171-c05006e03578 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.process_rule_num_runs_" guid = 41c0a1b6-4fa2-47fc-a5bf-4ff1cbc91369 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_min" guid = 5c866bb3-8159-4e47-8e7f-37fbfbbd4964 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_max" guid = 508ed342-a2a4-42b4-9a48-ab9bf9881e54 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_mean" guid = f607ee65-7bfc-498f-ac0a-8354d9fc72c1 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_count" guid = 3e9048c1-977c-42d3-8319-0351695d8de9 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_active_version_num_runs_" guid = 831c94b5-47ea-465c-8e39-40bc6cd04237 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_config__distribution_min" guid = 9ecce410-b7a7-4988-a1ba-ecd7bfa19385 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_config__distribution_max" guid = 7a83683d-ffe9-4c2f-bc3e-dc00e629c0e8 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_config__distribution_mean" guid = fad05bc5-d41e-4a71-8e19-059735a683be compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_config__distribution_count" guid = c7a51496-fc69-4560-b01a-a6ce17b44057 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.set_config_num_runs_" guid = ff877b13-e032-4f8b-a82f-3cbee42c002d compression AUTO
Column "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_min" guid = 2bb81b1b-8be5-4534-86da-7b7f33cef286 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_max" guid = f6b8f3ae-eaa2-4c33-b241-f12dac8918cb compression AUTO
Column "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_mean" guid = 152a4570-7245-43e8-8611-3f286598c20a compression AUTO
Column "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_count" guid = 069cad86-16ed-4129-b4d2-f533807d8f5a compression AUTO
Column "falcon.repository.denormalizerdenormalizer.total_denorm_builder_error_" guid = 16458a0f-ac72-4180-bc8b-04e0e85a00fa compression AUTO
Column "falcon.repository.denormalizerdenormalizer.total_denorm_tables_added_" guid = eb335b88-1bed-4607-8010-b7cbf9dbe887 compression AUTO
Column "falcon.repository.denormalizerdenormalizer.total_denorm_tables_dropped_" guid = 72ed063c-e7a8-464b-a4d6-73dce3ebfb7c compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_gc" guid = 2ea65f00-6c1b-40e7-a1b0-55f9f648cd79 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_failed_reads" guid = 4f70fce9-2d30-4beb-9ed8-d7c0ce99f2e8 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_failed_writes" guid = 6072e428-7dfe-47fa-9134-6ec348b19c5f compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_reads" guid = 16a100d1-cb86-46a3-a0c1-aa599b27de06 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblocks" guid = acba7903-ae17-45dd-8abd-7bdd8fa66c0a compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblocks_touched" guid = 663b763d-cc13-45a5-9332-8b89fdaa2eb0 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_successful_writes" guid = 1d9aade9-5850-469d-86a1-e4be3572af4a compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_reads" guid = e96e1c63-af18-4bfe-bf74-e92ebd69af28 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_recovered" guid = f89e1ae2-84fe-4ed4-95ee-965d800ba07a compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_writes" guid = 69702af0-8918-497e-8280-0b3ba1bb5bf5 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.read_bytes" guid = e410f6b8-a023-4707-ae9c-10d96b0522ec compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.read_throughput" guid = 0f65f00a-9133-4616-8eb6-2369ab3ac1e3 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.size_bytes" guid = 8d969587-8582-451f-9fb9-f9553dedc046 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.write_bytes" guid = 0a866cbb-c6fa-4b2d-881c-3eafd20866f3 compression AUTO
Column "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.write_throughput" guid = 668896bc-6510-4339-b548-a96bf63b294c compression AUTO
Column "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_adds" guid = 2028e313-afca-481a-b0a9-4c8099b17a80 compression AUTO
Column "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_found_at_start" guid = b6802a20-8d03-45e3-aff5-b1d32a63a7b5 compression AUTO
Column "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_recovered" guid = 47f7be4f-b2f3-495f-81ab-e0ab185e184c compression AUTO
Column "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_removes" guid = 11f4a98e-0f56-40ce-9266-d79a942ff8b0 compression AUTO
Column "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_tables" guid = b8d60230-55eb-4a27-b1e7-f834febf49a0 compression AUTO
Column "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_updates" guid = 44b51e88-03a8-4648-9144-f540632c8c7b compression AUTO
Column "falcon.worker.cache.concurrent_lookups" guid = 523a1277-811b-41c1-bf10-a425f6783fee compression AUTO
Column "falcon.worker.compiler_aggressive_cache.hits" guid = 462c5ce7-76c5-4604-bd1f-b2a7618e852a compression AUTO
Column "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_min" guid = d6421c89-663e-40b3-b602-0e2cebea08ca compression AUTO
Column "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_max" guid = a8ed24ce-1b42-4f21-b99c-b8a33ce0c837 compression AUTO
Column "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_mean" guid = 40b67ca2-f9fc-4422-a47e-00c4dc0ad0d2 compression AUTO
Column "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_count" guid = b58dbfbb-2b92-46b8-934d-cffd3643f587 compression AUTO
Column "falcon.worker.compiler_cache.cpp_size_blogged" guid = ff3b202a-7063-41a7-b414-7bd6f6e3c9c6 compression AUTO
Column "falcon.worker.compiler_cache.hits" guid = 78896f7f-8cca-459e-b7cc-c5020bab830a compression AUTO
Column "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_min" guid = 0513e2f1-5a30-4da3-83c3-135c794b9997 compression AUTO
Column "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_max" guid = d415ef91-0241-4345-b1b1-3b346ee2725d compression AUTO
Column "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_mean" guid = 1d01a9cb-1ccb-464b-af5b-ce3366bc4c49 compression AUTO
Column "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_count" guid = 5417a851-be96-41af-864f-b8b72215a5d6 compression AUTO
Column "falcon.worker.compiler_cache.lookups" guid = f69dfe08-0a76-40a3-8990-cdff0260c4cb compression AUTO
Column "falcon.worker.compiler_cache.num_aggressive_compiles" guid = 80dc481f-621e-4295-963f-56efc1b1b9a0 compression AUTO
Column "falcon.worker.compiler_cache.num_background_optimized_compiles" guid = abbca821-54dd-4fe9-8515-f674e9269ff9 compression AUTO
Column "falcon.worker.compiler_cache.num_concurrent_compiles" guid = 2b94c7ce-e36b-4100-bea8-a61464402b77 compression AUTO
Column "falcon.worker.compiler_cache.num_entries" guid = d4581ff1-38c6-48ca-881e-f627cf955a06 compression AUTO
Column "falcon.worker.compiler_cache.num_exceeded_seondary_cache_limit" guid = 43456dc6-30d5-4668-9274-6caccebc00fa compression AUTO
Column "falcon.worker.compiler_cache.num_failed_remote_compile_result_loads" guid = 16434d37-27ca-4fac-acc5-3b156ee67279 compression AUTO
Column "falcon.worker.compiler_cache.num_failed_remote_compiles" guid = f8259abb-d930-4fa5-b14a-c4f2f86df2f1 compression AUTO
Column "falcon.worker.compiler_cache.num_pending_background_compiles" guid = aaa173fa-9acd-4ed3-bc4a-0748df06ca0d compression AUTO
Column "falcon.worker.compiler_cache.num_secondary_cache_hits" guid = af45d287-ff89-490a-bfc1-2fc348cc8780 compression AUTO
Column "falcon.worker.compiler_cache.num_secondary_cache_load_failures" guid = 9542b118-3abd-4afe-ad60-896a40c53724 compression AUTO
Column "falcon.worker.compiler_cache.num_successful_remote_compiles" guid = 9945539d-4dad-437b-8205-f52e07e05261 compression AUTO
Column "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_min" guid = 3f0b8b09-6362-4680-88a1-071716fa3ecd compression AUTO
Column "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_max" guid = 5caea1f2-9256-4d8a-a593-c3985f980ba3 compression AUTO
Column "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_mean" guid = 3fedc32d-f427-4914-80c2-0f89cbcb8519 compression AUTO
Column "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_count" guid = 059cd575-563e-4564-a406-d9cdbc803055 compression AUTO
Column "falcon.worker.compiler_cache.overall_compilation_dist_distribution_min" guid = 513bbd47-043f-412b-ba7d-27ae63198f87 compression AUTO
Column "falcon.worker.compiler_cache.overall_compilation_dist_distribution_max" guid = e773febc-1c31-4435-8651-41f1a2acf458 compression AUTO
Column "falcon.worker.compiler_cache.overall_compilation_dist_distribution_mean" guid = 08bb44cb-8279-4941-a586-c066c8aee56d compression AUTO
Column "falcon.worker.compiler_cache.overall_compilation_dist_distribution_count" guid = c16f0b3f-40e6-4361-a94a-a5f8584206a5 compression AUTO
Column "falcon.worker.compiler_cache.remote_compilation_dist_distribution_min" guid = 46bc5475-caf2-4077-ad58-9bcd931d5b8c compression AUTO
Column "falcon.worker.compiler_cache.remote_compilation_dist_distribution_max" guid = dab14fab-a94d-4c06-942a-5c76b74a8485 compression AUTO
Column "falcon.worker.compiler_cache.remote_compilation_dist_distribution_mean" guid = cf5c6c86-c63b-4a72-8c37-5e8e1e2dd825 compression AUTO
Column "falcon.worker.compiler_cache.remote_compilation_dist_distribution_count" guid = 29e00327-649e-4c13-a44c-15122aaa0a08 compression AUTO
Column "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_min" guid = 9aaf23f2-7591-40b9-8da4-9e8dd191456b compression AUTO
Column "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_max" guid = 4d0346f2-1dec-4d90-8b3f-4b6a1041cd09 compression AUTO
Column "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_mean" guid = 32a0b7e5-0b93-4e8f-a3dc-efac2d766c6a compression AUTO
Column "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_count" guid = 51b9602c-ed04-4e14-8580-9908421566b5 compression AUTO
Column "falcon.worker.compiler_cache.warmup_count" guid = 93f7e409-7cbe-4ee1-8870-ac7a1375ad54 compression AUTO
Column "falcon.worker.compiler_optimized_cache.hits" guid = 75bb2539-8256-4847-b090-e9dd25d26816 compression AUTO
Column "falcon_worker_inmemory_compaction_threads_distribution_min" guid = 27d6ce9a-5e9c-43d6-8db9-9eb3c3917e3a compression AUTO
Column "falcon_worker_inmemory_compaction_threads_distribution_max" guid = 3020d8f4-789e-4e2d-a1d9-9f489d0bea8b compression AUTO
Column "falcon_worker_inmemory_compaction_threads_distribution_mean" guid = a0995686-572c-4dc2-abfc-7ef5b89e8df8 compression AUTO
Column "falcon_worker_inmemory_compaction_threads_distribution_count" guid = 969e1bea-94e8-403c-a5e6-8c98ef61130f compression AUTO
Column "falcon.worker.memory_manager.clients_with_rejection" guid = 775d8a9c-bdda-43f0-b787-0af7b7423df2 compression AUTO
Column "falcon.worker.memory_manager.current_allotted_bytes" guid = 22cb49d1-2303-45c3-83e0-1d85139b6866 compression AUTO
Column "falcon.worker.memory_manager.current_clients" guid = 5ce6511d-47d5-4743-970a-cab779c1db05 compression AUTO
Column "falcon.worker.memory_manager.current_emergency_in_use_bytes" guid = 0cd9f86d-aa35-4328-935b-acf0d4263ab6 compression AUTO
Column "falcon.worker.memory_manager.current_uncommitted_bytes" guid = 8456bb9a-3904-4406-acfb-779f050b73bb compression AUTO
Column "falcon.worker.memory_manager.emergency_reserve_situations" guid = ec1e65c6-27bd-4de1-bc17-0e8f93e52eb2 compression AUTO
Column "falcon.worker.memory_manager.meminfo.last_available_kb" guid = 015e3cb2-ac9c-4018-8896-9dd016b21524 compression AUTO
Column "falcon.worker.memory_manager.meminfo.last_calculated_kb" guid = c073e0e3-326a-48cb-aacc-3c9627a10e7b compression AUTO
Column "falcon.worker.memory_manager.meminfo.last_free_kb" guid = 15c69231-1588-4c44-bc62-b46b6e48978c compression AUTO
Column "falcon.worker.memory_manager.meminfo.last_tcmalloc_bytes_kb" guid = 9d263876-b4cc-42b4-9285-c54b2989fa13 compression AUTO
Column "falcon.worker.memory_manager.meminfo.read_failures" guid = 04caee45-47a2-4060-81cc-f3c15738014f compression AUTO
Column "falcon.worker.metrics._avg_query_running_time_micro_seconds" guid = 147c94a3-3359-46fc-94fc-1e15b9847260 compression AUTO
Column "falcon.worker.metrics._num_active_execute_query" guid = e157ddf8-925e-4766-a0a9-c5403b9b5fba compression AUTO
Column "falcon.worker.metrics._num_active_execute_tasq" guid = d596d8b3-029b-4e8d-99bd-ecf9800a9325 compression AUTO
Column "falcon.worker.metrics._num_active_open_scanner" guid = d12b78d9-7731-41d7-b144-6af7f29d5e0d compression AUTO
Column "falcon.worker.metrics._num_total_execute_query" guid = fefa127c-ec82-478f-a8d0-d8edc60add44 compression AUTO
Column "falcon.worker.metrics._num_total_execute_tasq" guid = 766ac334-84bb-458a-9aa9-abe8b5df1d37 compression AUTO
Column "falcon.worker.metrics._num_total_open_scanner" guid = b6a9a076-a573-4a8f-83b5-ce987acbac05 compression AUTO
Column "falcon.worker.mq_cache.byte_size" guid = f1fc9139-e1a8-41f5-a208-18d44ff2e65d compression AUTO
Column "falcon.worker.mq_cache.hits" guid = a760aa07-b6ea-4353-9a0a-897e8f4ecce1 compression AUTO
Column "falcon.worker.mq_cache.lookups" guid = 640cc7c8-8678-4098-a5ae-58bcded21377 compression AUTO
Column "falcon.worker.mq_cache.num_entries" guid = a9ab5a23-6ba6-4f15-9fd4-db2b162a40ae compression AUTO
Column "falcon.worker.num_live_scanners" guid = 4a423f54-9714-4efd-a9cf-aa685b8a6d11 compression AUTO
Column "falcon.worker.num_request_workers" guid = 0f0f359c-c7a0-48bf-8ae0-330742246420 compression AUTO
Column "falcon.worker.query.memory_exceeded_cancellations" guid = 64599064-c676-4453-bb33-06bcd5c9b83b compression AUTO
Column "falcon.worker.query.successful_cancellations" guid = bea8c2d1-e77c-4b07-b582-954459f68b5d compression AUTO
Column "falcon.worker.results_cache.byte_size" guid = 6d4ca54d-e373-4e3c-a44a-f2e4413b85fc compression AUTO
Column "falcon.worker.results_cache.hits" guid = e8d7847e-c131-420d-8006-54d9a3a9499c compression AUTO
Column "falcon.worker.results_cache.lookups" guid = 92225d8b-1264-46ec-a10a-6360caca8ddd compression AUTO
Column "falcon.worker.results_cache.num_entries" guid = 556a70c1-9c9c-4624-9bdc-b586cfa73963 compression AUTO
Column "falcon.worker.signature_only.num_queries" guid = e8df051c-a06e-412e-98d9-a57214bce519 compression AUTO
Column "falcon.worker.subresult_cache.avg_store_read_ms_distribution_min" guid = 2269c354-b33d-4114-8666-ed6091da457e compression AUTO
Column "falcon.worker.subresult_cache.avg_store_read_ms_distribution_max" guid = 49dc3a25-0795-49c1-8a9b-fabdf624cfc9 compression AUTO
Column "falcon.worker.subresult_cache.avg_store_read_ms_distribution_mean" guid = 7793ea8d-ed4f-46d6-9920-e21b02a1f313 compression AUTO
Column "falcon.worker.subresult_cache.avg_store_read_ms_distribution_count" guid = 3e8f4b5c-6980-4309-8c61-aa34d248763c compression AUTO
Column "falcon.worker.subresult_cache.avg_store_write_ms_distribution_min" guid = 66a42fc1-6898-463b-ab23-6ae33b6ae583 compression AUTO
Column "falcon.worker.subresult_cache.avg_store_write_ms_distribution_max" guid = ca12b45c-5ec2-4f71-8c43-10a272d80acb compression AUTO
Column "falcon.worker.subresult_cache.avg_store_write_ms_distribution_mean" guid = 6818b0fb-92f5-4601-b395-06ff27b50665 compression AUTO
Column "falcon.worker.subresult_cache.avg_store_write_ms_distribution_count" guid = 0df27ef6-c5b0-4c39-bc35-3427a441a07b compression AUTO
Column "falcon.worker.subresult_cache.bytes_size" guid = b98ad5e8-10f9-4ffb-aae6-1df02677dacb compression AUTO
Column "falcon.worker.subresult_cache.num_entries" guid = 68ad7829-8d78-4537-bc65-f6b596633bab compression AUTO
Column "falcon.worker.subresult_cache.num_in_memory_hits" guid = 481e5dec-6efe-436f-8f39-4c586e11e6d3 compression AUTO
Column "falcon.worker.subresult_cache.num_lookups" guid = 14ffbe3f-fc85-48ac-b660-c68e677b8df0 compression AUTO
Column "falcon.worker.subresult_cache.num_store_hits" guid = f86100fe-6589-4315-96e9-ff5a93574ac7 compression AUTO
Column "falcon.worker.subresult_cache.num_store_loads" guid = 3b1cd2c4-06ab-4919-915e-e07e6f12f98d compression AUTO
Column "falcon.worker.subresult_cache.store_lookups" guid = e64295b0-3a51-49a5-a9ed-97200a6a5f9e compression AUTO
Column "FalconWorkerThreadPool-queue-size" guid = 6e83377d-f9e1-4226-99e9-682d449be3eb compression AUTO
Column "falcon.worker.unbounded_signature.key_hits" guid = c1097953-e4e8-4f47-9463-2f18ba12fc46 compression AUTO
Column "falcon.worker.unbounded_signature.key_lookups" guid = 32a4bd2f-0f84-4ba3-9df6-5003fd8f9c0f compression AUTO
Column "falcon.worker.unbounded_signature.num_entries" guid = 96433120-ace6-4a28-a323-31aad4f720fe compression AUTO
Column "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_min" guid = 541babc2-6a58-4ed2-bf02-a3becb6f54d5 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_max" guid = 0f13f047-e9d8-450e-b206-8d1a482e0b7e compression AUTO
Column "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_mean" guid = f937506d-de6a-432b-8df8-c64841d91886 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_count" guid = 130b6f9d-e2d5-4684-882a-4a27d4522710 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_min" guid = 1f620e80-be7c-4428-8907-4c2ff0f2d4dc compression AUTO
Column "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_max" guid = b55fc90c-8749-49f0-accb-a0b3f1f2eadf compression AUTO
Column "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_mean" guid = 5bfa5c7c-bf9d-4e35-b48b-9a78d67221b4 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_count" guid = 27c9bb6c-733a-4509-9315-1891dbce14d2 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.num_failed_get_requests" guid = 049cf602-16e7-4f2c-894c-6ffc2b9efcca compression AUTO
Column "net.trace_vault_proxy.FalconTraces.num_failed_put_requests" guid = 491f52a3-46c1-441e-9601-1c26f55af89b compression AUTO
Column "net.trace_vault_proxy.FalconTraces.num_failed_requests" guid = e1778051-e3db-49fc-a5c9-4f6e96c2c807 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.num_get_requests" guid = ee0d0d1c-4c8c-4cf2-b22d-660c32484fc9 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.num_put_requests" guid = ebf64681-49ba-4328-b088-1ac1a6fdbc6b compression AUTO
Column "net.trace_vault_proxy.FalconTraces.num_requests" guid = 49ef93c0-5341-4cd8-ac3a-2a60c68d156c compression AUTO
Column "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_min" guid = eea353b8-39a7-4520-a8a8-cdc4d7f42653 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_max" guid = ff93a723-4883-4e41-ba9f-a1669258c885 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_mean" guid = e5840f16-4894-46b9-8a29-f7f5cf48218b compression AUTO
Column "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_count" guid = 924e858f-ca53-4e5f-b73e-4b222571ef3d compression AUTO
Column "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_min" guid = ee3ad60b-d1e9-4490-974d-8111b47212e2 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_max" guid = 2f4e67c2-5b4c-48b8-8021-39cbbbb98c74 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_mean" guid = f00df3a1-47e5-44a8-8d99-7c6755f7e184 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_count" guid = 5a4b1db7-2fc9-4881-94c6-6bff906e96c1 compression AUTO
Column "net.trace_vault_proxy.FalconTraces.queue_full_drops" guid = 5ff1ad38-f811-4a00-b6e4-5b082c20d843 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_min" guid = 818dab20-ffc4-4df6-8fba-a3ba242d885d compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_max" guid = a7a923e3-0c99-4dc9-8f18-f39f85071339 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_mean" guid = 0cee795f-eaeb-48fb-8616-cd16db4ce3e7 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_count" guid = e324ad8d-222d-47b1-87ee-103bd94518fa compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_min" guid = ea65ea35-bba0-4b34-ba56-566f773eef96 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_max" guid = a254fdf8-8530-43d2-ba19-e8fde226ac0b compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_mean" guid = fda03b48-d52c-4be7-a763-6832f472bd50 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_count" guid = 4e51cda6-f486-4d5e-9e6e-314636038357 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.num_failed_get_requests" guid = df3774ee-4609-4225-9b92-0d667c50a37a compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.num_failed_put_requests" guid = 61302cb6-a1c4-4369-93c2-3bfd4d4514b0 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.num_failed_requests" guid = b9cf9f34-8226-4d46-bd25-7693f33bcae7 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.num_get_requests" guid = b0cb5232-b32c-4af4-b5ce-290542741680 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.num_put_requests" guid = 867998b7-8e29-4b5f-9b36-3b7d3c079933 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.num_requests" guid = 64f0f546-27ef-4479-8a2f-2b7f632ce603 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_min" guid = f7ddf929-7d65-40ca-abfa-806f040107e8 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_max" guid = d4317202-ef89-4d78-b9e3-3e863bc7ff2d compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_mean" guid = f255b7e2-f5e0-4893-972d-5d2d134808c4 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_count" guid = 38ca0829-ec55-44ad-b668-80a1678a4cc5 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_min" guid = 7f15e588-3f23-498d-9025-0080e80f7f6e compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_max" guid = e5c9d046-ea6c-4668-bef8-507e0ffb3a00 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_mean" guid = a9fde276-4218-41b1-b2d9-07b28fcd1fca compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_count" guid = 63d0360a-bd77-4a0d-8413-a3366a6d0e24 compression AUTO
Column "net.trace_vault_proxy.falcon_worker_loadz.queue_full_drops" guid = 41400f96-db43-48b1-a341-e3eb0b612810 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_min" guid = c75363c5-3626-4b4b-aa6f-b0c61645cc88 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_max" guid = 4466abdf-8375-4bb5-8b31-a307984b63a0 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_mean" guid = ce9c080a-b84f-4c12-aea4-ad732fca1db8 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_count" guid = 14731c1b-ce8d-4ff1-b1f9-73b4748c9f10 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_min" guid = 7a1dbcfa-8a5d-40a9-bc60-c56ee82925d8 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_max" guid = 1e69896c-d86b-46bf-bf6e-051c34c7ed43 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_mean" guid = 450fd766-1e05-4708-8250-35e952e89ed9 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_count" guid = 3fc40dac-5314-4789-b395-ec8c1f747b93 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.num_failed_get_requests" guid = 630a06a9-49cb-4b63-b5dc-456ad071d5d6 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.num_failed_put_requests" guid = 9b1ffed7-096c-4dd0-970a-fe4f9262c15d compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.num_failed_requests" guid = 447378f8-c956-48d4-8786-8f9fad21daef compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.num_get_requests" guid = ff2c7030-c1b1-46fa-a324-23acd768a811 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.num_put_requests" guid = 8c61e6e9-4aa5-48ef-b0d9-418277259e65 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.num_requests" guid = 44d17f21-712b-42d7-9328-51de8f3d6b41 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_min" guid = e9316d49-5cac-403e-a56f-7ebbadf1fe69 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_max" guid = 47617873-465d-4c04-8038-0a06bce5317f compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_mean" guid = c80df800-212f-43b1-afbf-7774d26ce106 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_count" guid = 7a300c80-3edc-4ac5-925b-8bc963d8958f compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_min" guid = 0d848eed-bef4-4547-ae66-798a013b2bad compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_max" guid = 9519500b-71b2-47e7-b7f4-ca4325d22084 compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_mean" guid = 12df994a-2508-47d8-8b61-322c3ca34c9c compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_count" guid = 2f2cc7c8-b265-486f-816e-c46a2b70bbea compression AUTO
Column "net.trace_vault_proxy.FalconWorkerTraces.queue_full_drops" guid = e84eb388-12dd-4c35-bcbc-eb1f5a4e7e0d compression AUTO
Column "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_min" guid = d88ad585-3fb0-47be-ab12-61627b871ea8 compression AUTO
Column "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_max" guid = fd72f08a-768c-4ea9-b449-b0141d5a95e6 compression AUTO
Column "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_mean" guid = a4e54f51-d0d0-4be4-b280-64c0994366a6 compression AUTO
Column "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_count" guid = 70a9a16e-db75-44cc-a19b-13bf8a2923ce compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-active_distribution_min" guid = f7f6de0a-0b8d-4c9a-b2f9-be663201fe65 compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-active_distribution_max" guid = 41285e02-dfb7-4b4c-906e-cc19e3b52576 compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-active_distribution_mean" guid = c975f66a-c310-4c84-aef3-bef9e3c1ee1c compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-active_distribution_count" guid = 06d512a3-7578-488f-9364-c139c62465f7 compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-bytes_distribution_min" guid = 5cb60efc-1362-4415-a724-dc01c6967294 compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-bytes_distribution_max" guid = 6d1d52cc-c0e4-4a61-b4ac-2be41ae234df compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-bytes_distribution_mean" guid = 3a191897-c121-4503-9720-356b1ec1cf89 compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-bytes_distribution_count" guid = 4c5ee3c9-e02a-43e1-9986-b8b6329bd395 compression AUTO
Column "rpc-falcon.CloseScannerRequest-received-errors" guid = 9e70dac4-fb0f-4b53-8b36-4268aea5a267 compression AUTO
Column "rpc-falcon.CloseScannerRequest-received" guid = 24f31e33-418b-4446-a537-aa8a556236bb compression AUTO
Column "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_min" guid = 43bfbad0-86de-428e-ac46-cfad1ba3a1a8 compression AUTO
Column "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_max" guid = 061d73c3-d8b2-42a2-b1bd-f1d71b06948b compression AUTO
Column "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_mean" guid = a7b94bf2-3fc6-41f1-b1c6-d5d997fd9855 compression AUTO
Column "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_count" guid = 635c6814-079c-4d9f-a25a-d6c6565bc797 compression AUTO
Column "rpc-falcon.CloseScannerRequest-sent-errors" guid = 03b8248c-dea1-49d1-b240-e975fb9394d1 compression AUTO
Column "rpc-falcon.CloseScannerRequest-sent" guid = accc1c4e-77ae-4409-81dc-e6f207adc170 compression AUTO
Column "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_min" guid = dcf05a10-5add-488d-8fc1-a333cc4b8664 compression AUTO
Column "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_max" guid = 4379c9f5-b86f-458d-a765-a7600e48ff93 compression AUTO
Column "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_mean" guid = f18a1100-64ab-4b54-b71d-1de9e397d71c compression AUTO
Column "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_count" guid = 7915de11-7943-4079-a9dd-7c9fd2c64b8b compression AUTO
Column "rpc-falcon.CompileService.Compile-client-latency-us_distribution_min" guid = bc53621b-ff32-4d86-942f-c98f89141e6b compression AUTO
Column "rpc-falcon.CompileService.Compile-client-latency-us_distribution_max" guid = 4701ace7-0da7-451e-b520-0c0f7847a605 compression AUTO
Column "rpc-falcon.CompileService.Compile-client-latency-us_distribution_mean" guid = 589f8142-b362-4284-91c1-d6ddacfe86df compression AUTO
Column "rpc-falcon.CompileService.Compile-client-latency-us_distribution_count" guid = e1cca9f6-35ec-4433-8045-a4990ed92c38 compression AUTO
Column "rpc-falcon.CompileService.Compile-received-active_distribution_min" guid = cf5620c8-49c2-4acf-9dbf-b4863484dae5 compression AUTO
Column "rpc-falcon.CompileService.Compile-received-active_distribution_max" guid = 45438389-74d0-4f54-a7dd-bbd7e77b2473 compression AUTO
Column "rpc-falcon.CompileService.Compile-received-active_distribution_mean" guid = 1ff0961a-e75d-436a-a2b5-8077dbb190d5 compression AUTO
Column "rpc-falcon.CompileService.Compile-received-active_distribution_count" guid = 8a0f7a06-e493-4ded-8c17-3d52a0f51528 compression AUTO
Column "rpc-falcon.CompileService.Compile-received-bytes_distribution_min" guid = c53a403e-50ef-460a-b985-2f798c33d081 compression AUTO
Column "rpc-falcon.CompileService.Compile-received-bytes_distribution_max" guid = 2f575e49-a34a-41a2-9442-15997c529f09 compression AUTO
Column "rpc-falcon.CompileService.Compile-received-bytes_distribution_mean" guid = 7ab87983-621f-4ec2-a415-efcd80bfc1de compression AUTO
Column "rpc-falcon.CompileService.Compile-received-bytes_distribution_count" guid = ae9bef60-cd44-4485-bebf-4fa1f037a73a compression AUTO
Column "rpc-falcon.CompileService.Compile-received-errors" guid = 2b6db532-b1cb-4173-9d99-f2da5ba3c691 compression AUTO
Column "rpc-falcon.CompileService.Compile-received" guid = c2828d00-4081-4c8c-a217-03f55a438d29 compression AUTO
Column "rpc-falcon.CompileService.Compile-sent-bytes_distribution_min" guid = b8b31b55-a1d9-4b4a-b370-bcd7458813c1 compression AUTO
Column "rpc-falcon.CompileService.Compile-sent-bytes_distribution_max" guid = 4d1befdc-bb8e-4bf3-9427-29fef14e8412 compression AUTO
Column "rpc-falcon.CompileService.Compile-sent-bytes_distribution_mean" guid = 6de87f7c-cfad-4f88-908e-0897644a1ac6 compression AUTO
Column "rpc-falcon.CompileService.Compile-sent-bytes_distribution_count" guid = 57b0383c-dd2d-44f0-bf8e-00d9fb18fd17 compression AUTO
Column "rpc-falcon.CompileService.Compile-sent-errors" guid = ea603ae4-6b73-4f4f-968b-59b482d73107 compression AUTO
Column "rpc-falcon.CompileService.Compile-sent" guid = 30fca5fa-1aff-4dc0-9b5d-5fb1bcd3cf5b compression AUTO
Column "rpc-falcon.CompileService.Compile-server-latency-us_distribution_min" guid = 68bf0bed-9a5f-4bab-a579-087c23bb124c compression AUTO
Column "rpc-falcon.CompileService.Compile-server-latency-us_distribution_max" guid = 2089caa5-a93e-4057-9382-93e9e1af019d compression AUTO
Column "rpc-falcon.CompileService.Compile-server-latency-us_distribution_mean" guid = ca989163-8718-4dec-abde-41b7cccc5191 compression AUTO
Column "rpc-falcon.CompileService.Compile-server-latency-us_distribution_count" guid = 6c962f60-16b3-4880-9909-d7e6a2eb668d compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_min" guid = 0c9459d1-247a-4ed1-a293-32454fffb872 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_max" guid = 88e27646-40ca-49dd-9f43-b35c8eff3014 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_mean" guid = 834b651d-ac7f-47e6-9f62-17145ce65d5c compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_count" guid = c5ba6a88-b4f3-4ce2-b3f8-c5523992b2a8 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-active_distribution_min" guid = 2fc68dd6-d4e7-473f-9eda-66c66c30067a compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-active_distribution_max" guid = 866f26de-96c5-437a-865f-a15af84a6387 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-active_distribution_mean" guid = a02f69ea-6ab8-4f0f-a362-b1afb9fa5580 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-active_distribution_count" guid = f5caef09-9f27-48a4-9aab-7f3f5e5efd85 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_min" guid = 36bd022d-e0fe-4490-8725-5834d7c185f1 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_max" guid = da9f160e-a556-4412-8ca1-f7470ac8012d compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_mean" guid = bf7e26e1-5f75-4ba8-b7c6-d957537acb62 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_count" guid = 2dac2bd2-d69a-4e74-b622-940108b66e97 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received-errors" guid = ea988c93-a8df-4221-be77-661cbc166f41 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-received" guid = cd4e41fc-3146-4a83-9f72-fda17bb2f404 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_min" guid = 67850c4e-e6a6-4eeb-8982-9e3cbdd8cfba compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_max" guid = 204b6363-5e4e-4147-ac2a-67c113249609 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_mean" guid = 711d92ef-b155-4c80-80cd-f3ca598adc14 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_count" guid = c8562091-b647-4206-9700-03524e93d797 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-sent-errors" guid = 0fcc7ecc-9eb5-46a6-8ad1-301596079e3f compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-sent" guid = d006474a-321d-4c15-bae5-f612d46843ee compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_min" guid = fc6ba76f-92ec-43f0-b7bb-68eacd6925ea compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_max" guid = 0a184373-612c-4902-8a5f-b26b2c488179 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_mean" guid = d4776fa1-d708-4b72-a0d1-3735b94edd29 compression AUTO
Column "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_count" guid = 3048a22d-3310-423d-b243-7b12d6a97d23 compression AUTO
Column "rpc-falcon.FalconRequest-client-latency-us_distribution_min" guid = de7dabe7-a537-4adf-89aa-ed85a882d741 compression AUTO
Column "rpc-falcon.FalconRequest-client-latency-us_distribution_max" guid = a9465aa0-d0af-4a03-9d33-c91c76e4e6b1 compression AUTO
Column "rpc-falcon.FalconRequest-client-latency-us_distribution_mean" guid = c8127575-03a7-44d9-ba85-dfdbf419cdc3 compression AUTO
Column "rpc-falcon.FalconRequest-client-latency-us_distribution_count" guid = c6b0f3d5-0d63-49a5-af6e-ec4cc7f05138 compression AUTO
Column "rpc-falcon.FalconRequest-received-active_distribution_min" guid = e684309b-ffda-4129-a3cf-cdc6e94cacd9 compression AUTO
Column "rpc-falcon.FalconRequest-received-active_distribution_max" guid = 6295053c-0d30-45ab-b0ed-878f2d9d98dd compression AUTO
Column "rpc-falcon.FalconRequest-received-active_distribution_mean" guid = 2ea3c3bf-8623-4810-a125-f066520961a6 compression AUTO
Column "rpc-falcon.FalconRequest-received-active_distribution_count" guid = 2d7576e0-bd98-4716-bf3a-14f203901119 compression AUTO
Column "rpc-falcon.FalconRequest-received-bytes_distribution_min" guid = 78260893-330f-478f-8694-1d281e006204 compression AUTO
Column "rpc-falcon.FalconRequest-received-bytes_distribution_max" guid = 032ebc2a-1a44-495b-91c2-aafbba71f62d compression AUTO
Column "rpc-falcon.FalconRequest-received-bytes_distribution_mean" guid = 18bdd082-bb5d-4205-98d1-bd4268964118 compression AUTO
Column "rpc-falcon.FalconRequest-received-bytes_distribution_count" guid = 9d45baef-71fb-4b50-ab99-baad6e1384ce compression AUTO
Column "rpc-falcon.FalconRequest-received-errors" guid = f66bd3ba-f644-47e2-91a3-2209b38b122b compression AUTO
Column "rpc-falcon.FalconRequest-received" guid = 96512c36-ee5b-4442-977d-da827fe64d17 compression AUTO
Column "rpc-falcon.FalconRequest-sent-bytes_distribution_min" guid = 8cecd7cf-c46d-4ae4-a4e6-1146ac8a88a2 compression AUTO
Column "rpc-falcon.FalconRequest-sent-bytes_distribution_max" guid = 3a126a18-2e3b-4846-a610-44c1031cab71 compression AUTO
Column "rpc-falcon.FalconRequest-sent-bytes_distribution_mean" guid = 5c39a52b-e349-4508-aa16-23a8286ee0b5 compression AUTO
Column "rpc-falcon.FalconRequest-sent-bytes_distribution_count" guid = 5eb83384-447b-4cd6-886c-b7624159691f compression AUTO
Column "rpc-falcon.FalconRequest-sent-errors" guid = db077869-794d-4b81-b606-6150fb2a3faf compression AUTO
Column "rpc-falcon.FalconRequest-sent" guid = 1e385170-28d1-4705-bdd0-aaceb756f39c compression AUTO
Column "rpc-falcon.FalconRequest-server-latency-us_distribution_min" guid = 120e7eba-c7a4-4a5c-ae8f-b142ef3d71bb compression AUTO
Column "rpc-falcon.FalconRequest-server-latency-us_distribution_max" guid = 2fb27ebb-5d5c-4a27-b4d4-f45295d600d9 compression AUTO
Column "rpc-falcon.FalconRequest-server-latency-us_distribution_mean" guid = 1306e78f-8bb8-4a4d-ada3-7861d411c98a compression AUTO
Column "rpc-falcon.FalconRequest-server-latency-us_distribution_count" guid = 8c49a4e3-fd84-476e-917a-872e0d8d549c compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_min" guid = 927f2c99-d831-41ac-b241-e4ce84d33e18 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_max" guid = 4857078b-7b5d-45c3-86c5-022e1170aac7 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_mean" guid = b1d1113c-9299-4400-a553-3935ee79b933 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_count" guid = f02523d2-6448-4d3f-928c-44894ae6ce08 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_min" guid = f5d8c7a5-7999-42da-a31c-03259077cf0c compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_max" guid = 2deb5205-e6a4-4899-b7c6-5f7f18747ac3 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_mean" guid = db2ebfcf-2c9d-4299-9810-07e632780f48 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_count" guid = c3408327-2f50-4d7d-b37c-0d17208af24d compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_min" guid = 0005768d-790d-4c5e-8252-0a9c54c24e4e compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_max" guid = 73f0f917-25ac-4ffe-b44e-9ce9ce0e773e compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_mean" guid = 379e1778-3004-4611-9663-b027c8f0b0ea compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_count" guid = a447b290-cca9-42c9-946b-ac8097f5e0a4 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received-errors" guid = 9218bc13-0b28-4cac-bb6f-481a186c51ea compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-received" guid = fdf8f152-fb3c-49f2-9ced-f4ef65ff7485 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_min" guid = ca5643e0-42b8-490d-b3e9-f6c0dbbc0871 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_max" guid = dd47aada-6c55-43aa-8abe-a209d5ea3c4e compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_mean" guid = 469d8a96-cb77-4f57-b96a-f9930fdf7e62 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_count" guid = 5be8f0e0-8c88-4a3f-b907-45e9bf82fa23 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-sent-errors" guid = f5ceab9a-537f-4296-979d-a1ef4ba6ca22 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-sent" guid = 86642f5b-749e-4d07-9c57-42d12e8bdb54 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_min" guid = 381460ab-9d38-497f-8a0e-4342ba287257 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_max" guid = ca09952a-5d92-4835-8105-1d8c6dccf256 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_mean" guid = 23c0e550-a787-4203-8424-e2f3d5de9eb3 compression AUTO
Column "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_count" guid = d67a307b-c5bb-496c-8dda-83908f9f36ed compression AUTO
Column "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_min" guid = 2cbe0f98-4e8f-4096-93e5-086c6b877ad3 compression AUTO
Column "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_max" guid = 9be2c372-3b22-4508-bd50-e264a6b17606 compression AUTO
Column "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_mean" guid = 85b522de-f21f-45ce-b288-28edaaa2052d compression AUTO
Column "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_count" guid = 50e84c18-3c6d-474d-90eb-3f71db538869 compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-active_distribution_min" guid = a3744be9-dd80-4bac-a429-b1553bc1c0fc compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-active_distribution_max" guid = cc09a076-44cc-40c6-a795-a85715619d8d compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-active_distribution_mean" guid = c71b47f3-da0a-4ed1-bc00-8dd65c55a262 compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-active_distribution_count" guid = 0b549206-f484-45fb-aad9-98c54811a040 compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-bytes_distribution_min" guid = 5de65295-0501-43c9-8bea-d68ff7e322e6 compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-bytes_distribution_max" guid = 076da0d5-ae05-4503-8e63-97ab2ef32689 compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-bytes_distribution_mean" guid = 79ac4788-2af4-408f-b8fa-1e1480de086b compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-bytes_distribution_count" guid = 2e051fdc-b71d-4191-996e-90313f61a9aa compression AUTO
Column "rpc-falcon.OpenScannerRequest-received-errors" guid = 8c7fb70b-eb7d-4af8-8d80-6f8483b4f8bc compression AUTO
Column "rpc-falcon.OpenScannerRequest-received" guid = df3dd50c-3e97-4f1b-a897-3db88bf2659f compression AUTO
Column "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_min" guid = 2f9b53bf-68f7-4c72-bc86-b61cd1e50242 compression AUTO
Column "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_max" guid = 21ed16f4-e64e-4feb-b28e-318a0225beb0 compression AUTO
Column "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_mean" guid = 7f10ce56-0abc-4fdd-a871-24a4b2bb2a49 compression AUTO
Column "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_count" guid = af45abe1-392b-4fce-aa2f-f367f9d1bc84 compression AUTO
Column "rpc-falcon.OpenScannerRequest-sent-errors" guid = f88d0999-8e1a-41b6-a31a-f9ce2179c425 compression AUTO
Column "rpc-falcon.OpenScannerRequest-sent" guid = 8b9b552a-5a33-4988-9f22-3de6cfee8f69 compression AUTO
Column "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_min" guid = 42271adc-12a4-4de6-a30a-94f4d3c2445e compression AUTO
Column "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_max" guid = 0233cb39-6851-483a-9c28-34036016548b compression AUTO
Column "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_mean" guid = 96f55260-fa95-4924-99cb-cb866982dc82 compression AUTO
Column "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_count" guid = d81be2a1-2317-465d-bcc7-27fc9335fdf1 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_min" guid = eb63a1fc-5417-4bee-bb9c-08e7c07e5030 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_max" guid = 2316ecf7-ddd0-407d-bf03-b4accd69097e compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_mean" guid = d08de29e-81b7-4e08-90a8-c7b6e57b106c compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_count" guid = f1065b56-4b03-43a6-986a-fd44d4cfeeb5 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_min" guid = 9c3560eb-72e3-48a8-9a01-ce07b6c8de84 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_max" guid = 2c72b7da-d630-41c9-9baa-e881fe219892 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_mean" guid = df426c32-da8c-409e-85d0-ac4f6c1cbf2d compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_count" guid = 7f57bfc0-5b86-47fb-b435-222b596e70cf compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_min" guid = a2fe40b2-cf2f-4348-97c7-780f291b0052 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_max" guid = f6380740-4628-49a9-ba97-fc42a5472f49 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_mean" guid = 6d34451f-b9ad-4940-a39c-7f9938771a30 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_count" guid = 51debcec-6555-4f72-8127-a84eff2fa28e compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received-errors" guid = ef815935-217e-46a7-a332-71ac0c7fe538 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-received" guid = af7bb365-cdca-4e87-a054-abf20de938cc compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_min" guid = 76d605e3-6b49-4cf7-a44d-e3296fbde467 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_max" guid = b593c6d2-c2be-48cb-aecf-db7460a1c213 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_mean" guid = fced9c3a-37ff-497c-bccf-a2117c2e49d5 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_count" guid = e5b6aa07-b492-4141-88d1-24bb41bc8434 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-sent-errors" guid = 178b3804-7691-43e4-9d27-6c94d35ea616 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-sent" guid = 65d1e010-883d-444f-a88c-765bb4c16be9 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_min" guid = 0650460b-a8ab-4206-a9a6-a7a49f3a3325 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_max" guid = 97fe7dce-dcd0-45b9-85fd-2fc6810be644 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_mean" guid = f02d2972-ce5a-46cc-9336-ce0718c7edf9 compression AUTO
Column "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_count" guid = 1f2860a7-6c22-4de1-8b3f-aed4e92f0de4 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_min" guid = 65f9632a-37ce-411c-8cfc-473e8db05d2e compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_max" guid = e59e935d-274e-43a1-950d-56814778d16f compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_mean" guid = b6cd4d90-2cd5-4d82-a639-717d2de5f7a6 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_count" guid = 303af5c8-c586-436f-91f0-dfd97ec4be9a compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_min" guid = eb712463-027f-485d-a2fd-684cd8c6f51a compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_max" guid = 80daa36a-c9a6-473c-a50e-30d7fefcc1ce compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_mean" guid = c9c87062-9336-405b-8f4f-694e2f994bb6 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_count" guid = c0f4672b-543f-40db-8966-0120d28f0e75 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_min" guid = e0f5a129-1518-4949-9a32-4b7204c40533 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_max" guid = 22a3cfcd-fec3-42f2-8255-be61de720024 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_mean" guid = 6c4361bf-3e02-4661-9787-a6cab2e7aa2d compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_count" guid = 9be2d64a-0b50-43a9-9d9b-08bf55be28ed compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received-errors" guid = 8d0873b3-7d83-4427-ac83-1cb43f2ff4e1 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-received" guid = 2fa72ee1-4634-4b0d-a3a8-1b0f59a57c5d compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_min" guid = 3e4b158f-393f-4986-909d-792b00c59901 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_max" guid = 0674d2bd-8905-4939-8495-0f2d00d0d3ee compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_mean" guid = aafdf31c-00b5-44b4-8d3a-75233148130d compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_count" guid = 25ca5ba1-cdbb-4bd2-a642-880a23cf5d41 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-sent-errors" guid = d679f514-50c4-46f5-b2c8-c0b5ec52d184 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-sent" guid = 2cc691dd-2809-4941-b5c2-f3c5cfb4b465 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_min" guid = 8765d56c-72d2-4e3a-995e-e408fd17349c compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_max" guid = f6c3f57a-87fc-4b1a-b469-a874ec981a2d compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_mean" guid = d382c5dd-fbb8-44ee-9639-08d030591573 compression AUTO
Column "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_count" guid = 09d72370-db2f-46f0-bb39-7779100c5c70 compression AUTO
Column "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_min" guid = c73c95ce-87bb-4661-a253-b4cf2678aad1 compression AUTO
Column "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_max" guid = 55590c82-a5fb-4fa1-8812-96eecad49abb compression AUTO
Column "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_mean" guid = 5fbbc0d5-7056-4166-b011-352997a1c043 compression AUTO
Column "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_count" guid = 3672f50c-a22b-4c4c-8523-85f970703ad2 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-active_distribution_min" guid = 88ed5a44-6e08-49c7-a340-40736482bfbc compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-active_distribution_max" guid = aa0330ab-dadd-4a44-96b0-2c72f6025312 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-active_distribution_mean" guid = 0f948f5f-b76f-431d-8314-da5659bb6981 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-active_distribution_count" guid = d90d3f6f-a68a-4390-b70e-2500e06eedf9 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-bytes_distribution_min" guid = 21f217cc-fb10-4701-9aff-77e0db4c1925 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-bytes_distribution_max" guid = 50f32f9a-3f54-4eeb-9d1b-805632b37262 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-bytes_distribution_mean" guid = 3aaaa676-d84e-4168-999d-bf464f4ee140 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-bytes_distribution_count" guid = bc19bada-94f2-4688-8ff1-d253880a0394 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received-errors" guid = 6e677181-4ff2-4c50-bddd-166ebbddf825 compression AUTO
Column "rpc-falcon.ReadScannerRequest-received" guid = 90535cc4-92fe-460c-ab44-4dcc2f25c549 compression AUTO
Column "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_min" guid = 51e32915-14cd-4158-be23-9b56d97a795e compression AUTO
Column "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_max" guid = 9641274c-4521-4fcb-87b7-a193afeac2d1 compression AUTO
Column "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_mean" guid = 04e079e3-7d9c-4590-bcc9-8307652bb9bf compression AUTO
Column "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_count" guid = 7b7bf83c-4d58-4c0c-838b-35ebfb25f807 compression AUTO
Column "rpc-falcon.ReadScannerRequest-sent-errors" guid = 1bffedb6-3275-468f-bea6-b85af4e408d7 compression AUTO
Column "rpc-falcon.ReadScannerRequest-sent" guid = 6c9b5ed1-d302-481e-aa12-d280d412ea9f compression AUTO
Column "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_min" guid = 3bb4ae18-9f4b-46ba-9d33-dcb44f84e435 compression AUTO
Column "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_max" guid = b09009f3-7c91-4fa6-8c0f-2dd5e06b62e6 compression AUTO
Column "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_mean" guid = 4be9a000-2249-45e0-bc6e-5e78c9aa7cec compression AUTO
Column "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_count" guid = b2d954d9-d064-4004-a078-45a9d4ce022e compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_min" guid = 2f468f77-619a-407f-8c99-34accac31adb compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_max" guid = 87aca4f8-3a7b-4b5d-93a5-42e26fd524fd compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_mean" guid = 1e9d8ce4-4aec-49ce-a9f0-040ea342aa85 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_count" guid = d9c5aedc-ec44-4b7d-9eed-a9eaeb527589 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_min" guid = d45b5d09-dafd-4028-b4d1-37b6669c4a4c compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_max" guid = 86fcc5b1-5f3d-4813-a4f0-488111fae6fd compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_mean" guid = c34986cd-2505-4fab-a614-de9964417c95 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_count" guid = 15832aaf-2cf7-41b0-a566-3a678d1e4ded compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_min" guid = 85e3eca0-0eeb-411c-892b-34fa347cdf25 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_max" guid = 06de65e1-1f32-43aa-a297-357f401a887e compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_mean" guid = a6af2d37-d6d4-40db-b038-069119e47818 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_count" guid = ea814379-f015-438f-99d6-46db6edda745 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received-errors" guid = 3c920ae4-4c91-4302-a075-94e634a7a8dd compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-received" guid = bbbc9ded-7b5d-4eab-91c2-40835f410267 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_min" guid = 403d2ad3-e957-4ce9-b637-edf2ec0ebf47 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_max" guid = 371caab6-9570-4479-b473-39750f070d78 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_mean" guid = 3d812407-f9fd-48bf-b053-15ac7882e15b compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_count" guid = b706ed4a-f687-49ae-9b6f-901887dd131c compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-sent-errors" guid = 5be48cff-bdfd-40d7-92ff-7e5dc1aa2691 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-sent" guid = 8c2c1d7f-881c-47df-afb5-7592a337c227 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_min" guid = 16617a6a-4944-405b-96ad-b904f1e39314 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_max" guid = f25a73f9-b7d2-4426-9abd-6bfa3a4c4979 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_mean" guid = 5cb33c69-cf1d-4d27-8e03-7866094bcc17 compression AUTO
Column "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_count" guid = d2e9b1f7-123c-4b42-8de3-a713e367ff15 compression AUTO
Column "rpc-FalconServer.all-received-queue-size_distribution_min" guid = 581b6f2d-296f-46f1-b821-d970a993ef1c compression AUTO
Column "rpc-FalconServer.all-received-queue-size_distribution_max" guid = 5fac1b0e-c394-4334-b07f-7d89226ca79a compression AUTO
Column "rpc-FalconServer.all-received-queue-size_distribution_mean" guid = 24984693-44ba-4c8f-9704-2b5c5e0dee74 compression AUTO
Column "rpc-FalconServer.all-received-queue-size_distribution_count" guid = fb075cc6-e128-48c7-be2f-c6d1faf4cb6a compression AUTO
Column "rpc-FalconServer.all-received-queue-wait-time-us_distribution_min" guid = b5e2ffd1-dc71-4252-bd07-917ea4f68e16 compression AUTO
Column "rpc-FalconServer.all-received-queue-wait-time-us_distribution_max" guid = 9713d90a-de80-482e-8160-a8efc7981dff compression AUTO
Column "rpc-FalconServer.all-received-queue-wait-time-us_distribution_mean" guid = c263bcb7-8af0-4b6c-a2d7-aacbb3ebf01e compression AUTO
Column "rpc-FalconServer.all-received-queue-wait-time-us_distribution_count" guid = b1abbace-9ad8-4b32-baa2-9a219445f38c compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_min" guid = 26b38351-a7a8-4f9f-a9b3-a5ee298982b1 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_max" guid = d3b0c1b9-78d6-40e8-b1c2-e9e5afdecb0e compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_mean" guid = 0c2a62e9-d28e-4531-af5d-58b10c0ef249 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_count" guid = 1729f040-4984-414c-94a2-19ccc159ee17 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-active_distribution_min" guid = 0718bdf1-1d8e-4c69-af5a-2dfdc660ff1f compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-active_distribution_max" guid = e78ccbf8-fa2e-42a7-a13a-ba07394fc047 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-active_distribution_mean" guid = 462ce088-fa88-4d80-8658-1f8c27cf08d0 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-active_distribution_count" guid = c7e92fc5-8c4d-4ed5-9cf5-e0c9525e9b8b compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_min" guid = 08c0d6ed-34d7-4525-be85-3f94cda1f1e6 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_max" guid = 05bcf4fa-0d72-47d3-b771-e135ea69963e compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_mean" guid = 42b548c9-2474-4d42-b152-0a89419ebf9d compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_count" guid = e021bfd9-62f2-4776-8943-ed29251a50d0 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received-errors" guid = ae66cde9-3ee5-48b3-b81e-e43f06377200 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-received" guid = a458b55c-9682-43cb-8236-7b4e76706d88 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_min" guid = 1281c486-1ad5-45d9-a81d-0b32f3eec0b1 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_max" guid = 7e5f5d08-a76b-4e94-a316-b1cbc734f776 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_mean" guid = 162d57ce-b2c6-45b0-921a-eb7f4277100f compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_count" guid = 55230fdb-b604-42e5-9b2f-84db39311db9 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-sent-errors" guid = 325ba037-4b4e-4a80-81f6-63588308a6e7 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-sent" guid = 26c8d40e-4e70-4b67-b811-00f227ffdbd2 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_min" guid = a5cf491b-f74b-47f6-857a-8ba03ea85d19 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_max" guid = ab90b9fd-4e81-459d-9aa3-a72ed7975e55 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_mean" guid = aee08af1-608e-4761-9bf1-4e5506ee5f70 compression AUTO
Column "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_count" guid = fad522a7-2b7d-497c-8eea-3e5109ff8bf9 compression AUTO
Column "watcher-_orion_local_service_falcon_compile_server_status-queue-size" guid = 541b601e-cf12-4577-910a-037406974499 compression AUTO
Column "watcher-_orion_local_service_falcon_manager_status-queue-size" guid = 1acbbf43-00d0-4a91-84cb-094ec8fae3db compression AUTO
Column "watcher-_orion_local_service_falcon_manager_userdata_schema-queue-size" guid = 4bb4106a-3a57-4bf4-a888-fd9b74ec6a31 compression AUTO
Column "watcher-_orion_local_service_falcon_moderator_status-queue-size" guid = 433ebd26-6492-49a9-8b16-efeba541ac40 compression AUTO
Column "watcher-_orion_local_service_falcon_moderator_userdata_dictionary_depot-queue-size" guid = 2c50b1f4-7e9d-4166-9759-67b00ab40ac1 compression AUTO
Column "watcher-_orion_local_service_falcon_moderator_userdata_metadata_store-queue-size" guid = 3de2684c-c435-467b-b537-c20ac4ebe367 compression AUTO
Column "watcher-_orion_local_service_falcon_moderator_userdata_proposal_registry-queue-size" guid = 692bf870-bdb0-48a8-b6c4-eb8bb2dacd3e compression AUTO
Column "watcher-_orion_local_service_falcon_status-queue-size" guid = d739472e-3f04-4479-9cba-77aa51f72ee5 compression AUTO
Column "watcher-_orion_local_service_falcon_userdata_config-queue-size" guid = ddf9c7fc-e6d1-4e9b-87d0-41bec19323e6 compression AUTO
Column "watcher-_orion_local_service_falcon_userdata_status_0-queue-size" guid = 2a683399-aadc-46fb-9a8b-ede824108177 compression AUTO
Column "watcher-_orion_local_service_falcon_userdata_status_1-queue-size" guid = fc245c44-caf1-45b6-9bfb-378e1460a2af compression AUTO
Column "watcher-_orion_local_service_falcon_userdata_status_2-queue-size" guid = 5d201212-c4c7-4bf2-b1b3-c37b4052f33e compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.Pinboard.hits" guid = 72e55fe4-099d-4472-bc96-06a13c6ffe9a"falcon.worker.cache.caffeine_warmedup.Pinboard.hits" default 0 compression AUTO
Column "falcon.worker.cache.Caffeine.hits" guid = 1fd7e9ff-d5e5-4eb2-999c-445e572516f4"falcon.worker.cache.Caffeine.hits" default 0 compression AUTO
Column "falcon.worker.cache.Caffeine.misses" guid = 8cb7a0b7-2eab-40b5-afe7-73e964271a8d"falcon.worker.cache.Caffeine.misses" default 0 compression AUTO
Column "falcon.worker.cache.Pinboard.hits" guid = acad0ff3-89e2-4a86-81a2-3e789249b520"falcon.worker.cache.Pinboard.hits" default 0 compression AUTO
Column "falcon.worker.cache.Pinboard.misses" guid = 5f42e47c-a549-421a-af55-0393af299b11"falcon.worker.cache.Pinboard.misses" default 0 compression AUTO
Column "falcon.worker.cache.SavedAnswer.hits" guid = b73a9ea0-9b43-49a5-b9eb-eb491427d741"falcon.worker.cache.SavedAnswer.hits" default 0 compression AUTO
Column "falcon.worker.cache.SavedAnswer.misses" guid = 09ca785d-fac3-4913-afb5-cce494dc4169"falcon.worker.cache.SavedAnswer.misses" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_accesses.count" guid = 7e1b654a-5adf-47ed-b3d0-f5f9c9013472"falcon.worker.cache.caffeine_accesses.count" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_effective.A3.pcnt" guid = 7b0b1713-80f2-4e10-bb52-6b531c416450"falcon.worker.cache.caffeine_effective.A3.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.AdhocSearch.pcnt" guid = 08a11eb9-968d-414d-87bf-eb1b2f8cc002"falcon.worker.cache.caffeine_effective.AdhocSearch.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.Caffeine.pcnt" guid = 4dc70841-d8bf-43fa-b40b-624650c9efb4"falcon.worker.cache.caffeine_effective.Caffeine.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.CliQuery.pcnt" guid = 71c35026-a748-43ed-ad58-5ca25a427170"falcon.worker.cache.caffeine_effective.CliQuery.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.Dictionary.pcnt" guid = 390169ef-25f7-4303-9309-852fb1c053e0"falcon.worker.cache.caffeine_effective.Dictionary.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.InsertInto.pcnt" guid = fc924fc1-6739-46a7-9942-f4bf3eb261eb"falcon.worker.cache.caffeine_effective.InsertInto.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.InternalStats.pcnt" guid = 4e1aab17-fa76-4005-88f3-420444004c21"falcon.worker.cache.caffeine_effective.InternalStats.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.Pinboard.pcnt" guid = cf109ca5-45a1-48cf-b22c-367d9737d882"falcon.worker.cache.caffeine_effective.Pinboard.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.SageBuilding.pcnt" guid = 0c00b210-9524-4af3-beb9-ed1cb2e2143b"falcon.worker.cache.caffeine_effective.SageBuilding.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.SavedAnswer.pcnt" guid = 20c41b4f-7cf7-4056-9e73-f3b95b4a04a9"falcon.worker.cache.caffeine_effective.SavedAnswer.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.Simba.pcnt" guid = 47f535ce-59e6-421b-82be-f5f3def5caa5"falcon.worker.cache.caffeine_effective.Simba.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effective.Unknown.pcnt" guid = 0f202aeb-ff0d-4886-80a6-bb0f4104d416"falcon.worker.cache.caffeine_effective.Unknown.pcnt" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_effectiveness.percentage" guid = b36e13b7-e251-41ab-a03c-dcbe384a7608"falcon.worker.cache.caffeine_effectiveness.percentage" default 0.000000 compression AUTO
Column "falcon.worker.cache.caffeine_ineffective_warmups.percentage" guid = 91db6672-6c9b-4f39-b361-60739ae88a53"falcon.worker.cache.caffeine_ineffective_warmups.percentage" default 100.000000 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.A3.hits" guid = 63c84a15-7c81-4125-b4f7-bd679b0ab144"falcon.worker.cache.caffeine_warmedup.A3.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.AdhocSearch.hits" guid = e6e4ef9f-cfe6-4c1f-821d-dac2bb04f213"falcon.worker.cache.caffeine_warmedup.AdhocSearch.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.Caffeine.hits" guid = 83bf63b3-73a2-4376-8f31-9e3bfdbd32b1"falcon.worker.cache.caffeine_warmedup.Caffeine.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.CliQuery.hits" guid = fef07c04-598f-484c-a618-ee5b96380b33"falcon.worker.cache.caffeine_warmedup.CliQuery.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.Dictionary.hits" guid = 0167863f-64ee-4e59-8605-9e90e6d8ceee"falcon.worker.cache.caffeine_warmedup.Dictionary.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.InsertInto.hits" guid = 74724dee-dcb5-4da8-a0fe-d0f1515c3ad6"falcon.worker.cache.caffeine_warmedup.InsertInto.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.InternalStats.hits" guid = be86db87-8277-4d8d-b2be-5e3cbb6fd92d"falcon.worker.cache.caffeine_warmedup.InternalStats.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.SageBuilding.hits" guid = 1e7eb36c-ce00-4f37-b9e8-3c0eb837f993"falcon.worker.cache.caffeine_warmedup.SageBuilding.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.SavedAnswer.hits" guid = 695b22f3-c3b4-4cda-a6e9-56fc9fdf94dd"falcon.worker.cache.caffeine_warmedup.SavedAnswer.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.Simba.hits" guid = 4e3bcaf6-d1c6-4ca8-a47d-342f9fe8ed29"falcon.worker.cache.caffeine_warmedup.Simba.hits" default 0 compression AUTO
Column "falcon.worker.cache.caffeine_warmedup.Unknown.hits" guid = af323d00-249c-4f8a-939e-933eb8ff9720"falcon.worker.cache.caffeine_warmedup.Unknown.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.A3.hits" guid = 5ff60a2e-fa2a-4c2d-b750-27df663f7ab0"falcon.worker.cache.source.A3.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.AdhocSearch.hits" guid = 1aec0a27-fcbf-47c4-a7eb-86cb03e38721"falcon.worker.cache.source.AdhocSearch.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.Caffeine.hits" guid = b365bfcb-0b53-4912-895f-e60322ada8e9"falcon.worker.cache.source.Caffeine.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.CliQuery.hits" guid = 3ef3506f-bde1-4688-b743-4cb3f14d5fc3"falcon.worker.cache.source.CliQuery.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.Dictionary.hits" guid = 3b9c03e7-e2a4-4c9e-bd64-efae1d2d4dbf"falcon.worker.cache.source.Dictionary.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.InsertInto.hits" guid = 618289db-d6e4-497c-9515-971777c8f2a0"falcon.worker.cache.source.InsertInto.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.InternalStats.hits" guid = 78756ec2-8308-4e9f-a697-affa8db1775b"falcon.worker.cache.source.InternalStats.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.Pinboard.hits" guid = 0cdc136c-c278-44c4-8839-38ccd462e79b"falcon.worker.cache.source.Pinboard.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.SageBuilding.hits" guid = 351bebc2-9897-4641-80e4-5e4377bd8b11"falcon.worker.cache.source.SageBuilding.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.SavedAnswer.hits" guid = 556db968-1fd5-4732-84a2-6d75038d5f01"falcon.worker.cache.source.SavedAnswer.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.Simba.hits" guid = 5fa1e4b7-8de6-4209-9186-a04429048b2a"falcon.worker.cache.source.Simba.hits" default 0 compression AUTO
Column "falcon.worker.cache.source.Unknown.hits" guid = 5ddfe4bc-ab19-4253-9ef4-4158819321e0"falcon.worker.cache.source.Unknown.hits" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.A3.counts" guid = fe096c8f-6a3b-4e21-94f6-e868bcc27397"falcon.worker.uncacheable.accesses.A3.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.AdhocSearch.counts" guid = 81f9f309-64fa-4085-bd8e-48964f7b8aa7"falcon.worker.uncacheable.accesses.AdhocSearch.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.Caffeine.counts" guid = b9664330-d6d7-4b80-95d2-a53aa18931d1"falcon.worker.uncacheable.accesses.Caffeine.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.CliQuery.counts" guid = 7d61e92c-378c-4429-a8f4-04a8b1a7e248"falcon.worker.uncacheable.accesses.CliQuery.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.Dictionary.counts" guid = 2b3bc37b-db09-45a5-a899-a71da2c2af8f"falcon.worker.uncacheable.accesses.Dictionary.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.InsertInto.counts" guid = b487fdec-3c1a-4360-a837-e9f12a443a2c"falcon.worker.uncacheable.accesses.InsertInto.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.InternalStats.counts" guid = 7d47c48f-c455-4afe-8182-5e4acf14defd"falcon.worker.uncacheable.accesses.InternalStats.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.Pinboard.counts" guid = 26d8fa1f-75b4-4c3a-a6cb-8adcedbc6f91"falcon.worker.uncacheable.accesses.Pinboard.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.SageBuilding.counts" guid = dff34e4f-560c-48e2-80b0-52cd8913ae6f"falcon.worker.uncacheable.accesses.SageBuilding.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.SavedAnswer.counts" guid = aef15406-9977-4ad7-8561-dda89cb22ef5"falcon.worker.uncacheable.accesses.SavedAnswer.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.Simba.counts" guid = 67ac2036-8773-4a9e-991e-77fa6df16548"falcon.worker.uncacheable.accesses.Simba.counts" default 0 compression AUTO
Column "falcon.worker.uncacheable.accesses.Unknown.counts" guid = 1fa1fc60-5517-4039-acab-eb42bdb62fae"falcon.worker.uncacheable.accesses.Unknown.counts" default 0 compression AUTO
PARTITION BY HASH  (48) KEY ("hostport" )
Live Schema Version 3
 */
CREATE TABLE "falcon_default_schema"."falcon_monitor_varz_stats" (
    "timestamp" DATETIME,
    "hostport" varchar(32),
    "falcon.config.load_master_build_map__distribution_min" double,
    "falcon.config.load_master_build_map__distribution_max" double,
    "falcon.config.load_master_build_map__distribution_mean" double,
    "falcon.config.load_master_build_map__distribution_count" bigint,
    "falcon.config.load_master_build_map_num_runs_" bigint,
    "falcon.config.load_master_create_load_ops__distribution_min" double,
    "falcon.config.load_master_create_load_ops__distribution_max" double,
    "falcon.config.load_master_create_load_ops__distribution_mean" double,
    "falcon.config.load_master_create_load_ops__distribution_count" bigint,
    "falcon.config.load_master_create_load_ops_num_runs_" bigint,
    "falcon.config.load_master_expired_table_removal__distribution_min" double,
    "falcon.config.load_master_expired_table_removal__distribution_max" double,
    "falcon.config.load_master_expired_table_removal__distribution_mean" double,
    "falcon.config.load_master_expired_table_removal__distribution_count" bigint,
    "falcon.config.load_master_expired_table_removal_num_runs_" bigint,
    "falcon.config.load_master_generate_load_progress_cass__distribution_min" double,
    "falcon.config.load_master_generate_load_progress_cass__distribution_max" double,
    "falcon.config.load_master_generate_load_progress_cass__distribution_mean" double,
    "falcon.config.load_master_generate_load_progress_cass__distribution_count" bigint,
    "falcon.config.load_master_generate_load_progress__distribution_min" double,
    "falcon.config.load_master_generate_load_progress__distribution_max" double,
    "falcon.config.load_master_generate_load_progress__distribution_mean" double,
    "falcon.config.load_master_generate_load_progress__distribution_count" bigint,
    "falcon.config.load_master_generate_load_progress_num_runs_" bigint,
    "falcon.config.load_master_get_status__distribution_min" double,
    "falcon.config.load_master_get_status__distribution_max" double,
    "falcon.config.load_master_get_status__distribution_mean" double,
    "falcon.config.load_master_get_status__distribution_count" bigint,
    "falcon.config.load_master_get_status_num_runs_" bigint,
    "falcon.config.load_master_handle_config__distribution_min" double,
    "falcon.config.load_master_handle_config__distribution_max" double,
    "falcon.config.load_master_handle_config__distribution_mean" double,
    "falcon.config.load_master_handle_config__distribution_count" bigint,
    "falcon.config.load_master_handle_config_num_runs_" bigint,
    "falcon.config.load_master_num_add_to_repository_ops_created_" bigint,
    "falcon.config.load_master_num_deleted_ops_" bigint,
    "falcon.config.load_master_num_dictionary_ops_created_" bigint,
    "falcon.config.load_master_num_disk_read_ops_created_" bigint,
    "falcon.config.load_master_num_disk_write_ops_created_" bigint,
    "falcon.config.load_master_num_dml_ops_created_" bigint,
    "falcon.config.load_master_num_new_ops_" bigint,
    "falcon.config.load_master_num_remote_ops_created_" bigint,
    "falcon.config.load_master_num_removed_tables_" bigint,
    "falcon.config.load_master_num_retained_ops_" bigint,
    "falcon.config.load_master_num_serialized_ops_created_" bigint,
    "falcon.config.load_master_publish_status__distribution_min" double,
    "falcon.config.load_master_publish_status__distribution_max" double,
    "falcon.config.load_master_publish_status__distribution_mean" double,
    "falcon.config.load_master_publish_status__distribution_count" bigint,
    "falcon.config.load_master_publish_status_num_runs_" bigint,
    "falcon.config.load_master_schedule_loads__distribution_min" double,
    "falcon.config.load_master_schedule_loads__distribution_max" double,
    "falcon.config.load_master_schedule_loads__distribution_mean" double,
    "falcon.config.load_master_schedule_loads__distribution_count" bigint,
    "falcon.config.load_master_schedule_loads_num_runs_" bigint,
    "falcon.config.load_master_total_add_to_repository_ops_created_" bigint,
    "falcon.config.load_master_total_deleted_ops_created_" bigint,
    "falcon.config.load_master_total_dictionary_ops_created_" bigint,
    "falcon.config.load_master_total_disk_read_ops_created_" bigint,
    "falcon.config.load_master_total_disk_write_ops_created_" bigint,
    "falcon.config.load_master_total_dml_ops_created_" bigint,
    "falcon.config.load_master_total_new_ops_created_" bigint,
    "falcon.config.load_master_total_remote_ops_created_" bigint,
    "falcon.config.load_master_total_removed_tables_" bigint,
    "falcon.config.load_master_total_retained_ops_created_" bigint,
    "falcon.config.load_master_total_serialized_ops_created_" bigint,
    "falcon.config.num_cancelled_dml_load_ops" bigint,
    "falcon.config.num_cancelled_load_ops" bigint,
    "falcon.config.num_cancelled_serialized_load_ops" bigint,
    "falcon.config.num_dml_load_ops" bigint,
    "falcon.config.num_failed_dml_load_ops" bigint,
    "falcon.config.num_failed_load_ops" bigint,
    "falcon.config.num_failed_serialized_load_ops" bigint,
    "falcon.config.num_load_ops" bigint,
    "falcon.config.num_serialized_load_ops" bigint,
    "falcon.repository.denormalizerdenormalizer.avg_sync_with_repository_num_runs_" bigint,
    "falcon.repository.denormalizerdenormalizer.build_regions__distribution_min" double,
    "falcon.repository.denormalizerdenormalizer.build_regions__distribution_max" double,
    "falcon.repository.denormalizerdenormalizer.build_regions__distribution_mean" double,
    "falcon.repository.denormalizerdenormalizer.build_regions__distribution_count" bigint,
    "falcon.repository.denormalizerdenormalizer.build_regions_num_runs_" bigint,
    "falcon.repository.denormalizerdenormalizer.num_denorm_builder_error_" bigint,
    "falcon.repository.denormalizerdenormalizer.num_denorm_tables_added_" bigint,
    "falcon.repository.denormalizerdenormalizer.num_denorm_tables_dropped_" bigint,
    "falcon.repository.denormalizerdenormalizer.process_rule__distribution_min" double,
    "falcon.repository.denormalizerdenormalizer.process_rule__distribution_max" double,
    "falcon.repository.denormalizerdenormalizer.process_rule__distribution_mean" double,
    "falcon.repository.denormalizerdenormalizer.process_rule__distribution_count" bigint,
    "falcon.repository.denormalizerdenormalizer.process_rule_num_runs_" bigint,
    "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_min" double,
    "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_max" double,
    "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_mean" double,
    "falcon.repository.denormalizerdenormalizer.set_active_version__distribution_count" bigint,
    "falcon.repository.denormalizerdenormalizer.set_active_version_num_runs_" bigint,
    "falcon.repository.denormalizerdenormalizer.set_config__distribution_min" double,
    "falcon.repository.denormalizerdenormalizer.set_config__distribution_max" double,
    "falcon.repository.denormalizerdenormalizer.set_config__distribution_mean" double,
    "falcon.repository.denormalizerdenormalizer.set_config__distribution_count" bigint,
    "falcon.repository.denormalizerdenormalizer.set_config_num_runs_" bigint,
    "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_min" double,
    "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_max" double,
    "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_mean" double,
    "falcon.repository.denormalizerdenormalizer.sync_with_repository__distribution_count" bigint,
    "falcon.repository.denormalizerdenormalizer.total_denorm_builder_error_" bigint,
    "falcon.repository.denormalizerdenormalizer.total_denorm_tables_added_" bigint,
    "falcon.repository.denormalizerdenormalizer.total_denorm_tables_dropped_" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_gc" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_failed_reads" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_failed_writes" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_reads" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblocks" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblocks_touched" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_memblock_successful_writes" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_reads" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_recovered" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.num_writes" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.read_bytes" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.read_throughput" double,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.size_bytes" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.write_bytes" bigint,
    "falcon.repository.mbstore._.._falcon_ramdisk_config_memblock_.write_throughput" double,
    "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_adds" bigint,
    "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_found_at_start" bigint,
    "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_recovered" bigint,
    "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_removes" bigint,
    "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_tables" bigint,
    "falcon.repository.tabmap._.._falcon_ramdisk_config_tabular_.num_updates" bigint,
    "falcon.worker.cache.concurrent_lookups" bigint,
    "falcon.worker.compiler_aggressive_cache.hits" bigint,
    "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_min" double,
    "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_max" double,
    "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_mean" double,
    "falcon.worker.compiler_cache.aggressive_compilation_dist_distribution_count" bigint,
    "falcon.worker.compiler_cache.cpp_size_blogged" bigint,
    "falcon.worker.compiler_cache.hits" bigint,
    "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_min" double,
    "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_max" double,
    "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_mean" double,
    "falcon.worker.compiler_cache.load_compiled_module_dist_distribution_count" bigint,
    "falcon.worker.compiler_cache.lookups" bigint,
    "falcon.worker.compiler_cache.num_aggressive_compiles" bigint,
    "falcon.worker.compiler_cache.num_background_optimized_compiles" bigint,
    "falcon.worker.compiler_cache.num_concurrent_compiles" bigint,
    "falcon.worker.compiler_cache.num_entries" bigint,
    "falcon.worker.compiler_cache.num_exceeded_seondary_cache_limit" bigint,
    "falcon.worker.compiler_cache.num_failed_remote_compile_result_loads" bigint,
    "falcon.worker.compiler_cache.num_failed_remote_compiles" bigint,
    "falcon.worker.compiler_cache.num_pending_background_compiles" bigint,
    "falcon.worker.compiler_cache.num_secondary_cache_hits" bigint,
    "falcon.worker.compiler_cache.num_secondary_cache_load_failures" bigint,
    "falcon.worker.compiler_cache.num_successful_remote_compiles" bigint,
    "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_min" double,
    "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_max" double,
    "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_mean" double,
    "falcon.worker.compiler_cache.optimized_compilation_dist_distribution_count" bigint,
    "falcon.worker.compiler_cache.overall_compilation_dist_distribution_min" double,
    "falcon.worker.compiler_cache.overall_compilation_dist_distribution_max" double,
    "falcon.worker.compiler_cache.overall_compilation_dist_distribution_mean" double,
    "falcon.worker.compiler_cache.overall_compilation_dist_distribution_count" bigint,
    "falcon.worker.compiler_cache.remote_compilation_dist_distribution_min" double,
    "falcon.worker.compiler_cache.remote_compilation_dist_distribution_max" double,
    "falcon.worker.compiler_cache.remote_compilation_dist_distribution_mean" double,
    "falcon.worker.compiler_cache.remote_compilation_dist_distribution_count" bigint,
    "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_min" double,
    "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_max" double,
    "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_mean" double,
    "falcon.worker.compiler_cache.secondary_cache_lookup_dist_distribution_count" bigint,
    "falcon.worker.compiler_cache.warmup_count" bigint,
    "falcon.worker.compiler_optimized_cache.hits" bigint,
    "falcon_worker_inmemory_compaction_threads_distribution_min" double,
    "falcon_worker_inmemory_compaction_threads_distribution_max" double,
    "falcon_worker_inmemory_compaction_threads_distribution_mean" double,
    "falcon_worker_inmemory_compaction_threads_distribution_count" bigint,
    "falcon.worker.memory_manager.clients_with_rejection" bigint,
    "falcon.worker.memory_manager.current_allotted_bytes" bigint,
    "falcon.worker.memory_manager.current_clients" bigint,
    "falcon.worker.memory_manager.current_emergency_in_use_bytes" bigint,
    "falcon.worker.memory_manager.current_uncommitted_bytes" bigint,
    "falcon.worker.memory_manager.emergency_reserve_situations" bigint,
    "falcon.worker.memory_manager.meminfo.last_available_kb" bigint,
    "falcon.worker.memory_manager.meminfo.last_calculated_kb" bigint,
    "falcon.worker.memory_manager.meminfo.last_free_kb" bigint,
    "falcon.worker.memory_manager.meminfo.last_tcmalloc_bytes_kb" bigint,
    "falcon.worker.memory_manager.meminfo.read_failures" bigint,
    "falcon.worker.metrics._avg_query_running_time_micro_seconds" double,
    "falcon.worker.metrics._num_active_execute_query" bigint,
    "falcon.worker.metrics._num_active_execute_tasq" bigint,
    "falcon.worker.metrics._num_active_open_scanner" bigint,
    "falcon.worker.metrics._num_total_execute_query" bigint,
    "falcon.worker.metrics._num_total_execute_tasq" bigint,
    "falcon.worker.metrics._num_total_open_scanner" bigint,
    "falcon.worker.mq_cache.byte_size" bigint,
    "falcon.worker.mq_cache.hits" bigint,
    "falcon.worker.mq_cache.lookups" bigint,
    "falcon.worker.mq_cache.num_entries" bigint,
    "falcon.worker.num_live_scanners" bigint,
    "falcon.worker.num_request_workers" bigint,
    "falcon.worker.query.memory_exceeded_cancellations" bigint,
    "falcon.worker.query.successful_cancellations" bigint,
    "falcon.worker.results_cache.byte_size" bigint,
    "falcon.worker.results_cache.hits" bigint,
    "falcon.worker.results_cache.lookups" bigint,
    "falcon.worker.results_cache.num_entries" bigint,
    "falcon.worker.signature_only.num_queries" bigint,
    "falcon.worker.subresult_cache.avg_store_read_ms_distribution_min" double,
    "falcon.worker.subresult_cache.avg_store_read_ms_distribution_max" double,
    "falcon.worker.subresult_cache.avg_store_read_ms_distribution_mean" double,
    "falcon.worker.subresult_cache.avg_store_read_ms_distribution_count" bigint,
    "falcon.worker.subresult_cache.avg_store_write_ms_distribution_min" double,
    "falcon.worker.subresult_cache.avg_store_write_ms_distribution_max" double,
    "falcon.worker.subresult_cache.avg_store_write_ms_distribution_mean" double,
    "falcon.worker.subresult_cache.avg_store_write_ms_distribution_count" bigint,
    "falcon.worker.subresult_cache.bytes_size" bigint,
    "falcon.worker.subresult_cache.num_entries" bigint,
    "falcon.worker.subresult_cache.num_in_memory_hits" bigint,
    "falcon.worker.subresult_cache.num_lookups" bigint,
    "falcon.worker.subresult_cache.num_store_hits" bigint,
    "falcon.worker.subresult_cache.num_store_loads" bigint,
    "falcon.worker.subresult_cache.store_lookups" bigint,
    "FalconWorkerThreadPool-queue-size" bigint,
    "falcon.worker.unbounded_signature.key_hits" bigint,
    "falcon.worker.unbounded_signature.key_lookups" bigint,
    "falcon.worker.unbounded_signature.num_entries" bigint,
    "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_min" double,
    "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_max" double,
    "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_mean" double,
    "net.trace_vault_proxy.FalconTraces.async_queue_size_distribution_count" bigint,
    "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_min" double,
    "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_max" double,
    "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_mean" double,
    "net.trace_vault_proxy.FalconTraces.get_trace_response_time_usec_distribution_count" bigint,
    "net.trace_vault_proxy.FalconTraces.num_failed_get_requests" bigint,
    "net.trace_vault_proxy.FalconTraces.num_failed_put_requests" bigint,
    "net.trace_vault_proxy.FalconTraces.num_failed_requests" bigint,
    "net.trace_vault_proxy.FalconTraces.num_get_requests" bigint,
    "net.trace_vault_proxy.FalconTraces.num_put_requests" bigint,
    "net.trace_vault_proxy.FalconTraces.num_requests" bigint,
    "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_min" double,
    "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_max" double,
    "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_mean" double,
    "net.trace_vault_proxy.FalconTraces.put_trace_response_time_usec_distribution_count" bigint,
    "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_min" double,
    "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_max" double,
    "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_mean" double,
    "net.trace_vault_proxy.FalconTraces.queue_duration_usec_distribution_count" bigint,
    "net.trace_vault_proxy.FalconTraces.queue_full_drops" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_min" double,
    "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_max" double,
    "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_mean" double,
    "net.trace_vault_proxy.falcon_worker_loadz.async_queue_size_distribution_count" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_min" double,
    "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_max" double,
    "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_mean" double,
    "net.trace_vault_proxy.falcon_worker_loadz.get_trace_response_time_usec_distribution_count" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.num_failed_get_requests" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.num_failed_put_requests" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.num_failed_requests" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.num_get_requests" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.num_put_requests" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.num_requests" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_min" double,
    "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_max" double,
    "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_mean" double,
    "net.trace_vault_proxy.falcon_worker_loadz.put_trace_response_time_usec_distribution_count" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_min" double,
    "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_max" double,
    "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_mean" double,
    "net.trace_vault_proxy.falcon_worker_loadz.queue_duration_usec_distribution_count" bigint,
    "net.trace_vault_proxy.falcon_worker_loadz.queue_full_drops" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_min" double,
    "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_max" double,
    "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_mean" double,
    "net.trace_vault_proxy.FalconWorkerTraces.async_queue_size_distribution_count" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_min" double,
    "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_max" double,
    "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_mean" double,
    "net.trace_vault_proxy.FalconWorkerTraces.get_trace_response_time_usec_distribution_count" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.num_failed_get_requests" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.num_failed_put_requests" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.num_failed_requests" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.num_get_requests" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.num_put_requests" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.num_requests" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_min" double,
    "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_max" double,
    "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_mean" double,
    "net.trace_vault_proxy.FalconWorkerTraces.put_trace_response_time_usec_distribution_count" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_min" double,
    "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_max" double,
    "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_mean" double,
    "net.trace_vault_proxy.FalconWorkerTraces.queue_duration_usec_distribution_count" bigint,
    "net.trace_vault_proxy.FalconWorkerTraces.queue_full_drops" bigint,
    "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.CloseScannerRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.CloseScannerRequest-received-active_distribution_min" double,
    "rpc-falcon.CloseScannerRequest-received-active_distribution_max" double,
    "rpc-falcon.CloseScannerRequest-received-active_distribution_mean" double,
    "rpc-falcon.CloseScannerRequest-received-active_distribution_count" bigint,
    "rpc-falcon.CloseScannerRequest-received-bytes_distribution_min" double,
    "rpc-falcon.CloseScannerRequest-received-bytes_distribution_max" double,
    "rpc-falcon.CloseScannerRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.CloseScannerRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.CloseScannerRequest-received-errors" bigint,
    "rpc-falcon.CloseScannerRequest-received" bigint,
    "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.CloseScannerRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.CloseScannerRequest-sent-errors" bigint,
    "rpc-falcon.CloseScannerRequest-sent" bigint,
    "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.CloseScannerRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.CompileService.Compile-client-latency-us_distribution_min" double,
    "rpc-falcon.CompileService.Compile-client-latency-us_distribution_max" double,
    "rpc-falcon.CompileService.Compile-client-latency-us_distribution_mean" double,
    "rpc-falcon.CompileService.Compile-client-latency-us_distribution_count" bigint,
    "rpc-falcon.CompileService.Compile-received-active_distribution_min" double,
    "rpc-falcon.CompileService.Compile-received-active_distribution_max" double,
    "rpc-falcon.CompileService.Compile-received-active_distribution_mean" double,
    "rpc-falcon.CompileService.Compile-received-active_distribution_count" bigint,
    "rpc-falcon.CompileService.Compile-received-bytes_distribution_min" double,
    "rpc-falcon.CompileService.Compile-received-bytes_distribution_max" double,
    "rpc-falcon.CompileService.Compile-received-bytes_distribution_mean" double,
    "rpc-falcon.CompileService.Compile-received-bytes_distribution_count" bigint,
    "rpc-falcon.CompileService.Compile-received-errors" bigint,
    "rpc-falcon.CompileService.Compile-received" bigint,
    "rpc-falcon.CompileService.Compile-sent-bytes_distribution_min" double,
    "rpc-falcon.CompileService.Compile-sent-bytes_distribution_max" double,
    "rpc-falcon.CompileService.Compile-sent-bytes_distribution_mean" double,
    "rpc-falcon.CompileService.Compile-sent-bytes_distribution_count" bigint,
    "rpc-falcon.CompileService.Compile-sent-errors" bigint,
    "rpc-falcon.CompileService.Compile-sent" bigint,
    "rpc-falcon.CompileService.Compile-server-latency-us_distribution_min" double,
    "rpc-falcon.CompileService.Compile-server-latency-us_distribution_max" double,
    "rpc-falcon.CompileService.Compile-server-latency-us_distribution_mean" double,
    "rpc-falcon.CompileService.Compile-server-latency-us_distribution_count" bigint,
    "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.ExecuteTasqRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.ExecuteTasqRequest-received-active_distribution_min" double,
    "rpc-falcon.ExecuteTasqRequest-received-active_distribution_max" double,
    "rpc-falcon.ExecuteTasqRequest-received-active_distribution_mean" double,
    "rpc-falcon.ExecuteTasqRequest-received-active_distribution_count" bigint,
    "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_min" double,
    "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_max" double,
    "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.ExecuteTasqRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.ExecuteTasqRequest-received-errors" bigint,
    "rpc-falcon.ExecuteTasqRequest-received" bigint,
    "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.ExecuteTasqRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.ExecuteTasqRequest-sent-errors" bigint,
    "rpc-falcon.ExecuteTasqRequest-sent" bigint,
    "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.ExecuteTasqRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.FalconRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.FalconRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.FalconRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.FalconRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.FalconRequest-received-active_distribution_min" double,
    "rpc-falcon.FalconRequest-received-active_distribution_max" double,
    "rpc-falcon.FalconRequest-received-active_distribution_mean" double,
    "rpc-falcon.FalconRequest-received-active_distribution_count" bigint,
    "rpc-falcon.FalconRequest-received-bytes_distribution_min" double,
    "rpc-falcon.FalconRequest-received-bytes_distribution_max" double,
    "rpc-falcon.FalconRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.FalconRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.FalconRequest-received-errors" bigint,
    "rpc-falcon.FalconRequest-received" bigint,
    "rpc-falcon.FalconRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.FalconRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.FalconRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.FalconRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.FalconRequest-sent-errors" bigint,
    "rpc-falcon.FalconRequest-sent" bigint,
    "rpc-falcon.FalconRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.FalconRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.FalconRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.FalconRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.GetWorkerStatisticsRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_min" double,
    "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_max" double,
    "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_mean" double,
    "rpc-falcon.GetWorkerStatisticsRequest-received-active_distribution_count" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_min" double,
    "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_max" double,
    "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.GetWorkerStatisticsRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-received-errors" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-received" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.GetWorkerStatisticsRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-sent-errors" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-sent" bigint,
    "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.GetWorkerStatisticsRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.OpenScannerRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.OpenScannerRequest-received-active_distribution_min" double,
    "rpc-falcon.OpenScannerRequest-received-active_distribution_max" double,
    "rpc-falcon.OpenScannerRequest-received-active_distribution_mean" double,
    "rpc-falcon.OpenScannerRequest-received-active_distribution_count" bigint,
    "rpc-falcon.OpenScannerRequest-received-bytes_distribution_min" double,
    "rpc-falcon.OpenScannerRequest-received-bytes_distribution_max" double,
    "rpc-falcon.OpenScannerRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.OpenScannerRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.OpenScannerRequest-received-errors" bigint,
    "rpc-falcon.OpenScannerRequest-received" bigint,
    "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.OpenScannerRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.OpenScannerRequest-sent-errors" bigint,
    "rpc-falcon.OpenScannerRequest-sent" bigint,
    "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.OpenScannerRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.PingRequestWorkerRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_min" double,
    "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_max" double,
    "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_mean" double,
    "rpc-falcon.PingRequestWorkerRequest-received-active_distribution_count" bigint,
    "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_min" double,
    "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_max" double,
    "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.PingRequestWorkerRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.PingRequestWorkerRequest-received-errors" bigint,
    "rpc-falcon.PingRequestWorkerRequest-received" bigint,
    "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.PingRequestWorkerRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.PingRequestWorkerRequest-sent-errors" bigint,
    "rpc-falcon.PingRequestWorkerRequest-sent" bigint,
    "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.PingRequestWorkerRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.ProbeQueryExecRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_min" double,
    "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_max" double,
    "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_mean" double,
    "rpc-falcon.ProbeQueryExecRequest-received-active_distribution_count" bigint,
    "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_min" double,
    "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_max" double,
    "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.ProbeQueryExecRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.ProbeQueryExecRequest-received-errors" bigint,
    "rpc-falcon.ProbeQueryExecRequest-received" bigint,
    "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.ProbeQueryExecRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.ProbeQueryExecRequest-sent-errors" bigint,
    "rpc-falcon.ProbeQueryExecRequest-sent" bigint,
    "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.ProbeQueryExecRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.ReadScannerRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.ReadScannerRequest-received-active_distribution_min" double,
    "rpc-falcon.ReadScannerRequest-received-active_distribution_max" double,
    "rpc-falcon.ReadScannerRequest-received-active_distribution_mean" double,
    "rpc-falcon.ReadScannerRequest-received-active_distribution_count" bigint,
    "rpc-falcon.ReadScannerRequest-received-bytes_distribution_min" double,
    "rpc-falcon.ReadScannerRequest-received-bytes_distribution_max" double,
    "rpc-falcon.ReadScannerRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.ReadScannerRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.ReadScannerRequest-received-errors" bigint,
    "rpc-falcon.ReadScannerRequest-received" bigint,
    "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.ReadScannerRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.ReadScannerRequest-sent-errors" bigint,
    "rpc-falcon.ReadScannerRequest-sent" bigint,
    "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.ReadScannerRequest-server-latency-us_distribution_count" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_min" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_max" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_mean" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-active_distribution_count" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_min" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_max" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-received-errors" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-received" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-sent-errors" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-sent" bigint,
    "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.ReleaseRequestWorkersRequest-server-latency-us_distribution_count" bigint,
    "rpc-FalconServer.all-received-queue-size_distribution_min" double,
    "rpc-FalconServer.all-received-queue-size_distribution_max" double,
    "rpc-FalconServer.all-received-queue-size_distribution_mean" double,
    "rpc-FalconServer.all-received-queue-size_distribution_count" bigint,
    "rpc-FalconServer.all-received-queue-wait-time-us_distribution_min" double,
    "rpc-FalconServer.all-received-queue-wait-time-us_distribution_max" double,
    "rpc-FalconServer.all-received-queue-wait-time-us_distribution_mean" double,
    "rpc-FalconServer.all-received-queue-wait-time-us_distribution_count" bigint,
    "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_min" double,
    "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_max" double,
    "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_mean" double,
    "rpc-falcon.WorkerHealthzRequest-client-latency-us_distribution_count" bigint,
    "rpc-falcon.WorkerHealthzRequest-received-active_distribution_min" double,
    "rpc-falcon.WorkerHealthzRequest-received-active_distribution_max" double,
    "rpc-falcon.WorkerHealthzRequest-received-active_distribution_mean" double,
    "rpc-falcon.WorkerHealthzRequest-received-active_distribution_count" bigint,
    "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_min" double,
    "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_max" double,
    "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_mean" double,
    "rpc-falcon.WorkerHealthzRequest-received-bytes_distribution_count" bigint,
    "rpc-falcon.WorkerHealthzRequest-received-errors" bigint,
    "rpc-falcon.WorkerHealthzRequest-received" bigint,
    "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_min" double,
    "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_max" double,
    "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_mean" double,
    "rpc-falcon.WorkerHealthzRequest-sent-bytes_distribution_count" bigint,
    "rpc-falcon.WorkerHealthzRequest-sent-errors" bigint,
    "rpc-falcon.WorkerHealthzRequest-sent" bigint,
    "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_min" double,
    "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_max" double,
    "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_mean" double,
    "rpc-falcon.WorkerHealthzRequest-server-latency-us_distribution_count" bigint,
    "watcher-_orion_local_service_falcon_compile_server_status-queue-size" bigint,
    "watcher-_orion_local_service_falcon_manager_status-queue-size" bigint,
    "watcher-_orion_local_service_falcon_manager_userdata_schema-queue-size" bigint,
    "watcher-_orion_local_service_falcon_moderator_status-queue-size" bigint,
    "watcher-_orion_local_service_falcon_moderator_userdata_dictionary_depot-queue-size" bigint,
    "watcher-_orion_local_service_falcon_moderator_userdata_metadata_store-queue-size" bigint,
    "watcher-_orion_local_service_falcon_moderator_userdata_proposal_registry-queue-size" bigint,
    "watcher-_orion_local_service_falcon_status-queue-size" bigint,
    "watcher-_orion_local_service_falcon_userdata_config-queue-size" bigint,
    "watcher-_orion_local_service_falcon_userdata_status_0-queue-size" bigint,
    "watcher-_orion_local_service_falcon_userdata_status_1-queue-size" bigint,
    "watcher-_orion_local_service_falcon_userdata_status_2-queue-size" bigint,
    "falcon.worker.cache.caffeine_warmedup.Pinboard.hits" bigint,
    "falcon.worker.cache.Caffeine.hits" bigint,
    "falcon.worker.cache.Caffeine.misses" bigint,
    "falcon.worker.cache.Pinboard.hits" bigint,
    "falcon.worker.cache.Pinboard.misses" bigint,
    "falcon.worker.cache.SavedAnswer.hits" bigint,
    "falcon.worker.cache.SavedAnswer.misses" bigint,
    "falcon.worker.cache.caffeine_accesses.count" bigint,
    "falcon.worker.cache.caffeine_effective.A3.pcnt" double,
    "falcon.worker.cache.caffeine_effective.AdhocSearch.pcnt" double,
    "falcon.worker.cache.caffeine_effective.Caffeine.pcnt" double,
    "falcon.worker.cache.caffeine_effective.CliQuery.pcnt" double,
    "falcon.worker.cache.caffeine_effective.Dictionary.pcnt" double,
    "falcon.worker.cache.caffeine_effective.InsertInto.pcnt" double,
    "falcon.worker.cache.caffeine_effective.InternalStats.pcnt" double,
    "falcon.worker.cache.caffeine_effective.Pinboard.pcnt" double,
    "falcon.worker.cache.caffeine_effective.SageBuilding.pcnt" double,
    "falcon.worker.cache.caffeine_effective.SavedAnswer.pcnt" double,
    "falcon.worker.cache.caffeine_effective.Simba.pcnt" double,
    "falcon.worker.cache.caffeine_effective.Unknown.pcnt" double,
    "falcon.worker.cache.caffeine_effectiveness.percentage" double,
    "falcon.worker.cache.caffeine_ineffective_warmups.percentage" double,
    "falcon.worker.cache.caffeine_warmedup.A3.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.AdhocSearch.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.Caffeine.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.CliQuery.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.Dictionary.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.InsertInto.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.InternalStats.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.SageBuilding.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.SavedAnswer.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.Simba.hits" bigint,
    "falcon.worker.cache.caffeine_warmedup.Unknown.hits" bigint,
    "falcon.worker.cache.source.A3.hits" bigint,
    "falcon.worker.cache.source.AdhocSearch.hits" bigint,
    "falcon.worker.cache.source.Caffeine.hits" bigint,
    "falcon.worker.cache.source.CliQuery.hits" bigint,
    "falcon.worker.cache.source.Dictionary.hits" bigint,
    "falcon.worker.cache.source.InsertInto.hits" bigint,
    "falcon.worker.cache.source.InternalStats.hits" bigint,
    "falcon.worker.cache.source.Pinboard.hits" bigint,
    "falcon.worker.cache.source.SageBuilding.hits" bigint,
    "falcon.worker.cache.source.SavedAnswer.hits" bigint,
    "falcon.worker.cache.source.Simba.hits" bigint,
    "falcon.worker.cache.source.Unknown.hits" bigint,
    "falcon.worker.uncacheable.accesses.A3.counts" bigint,
    "falcon.worker.uncacheable.accesses.AdhocSearch.counts" bigint,
    "falcon.worker.uncacheable.accesses.Caffeine.counts" bigint,
    "falcon.worker.uncacheable.accesses.CliQuery.counts" bigint,
    "falcon.worker.uncacheable.accesses.Dictionary.counts" bigint,
    "falcon.worker.uncacheable.accesses.InsertInto.counts" bigint,
    "falcon.worker.uncacheable.accesses.InternalStats.counts" bigint,
    "falcon.worker.uncacheable.accesses.Pinboard.counts" bigint,
    "falcon.worker.uncacheable.accesses.SageBuilding.counts" bigint,
    "falcon.worker.uncacheable.accesses.SavedAnswer.counts" bigint,
    "falcon.worker.uncacheable.accesses.Simba.counts" bigint,
    "falcon.worker.uncacheable.accesses.Unknown.counts" bigint
)
PARTITION BY HASH (48) KEY ("hostport");


/*
Table "falcon_monitor_sys_stats" guid = 0a4ef70b-28f4-4b06-b82d-0540ba9bfbbd
Column "timestamp" guid = 81fb049c-6121-435e-88f5-7c3a1825e4e1 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "host" guid = 6a9a1965-9f3d-494a-b898-d4aa60971831 compression AUTO
Column "cpu_us" guid = ee373afd-d94a-40d6-b59a-a0828f5bddf4 compression AUTO
Column "cpu_sy" guid = 835453ae-03c4-4dc3-a032-482dc470255f compression AUTO
Column "cpu_ni" guid = a63dec6b-81b9-49c2-aec9-4db95a0e840f compression AUTO
Column "cpu_id" guid = a9cafb97-c082-46e4-888a-884626a7700b compression AUTO
Column "cpu_wa" guid = f1721eed-2b75-44df-b9d6-683877191ccc compression AUTO
Column "cpu_hi" guid = 0dad4173-7773-4ccf-9bb2-5a6c6a3c0d2b compression AUTO
Column "cpu_si" guid = ce4e907e-e527-4d83-9e19-bab80fe98753 compression AUTO
Column "cpu_st" guid = d3d22cd1-0584-411e-866c-ca2f75d4d26a compression AUTO
Column "mem_total" guid = 9051a0b8-44bd-4c15-8c69-697482af858d compression AUTO
Column "mem_free" guid = 97d51cae-06c1-4436-b00f-00a9d5d57cbd compression AUTO
Column "mem_avail" guid = 7c8d339b-17cf-4f37-94de-98dff9d9eff1 compression AUTO
Column "mem_buffers" guid = ad10a630-45fc-41e1-a2dc-a2c20098a4eb compression AUTO
Column "mem_cached" guid = e9df2f23-9b54-4b37-a34c-901f7d405462 compression AUTO
Column "mem_swapcached" guid = c5af9733-a02c-40b6-a817-5ed6a438d356 compression AUTO
Column "loadavg_1" guid = 686b2bcc-59a7-4904-9167-dfa3f0e573a9 compression AUTO
Column "loadavg_5" guid = 554b2e45-d1bd-4a66-bdce-19d39df0fec2 compression AUTO
Column "loadavg_15" guid = 16149469-8cda-47ce-990c-b963c9ea0d69 compression AUTO
Column "loadavg_sch_exec" guid = 1c347c5f-d240-4505-af23-3d92313eddc3 compression AUTO
Column "loadavg_sch_total" guid = 3e30ec3b-c9af-46e3-81f1-4dfb1c9c412e compression AUTO
Column "loadavg_pid" guid = 751179a2-42b9-40a8-862a-d94d4e28c92f compression AUTO
Column "netstat_connections" guid = 96b43841-3105-4137-97bf-22985ab1d464 compression AUTO
Column "ramdisk_per" guid = affc343c-d07d-43f9-aa73-1b10043414ff compression AUTO
Column "ramdisk_used" guid = 64779ad3-4384-4f8e-bdb0-c7b72b81d545"ramdisk_used" default 0.000000 compression AUTO
Column "ramdisk_avail" guid = c5406be6-c7b5-4826-905d-b80b9ed311fa"ramdisk_avail" default 0.000000 compression AUTO
Column "falcon_pg_faults" guid = 05a909a4-1299-4854-8636-f0b43c74a1e3"falcon_pg_faults" default 0 compression AUTO
Column "log_pgs_in_cache_perc" guid = c15b7ada-9ba5-40e3-a5d3-f48c859a5747"log_pgs_in_cache_perc" default 0.000000 compression AUTO
Column "num_log_pgs_in_cache" guid = 28658a30-21d6-443a-81d3-093793fe8b5d"num_log_pgs_in_cache" default 0 compression AUTO
Column "size_log_pgs_in_cache_kb" guid = 81fb960b-fa30-4c8f-9da7-056f2bcac23b"size_log_pgs_in_cache_kb" default 0 compression AUTO
Column "total_pg_faults" guid = c501a16f-58a8-471e-953d-f895558ad2ae"total_pg_faults" default 0 compression AUTO
PARTITION BY HASH  (48) KEY ("host" )
Live Schema Version 4
 */
CREATE TABLE "falcon_default_schema"."falcon_monitor_sys_stats" (
    "timestamp" DATETIME,
    "host" varchar(32),
    "cpu_us" double,
    "cpu_sy" double,
    "cpu_ni" double,
    "cpu_id" double,
    "cpu_wa" double,
    "cpu_hi" double,
    "cpu_si" double,
    "cpu_st" double,
    "mem_total" double,
    "mem_free" double,
    "mem_avail" double,
    "mem_buffers" double,
    "mem_cached" double,
    "mem_swapcached" double,
    "loadavg_1" double,
    "loadavg_5" double,
    "loadavg_15" double,
    "loadavg_sch_exec" int,
    "loadavg_sch_total" int,
    "loadavg_pid" int,
    "netstat_connections" int,
    "ramdisk_per" int,
    "ramdisk_used" double,
    "ramdisk_avail" double,
    "falcon_pg_faults" bigint,
    "log_pgs_in_cache_perc" double,
    "num_log_pgs_in_cache" bigint,
    "size_log_pgs_in_cache_kb" bigint,
    "total_pg_faults" bigint
)
PARTITION BY HASH (48) KEY ("host");


/*
Table "MetricsMonitoring" guid = 248a7de9-f31b-4d7a-ae1a-f70f4fdc162b
Column "query_id" guid = 8d35091c-27c9-4d11-9ab5-efeeabd5f8ab compression AUTO
Column "query_text" guid = d2344337-6cbe-490d-981b-e3c7ce7c9763 compression AUTO
Column "event_type" guid = e8f3ee60-6837-4598-823b-e6d9286cf005 compression AUTO
Column "user_id" guid = 471108e8-9bb5-49e0-8077-e7d35f5cf681 compression AUTO
Column "user_name" guid = 6c37927a-c07e-4da3-bdef-f568525bd287 compression AUTO
Column "event_date" guid = 16e8d8c2-999e-4155-af41-8f1154d5f273 parsing hint %Y%m%d compression AUTO
Column "event_time" guid = 6c0e9143-1d50-468c-a674-e01960e8aa1b parsing hint %H:%M:%S compression AUTO
Column "number_of_results" guid = 3ff7b3e0-ab76-4e24-96a8-94d0e93f11dc compression AUTO
Column "user_click_position" guid = 868412d5-677d-48db-bcc2-17125562a1d3 compression AUTO
Column "result_id" guid = a5c154d1-97d2-4d0c-a509-8983f0c278b3 compression AUTO
Column "result_title" guid = 7d239abb-32ee-44e6-8fcf-fec37a26090c compression AUTO
Column "object_type" guid = 2eb4bc06-88ea-4474-a0d7-357d9d702610 compression AUTO
Column "click_count" guid = a22b92c2-c8cd-48f6-8d6b-bc11865e5097 compression AUTO
Column "highest_click_position" guid = 9d9ab48d-6473-4835-99b2-0fd92930bba5 compression AUTO
Column "tenant_id" guid = ec39fb11-39d9-49e2-a0e4-0602e078e2e3 compression AUTO
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."MetricsMonitoring" (
    "query_id" varchar(255),
    "query_text" varchar(255),
    "event_type" varchar(255),
    "user_id" varchar(255),
    "user_name" varchar(255),
    "event_date" date,
    "event_time" time,
    "number_of_results" int,
    "user_click_position" int,
    "result_id" varchar(255),
    "result_title" varchar(255),
    "object_type" varchar(255),
    "click_count" int,
    "highest_click_position" int,
    "tenant_id" varchar(255)
);


/*
Table "pinboard_report" guid = 74d49e51-bd69-44bf-845f-5539ddf44f66
Column "guid" guid = 4d437991-f34c-4d9a-af99-9069b91b821c compression AUTO
Column "name" guid = 9d359cee-26fd-4c5d-9f39-cf78362cd126 compression AUTO
Column "description" guid = c93c64cd-8f3a-483d-acbb-a6fe23029d0a compression AUTO
Column "author_guid" guid = fc115822-73dd-4e0a-874e-e15b86130fbe compression AUTO
Column "deleted" guid = 8da043fa-8595-486a-8e73-d13295141990 compression AUTO
Column "created" guid = 5f0263e8-49de-4d4e-82b7-f2d259b01189 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "modified" guid = dfeb26c3-e9a7-4323-be03-42421b0e0c60 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "sub_type" guid = 07e4b546-dd3d-416e-822e-d78118285e0f compression AUTO
Column "generation_num" guid = 4a07d56e-45b2-471e-a155-b615121de455 compression AUTO
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."pinboard_report" (
    "guid" varchar(20),
    "name" varchar(100),
    "description" varchar(100),
    "author_guid" varchar(20),
    "deleted" bool,
    "created" DATETIME,
    "modified" DATETIME,
    "sub_type" varchar(10),
    "generation_num" bigint
);


/*
Table "pinboard_container_report" guid = b6c5a8f0-4ead-47c5-b2b0-277208a4bece
Column "guid" guid = 3a78cbdb-2e33-4309-9267-b7e49fc7a911 compression AUTO
Column "name" guid = 9741bd75-ddcb-47e6-ac21-8c0449bd1395 compression AUTO
Column "description" guid = ca7127d6-9f4e-43af-88ca-2a0d04a2f0cf compression AUTO
Column "author_guid" guid = a5a35f15-4cb5-4d58-abc9-3f025cbbb73c compression AUTO
Column "deleted" guid = 591074e4-69be-4fe7-bc6d-65e4ef193d52 compression AUTO
Column "created" guid = 28d0e357-2f93-48a6-b0ea-fc111085989b parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "modified" guid = b73a5268-25bf-4e4d-8aba-370983f62020 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "pinboard_guid" guid = 64d9cf23-5e05-434b-b09f-74bc63b4ff1d compression AUTO
Column "generation_num" guid = ec2d9ed0-4b61-4ddd-8842-64eb3ff8ae14 compression AUTO
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."pinboard_container_report" (
    "guid" varchar(20),
    "name" varchar(100),
    "description" varchar(100),
    "author_guid" varchar(20),
    "deleted" bool,
    "created" DATETIME,
    "modified" DATETIME,
    "pinboard_guid" varchar(20),
    "generation_num" bigint
);


/*
Table "table_report" guid = 78e80459-ea31-4428-890d-dd51eac099ac
Column "guid" guid = c01f0281-5205-435a-8e89-12385e97e1fa compression AUTO
Column "name" guid = b936ce26-ecf3-49fd-bfb9-3433a87041b5 compression AUTO
Column "description" guid = 000a6d63-3326-46c4-acb4-13ef030afa0e compression AUTO
Column "author_guid" guid = 0c6cfde5-53dc-48b4-adce-02c68f0e4db8 compression AUTO
Column "deleted" guid = 1012c12a-5b3e-46ac-b34e-2c40db48c5d1 compression AUTO
Column "hidden" guid = 89a8224f-14f1-4bb6-9868-2efb20abf31f compression AUTO
Column "created" guid = 7e0f1d5c-a293-42eb-a9f2-f69b0d807db5 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "modified" guid = ecd25e3b-2f05-4014-9e41-9573c3668189 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "sub_type" guid = e58b0334-4db0-487a-b53b-9dafb41f6037 compression AUTO
Column "generation_num" guid = 04afe9fc-c862-41be-8bff-f0889ccd8eb2 compression AUTO
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."table_report" (
    "guid" varchar(20),
    "name" varchar(100),
    "description" varchar(100),
    "author_guid" varchar(20),
    "deleted" bool,
    "hidden" bool,
    "created" DATETIME,
    "modified" DATETIME,
    "sub_type" varchar(20),
    "generation_num" bigint
);


/*
Table "table_column_report" guid = ac9c248a-077b-45d3-bbcc-b6e91509e8bd
Column "guid" guid = d8a9b002-dc0b-4ead-b556-de02eca9bf64 compression AUTO
Column "name" guid = 7a7899a8-64b9-4c77-9717-1dc3ddb502f5 compression AUTO
Column "description" guid = a2d171e0-5497-40d1-98e7-f52b6ed919d0 compression AUTO
Column "author_guid" guid = a93f4fa0-e46c-4364-a710-81b804929480 compression AUTO
Column "deleted" guid = 71071321-90da-45e7-a88b-1f961b1c4f11 compression AUTO
Column "created" guid = 5a13f0ce-8227-4152-a665-3f43f9c49bee parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "modified" guid = 32d7b658-3ef2-448f-97a1-2c715c3ea608 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "table_guid" guid = 3fccb22e-85b9-48b5-b76c-d37fa5f32046 compression AUTO
Column "generation_num" guid = dc2b8049-a83a-433d-84f3-32e8af3c83fa compression AUTO
Column "hidden" guid = c80df558-aa3d-4371-9dbc-661b0b96bcfd compression AUTO
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."table_column_report" (
    "guid" varchar(20),
    "name" varchar(100),
    "description" varchar(100),
    "author_guid" varchar(20),
    "deleted" bool,
    "created" DATETIME,
    "modified" DATETIME,
    "table_guid" varchar(20),
    "generation_num" bigint,
    "hidden" bool
);


/*
Table "pinboard_container_dependency_report" guid = d80c880d-49d7-44ae-af1a-e58f136a9442
Column "pinboard_container_guid" guid = 79c70cc9-406e-4055-a21b-6dd89aa62887 compression AUTO
Column "logical_column_guid" guid = a7915513-9b80-4e9f-9279-c0aa984ba631 compression AUTO
 */
CREATE TABLE "falcon_default_schema"."pinboard_container_dependency_report" (
    "pinboard_container_guid" varchar(20),
    "logical_column_guid" varchar(20)
);


/*
Table "answer_report" guid = 9b3fc35f-c642-4b3b-b121-ff74c85e9754
Column "guid" guid = 271bd264-7ea6-464b-9a63-e1fbfd7fe3bb compression AUTO
Column "name" guid = b98c040e-f824-4d2a-bc95-563b6a3f56bb compression AUTO
Column "description" guid = be6e4931-d1a1-4576-899c-8d874ba99146 compression AUTO
Column "author_guid" guid = a93602a8-c5cf-4f04-ba0b-40235df4eb8a compression AUTO
Column "deleted" guid = d14b4429-37d8-4ea4-8a05-281638b26869 compression AUTO
Column "created" guid = 7f02cfd3-fa0f-4ae8-b34a-e3ec8156545c parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "modified" guid = 63120cec-f4dc-4d31-9790-6180ec9baf73 parsing hint %Y%m%d %H:%M:%S compression AUTO
Column "sub_type" guid = e2353f1a-d9f6-44c9-9edf-a15036f6896e compression AUTO
Column "generation_num" guid = 6f0550d6-03ac-42bf-8b18-9822f5507a48 compression AUTO
Live Schema Version 1
 */
CREATE TABLE "falcon_default_schema"."answer_report" (
    "guid" varchar(20),
    "name" varchar(100),
    "description" varchar(100),
    "author_guid" varchar(20),
    "deleted" bool,
    "created" DATETIME,
    "modified" DATETIME,
    "sub_type" varchar(10),
    "generation_num" bigint
);


/*
Table "answer_dependency_report" guid = 4074db14-7ba9-4b3e-bd22-2300d0ba381a
Column "answer_guid" guid = f0566c54-c538-4be5-a83f-027d1dc76bb4 compression AUTO
Column "logical_column_guid" guid = ca5dcbbd-46db-4657-bd0b-892f74d613cd compression AUTO
 */
CREATE TABLE "falcon_default_schema"."answer_dependency_report" (
    "answer_guid" varchar(20),
    "logical_column_guid" varchar(20)
);


/*
Table "table_dependency_report" guid = 09320055-0d9a-4c4d-a003-6d312d1db925
Column "table_guid" guid = acb3b56d-fe48-481f-a9a8-b608cad229fa compression AUTO
Column "logical_column_guid" guid = d07afcc5-469d-44ac-aa21-b05521f2914e compression AUTO
 */
CREATE TABLE "falcon_default_schema"."table_dependency_report" (
    "table_guid" varchar(20),
    "logical_column_guid" varchar(20)
);


/*
Schema "postgres_callosum_schema" guid = bd01594e-7d78-46a0-9bfc-2eb229a0b628
 */
CREATE SCHEMA "postgres_callosum_schema";


/*
Table "principal" guid = a167c3f0-0c38-47d7-999c-9b5f566ebe4e
Column "id" guid = 9bba8489-2123-488b-82ed-ecdd0390ea53
Column "name" guid = 82e6efb2-ba4a-48a2-9261-6bd8bb8b5509
Column "description" guid = 796f9425-8233-4369-b1ab-75a786cfb4b9
Column "author" guid = fe11f4aa-98c1-4cd3-b8f6-20b6ffada63c
Column "created" guid = d9c79ffa-58f3-4186-9e28-10f1a495dee6
Column "created_ms" guid = 8a9d9cc3-fc16-4c44-8fb2-2ad6d6bd0f6f parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = c57e66ab-4c06-4c93-b1cb-cba395558490
Column "modified_ms" guid = 1d6cea56-e288-4c7d-8a8e-7a0c9772de81 parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = f31b2ceb-841a-4cd5-ba7e-23c8a82dacbf
Column "deleted" guid = 95f145df-8293-48e8-bb7e-48f49f7d0684
Column "hidden" guid = bd0f4288-9f32-4b3b-848d-669ce10cbcb6
Column "owner" guid = bf9b2199-8e1d-4b9b-bb75-bb12caa5c238
Column "display_name" guid = 2889c408-d680-4b4b-a61f-933d06e2ebde
Column "type" guid = 0a17480c-0029-43e2-894a-b0a98d5109a5
 */
CREATE TABLE "postgres_callosum_schema"."principal" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "display_name" varchar(100),
    "type" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "group_membership" guid = c3f9abba-8c63-4478-8770-85b2f480ee17
Column "principal_id" guid = 6270a3c8-5613-4419-ba11-0556096cf135
Column "group_id" guid = 0b3d95e3-1a06-4027-90a0-8855a041157a
 */
CREATE TABLE "postgres_callosum_schema"."group_membership" (
    "principal_id" varchar(100),
    "group_id" varchar(100),
    PRIMARY KEY ("principal_id", "group_id")
);


/*
Table "privilege_membership" guid = 5eb0b149-1b83-4405-b6f4-cf2f2babc161
Column "principal_id" guid = 6909ffd6-1a2e-456e-b857-b76076ce1052
Column "privilege" guid = e10fdda7-eb77-4278-952c-b24d3056b4d5
 */
CREATE TABLE "postgres_callosum_schema"."privilege_membership" (
    "principal_id" varchar(100),
    "privilege" varchar(100),
    PRIMARY KEY ("principal_id", "privilege")
);


/*
Table "answer_book" guid = 86a46aa2-ed46-4eb2-b065-f648273ddf1e
Column "id" guid = bb301afe-cbec-42e6-a1ab-e5acb7024aef
Column "name" guid = 9d5911da-42bb-4da1-9f9e-76c97b644e4a
Column "description" guid = 72dbf15f-751f-4af4-8968-c86ecde4e00d
Column "author" guid = 45628e3a-96a2-4b23-b76e-96fdb4e2da2d
Column "created" guid = e5ece319-64eb-4118-a926-6b59dfd82a3f
Column "created_ms" guid = f8cea24f-16f4-4f95-a22b-b0d2796d08da parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 00fd8ae1-7cfc-4a90-a222-36962e41782d
Column "modified_ms" guid = 4be09b34-1928-491d-839a-59c7038c7317 parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = a38d4afd-b681-42d9-913e-ca2b2186903d
Column "deleted" guid = a3ed9812-ee51-48a8-ab2e-6ab8a9ab674b
Column "hidden" guid = a8c97d54-ec79-4e7b-a6a5-46d116da8df2
Column "owner" guid = ff8c53de-6a43-46e3-8fd7-0d5b24481359
Column "source" guid = abd37c23-6d1a-421a-84cd-47d52ab3d265
Column "type" guid = 1a761e0e-8613-4d79-b55e-87ca069afb44
 */
CREATE TABLE "postgres_callosum_schema"."answer_book" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "source" varchar(100),
    "type" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "answer_sheet" guid = bf6b95d4-ef3c-4037-a5db-d25a7ed4b008
Column "id" guid = 4297d076-0647-42d6-8e5b-99897cdd6b19
Column "name" guid = 31a607da-d3b8-4a7a-8aa8-12828709a122
Column "description" guid = f238dd8c-a4e7-4825-b77a-8711fbfae398
Column "author" guid = 9c6304ee-aa7a-4c73-b12b-e53131e0f3d6
Column "created" guid = cb5b8529-ac52-4d37-ab2f-e3216cf9bc5d
Column "created_ms" guid = 49e8396e-ee26-469e-aa44-80a66642a028 parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 2f2edca4-379c-426d-a8c6-4860b8a45e4f
Column "modified_ms" guid = 1ce48b82-71e0-43ee-9406-65a1877645bb parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = 89ba5186-fb0e-4cdd-9c75-ce91b7d8ba49
Column "deleted" guid = c7a220a6-48bc-4ff1-9087-3846569bf2f1
Column "hidden" guid = 70e65be1-714e-4993-9639-d5dfa3374bf2
Column "owner" guid = 691b4be9-2f64-4847-a8da-c431ae395b0b
Column "source" guid = 27437e5c-b7a4-451e-b92d-c440945e290d
Column "referer" guid = ff9eb3ee-4038-409d-b9d3-cfcc766c2e49
Column "type" guid = a619385a-83e6-43df-a239-bf381aa07f52
 */
CREATE TABLE "postgres_callosum_schema"."answer_sheet" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "source" varchar(100),
    "referer" varchar(100),
    "type" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "pinboard_qas_link" guid = b55f3355-52af-43c3-be37-6f5aedb5cc61
Column "pinboard_sheet_id" guid = fceedca1-23f3-4d14-8711-60c99701d216
Column "pinboard_sheet_owner_id" guid = 03ab79c9-5f34-418a-a44e-8bf57ac3d0d7
Column "question_sheet_id" guid = 44b78f37-f23b-4568-9a5b-b0217aa873a4
Column "question_sheet_owner_id" guid = edaf4d2b-864d-45b2-af30-4a09cd7bd6ca
 */
CREATE TABLE "postgres_callosum_schema"."pinboard_qas_link" (
    "pinboard_sheet_id" varchar(100),
    "pinboard_sheet_owner_id" varchar(100),
    "question_sheet_id" varchar(100),
    "question_sheet_owner_id" varchar(100),
    PRIMARY KEY ("pinboard_sheet_id", "question_sheet_id")
);


/*
Table "filter" guid = 739c3a98-38a5-482e-b54e-e6ea2a50531c
Column "id" guid = f855bce5-07eb-4c85-b408-396994402c4b
Column "name" guid = a2bc7721-35bf-4310-896a-54a931d4ed3b
Column "description" guid = f350bd3f-6dd8-420c-a67f-0efa229b7285
Column "author" guid = dc78a350-0c5e-4d58-a12a-b88083fe32cb
Column "created" guid = 1f43f30a-7d14-4cbf-9701-b07bb9e21a52
Column "created_ms" guid = fee8b8a5-70c2-461d-9c92-664a1af758db parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 01970986-2083-4d00-b194-e8866aff7881
Column "modified_ms" guid = 2d70b916-99ce-4644-922f-fef2b528abe7 parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = 9d339b6c-ba2e-4775-a48a-1460ce6142b9
Column "deleted" guid = 2d798054-d178-4a3a-8c4a-25cc4958e23d
Column "hidden" guid = 603fabeb-4835-409f-a4e7-8794740dc673
Column "owner" guid = ae424f96-5010-4b4a-9fe0-221d930d85da
 */
CREATE TABLE "postgres_callosum_schema"."filter" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "filter_answer_sheet_link" guid = ce4d2bd9-447d-40eb-a46e-85ea2ead3446
Column "filter_id" guid = c4ca752d-d50d-4ce3-92fb-d3363ad75749
Column "answer_sheet_id" guid = 27aa2d45-e6fe-4b91-b105-764432cd643b
 */
CREATE TABLE "postgres_callosum_schema"."filter_answer_sheet_link" (
    "filter_id" varchar(100),
    "answer_sheet_id" varchar(100),
    PRIMARY KEY ("filter_id", "answer_sheet_id")
);


/*
Table "data_source" guid = 3acbc088-aae6-4f2d-8a61-72443f175da9
Column "id" guid = b797f456-c4df-4c30-a1d6-eab3284300eb
Column "name" guid = 570af50a-9efd-46af-bd01-3d5abb953306
Column "description" guid = b78ce85e-05b5-4fec-a228-7d4be78e6fac
Column "author" guid = 63af5923-c87d-421d-8bd1-9230dadec63e
Column "created" guid = 79f117e8-dcf6-4835-8221-1dc524ef8e27
Column "created_ms" guid = 1654a5ad-7cd3-45de-a195-99c0bd5bd2c2 parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 261d62f5-e30c-496b-bb74-061f0f528bf2
Column "modified_ms" guid = cec4d3c7-4e3e-42e6-a04e-43a65fb91fbe parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = b9047778-5170-45a4-be59-1b98f3dc832e
Column "deleted" guid = ff044958-9429-4ac6-85eb-e98fa2191d04
Column "hidden" guid = 109c5017-d939-41ac-8e05-81718c3b2215
Column "owner" guid = 6d132b16-79bb-47bc-af7c-167074925375
Column "type" guid = 627f3c43-5816-4537-bf8b-093dfe28abda
 */
CREATE TABLE "postgres_callosum_schema"."data_source" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "type" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "logical_table" guid = 322e0a9c-5e75-4611-920a-75852339ce0e
Column "id" guid = 6c0f9161-64fb-4eaa-adf5-cbd940fcdef1
Column "name" guid = 3282dc8f-68e8-471e-ae69-643db4758a52
Column "description" guid = 1694ed11-da66-4d08-a10c-d5d20f5d93d2
Column "author" guid = ed200b72-84a4-4de8-a0a2-0a4073f0acb2
Column "created" guid = 621541e1-c46d-45b9-b296-a863aa5bac63
Column "created_ms" guid = f99541cf-c4ab-4e98-9573-411a3136c397 parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 0e971921-9eda-4222-a54b-427e7eb98f6f
Column "modified_ms" guid = 81d4eb3c-91f5-4aec-a0f1-2f47fbc6fec8 parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = e1695f06-aa45-40a9-975e-f7f9d8565c71
Column "deleted" guid = 49c4440c-d466-46d8-b793-221c15d0a637
Column "hidden" guid = 064a030a-498d-47df-a88b-779d450707be
Column "owner" guid = b9ea6dad-3396-40be-b891-a55f4cc46ca7
Column "source" guid = 40beaddd-3442-408c-a547-764c7432c217
Column "schema_stripe" guid = 351dac43-5d87-49f0-acd9-6262b2e6e6f2
Column "db_stripe" guid = 75afecb4-ee4e-4790-88f2-68dba802fbae
Column "physical_table_version" guid = fcb4b15e-3bb2-45fa-9627-db7b6e2f0086
Column "physical_table_id" guid = 2232e29d-54d1-4ba4-99c7-1c48daa81ed6
Column "type" guid = 6b548704-6fe2-43c5-8067-3fd9fa067811
Column "data_source_id" guid = af0db113-e86d-4fd4-bd00-b1ba5c8db20c
 */
CREATE TABLE "postgres_callosum_schema"."logical_table" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" varchar(100),
    "hidden" varchar(100),
    "owner" varchar(100),
    "source" varchar(100),
    "schema_stripe" varchar(100),
    "db_stripe" varchar(100),
    "physical_table_version" int,
    "physical_table_id" varchar(100),
    "type" varchar(100),
    "data_source_id" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "logical_table_answer_sheet_link" guid = 227346e5-f662-4321-9b29-c614525e7e89
Column "logical_table_id" guid = 4afb239a-98ee-4d72-8b42-97eeea528365
Column "answer_sheet_id" guid = 8cc658d1-b605-4851-99ee-ebb518fbe696
 */
CREATE TABLE "postgres_callosum_schema"."logical_table_answer_sheet_link" (
    "logical_table_id" varchar(100),
    "answer_sheet_id" varchar(100),
    PRIMARY KEY ("logical_table_id", "answer_sheet_id")
);


/*
Table "logical_column" guid = 900431d0-54f3-4e19-a7d1-6c481fe61bed
Column "id" guid = 48b591c1-1eef-46a3-a7b7-ad45e6c6e85b
Column "name" guid = 3c34356f-923b-4d8e-b252-e27f6393f364
Column "description" guid = 7c9d948a-e648-43cf-b8f8-386b3efd90e1
Column "author" guid = 55b61607-de66-4d0a-9261-53184460f579
Column "created" guid = dce99de1-eaf3-49de-bb5f-c316aca4db80
Column "created_ms" guid = 1eaa4c28-deb3-44bf-8477-d9459523a7ae parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = dbf3b104-72ba-4248-9518-5f32af42c75c
Column "modified_ms" guid = df5d6513-ccf1-46c1-a4ed-47c1769f55ac parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = d5e79c48-39ca-4548-b5bf-ade338cfafa1
Column "deleted" guid = a9c1045d-a3aa-4a45-8449-50bc2b0e609a
Column "hidden" guid = f2ebbbe9-16a6-4ddc-8cdb-2879b1d8a6ff
Column "owner" guid = a2bddd7a-fcd0-47cf-a894-74a6ff8fc493
Column "schema_stripe" guid = ab2a02e1-d7a8-4bfe-874f-970f7e305ab3
Column "db_stripe" guid = f7a7c213-30d4-48c5-bbf3-91eedfd011f7
Column "is_derived" guid = c8b401f0-3e28-46bc-be1c-7a425d8fe760
Column "physical_column_id" guid = 8d326b8d-d367-4ec2-a89d-6117fe76f053
Column "type" guid = b0162ce6-9015-457a-b6b5-dc6d68caa8b8
 */
CREATE TABLE "postgres_callosum_schema"."logical_column" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "schema_stripe" varchar(100),
    "db_stripe" varchar(100),
    "is_derived" bool,
    "physical_column_id" varchar(100),
    "type" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "logical_relationship" guid = 0d666dba-068f-4890-8c23-cd2959222176
Column "id" guid = f91b61a2-3813-4af2-a6c9-4ee33ba14ace
Column "name" guid = ff6207ca-7bd0-42b9-91ac-8b112e787db1
Column "description" guid = cc9bd888-4cfc-4c40-b254-28e6afdf5e2d
Column "author" guid = 510eed1d-d900-43e7-bbdf-ed227383d200
Column "created" guid = 3c264f14-6883-4c59-a5c5-e3b2f9f52761
Column "created_ms" guid = cce44d9a-e22c-4c40-8872-f1fc3f315a7d parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 4342f1cd-e9cd-472d-89b8-5c7ef7b161f2
Column "modified_ms" guid = de6596f8-5f4e-4f4f-a706-2a046516f3af parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = 0187e617-3e2f-4888-98b9-06747dac6a58
Column "deleted" guid = 59aa887e-9f70-44bf-8dc6-9fc0a72f7a65
Column "hidden" guid = 26fd8461-e2f0-498c-b23a-a5fe0672dcd6
Column "owner" guid = d8769786-f12b-4963-b7f5-be743bd56477
Column "schema_stripe" guid = 630bf45f-6a72-4018-bb2d-8a00209004a7
Column "db_stripe" guid = 4f73f58c-4be0-4d62-bcca-537ad6c46d56
Column "source" guid = fc772a13-18b1-48d7-b20d-659f4ae2fd86
Column "destination" guid = 0c948c89-12ea-4590-b8d4-49b5486c9920
Column "physical_relationship_id" guid = 30caa1c5-6b67-4a0e-a6bd-ab23bb075d4b
Column "join_type" guid = c46357e5-af20-414e-bf4e-8581bb7c0e8e
Column "type" guid = c27ec64a-062a-49e3-b5ef-8f28a0636af9
 */
CREATE TABLE "postgres_callosum_schema"."logical_relationship" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "schema_stripe" varchar(100),
    "db_stripe" varchar(100),
    "source" varchar(100),
    "destination" varchar(100),
    "physical_relationship_id" varchar(100),
    "join_type" varchar(100),
    "type" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "visualization" guid = 430979d0-c51b-4dec-b0cf-dabd17433268
Column "id" guid = d87796bc-a440-4ba9-a3f9-8fa044f72caa
Column "name" guid = 5f7d3e19-bf40-42b7-b57c-49e41e2421d2
Column "description" guid = 3f5b897f-b33a-47e9-8aa1-8e723a61a118
Column "author" guid = 2c779650-fa67-491c-ae6b-fe43b363467d
Column "created" guid = efc9f35e-17cb-4016-8d94-1367719ceb7d
Column "created_ms" guid = c35f53b2-fce9-4543-85ac-bac64c835c09 parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 2438ab3a-b705-4843-a24e-21fb3360b91b
Column "modified_ms" guid = fad09976-d457-4a93-96e8-9efd2bf46f43 parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = 76896ee0-f25c-45fe-adef-32e7465f5c6a
Column "deleted" guid = 0f5d671a-200b-4892-8569-7b8eb5d7f739
Column "hidden" guid = cca68faf-404c-49ea-9911-60ec87358395
Column "owner" guid = cb33a418-0894-46fe-b2c2-b3ba4dd520b9
 */
CREATE TABLE "postgres_callosum_schema"."visualization" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "logical_column_viz_link" guid = dd317e14-f888-416d-8494-527b61f60d29
Column "logical_column_id" guid = b1406b10-bce9-41c0-ade4-b90dd428a101
Column "visualization_id" guid = 02c1d13d-73f7-44a6-8ad5-db30b3290113
 */
CREATE TABLE "postgres_callosum_schema"."logical_column_viz_link" (
    "logical_column_id" varchar(100),
    "visualization_id" varchar(100),
    PRIMARY KEY ("logical_column_id", "visualization_id")
);


/*
Table "derived_logical_column_link" guid = 933f01d9-e0f2-4ed1-b200-bcb11f3b3045
Column "derived_logical_column_id" guid = 675c3113-9bc8-42f5-8d23-fc1cb7377423
Column "derived_logical_column_owner_id" guid = 70b19b3a-5e95-46b5-98d8-2b7aa0405b93
Column "logical_column_id" guid = 1b4c6c00-60d0-43db-bd48-c617e2a0809c
Column "logical_column_owner_id" guid = a20fd0ba-91e7-436e-8867-3023251e4e12
 */
CREATE TABLE "postgres_callosum_schema"."derived_logical_column_link" (
    "derived_logical_column_id" varchar(100),
    "derived_logical_column_owner_id" varchar(100),
    "logical_column_id" varchar(100),
    "logical_column_owner_id" varchar(100),
    PRIMARY KEY ("derived_logical_column_id", "logical_column_id")
);


/*
Table "tag" guid = 43b0f200-d4e2-4d58-bdaa-3329e6cd6619
Column "id" guid = 48f3c1c5-7920-423c-84de-9cf5e225dafb
Column "name" guid = c307907a-a074-4f86-a259-c9d99ff800bc
Column "description" guid = 4d6d4c9c-9b52-41c8-95d3-22b774439ccf
Column "author" guid = 46a9ece0-34e9-4d93-bd38-5d84ccef8ae7
Column "created" guid = 8526c7a0-5fc2-434b-ba01-cb7769ced1d5
Column "created_ms" guid = 48961f0c-0c73-4dec-ad56-592b1e2af1b6 parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = 4cd64975-bc8f-4743-b82c-b05582ff05ea
Column "modified_ms" guid = 9e362d2f-a38e-4d99-a336-d6c8d6a4f138 parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = e5a85754-b95f-429b-a820-bc021bc09caf
Column "deleted" guid = c7a8b64c-adc4-466c-8ffe-057ae7f0cb6b
Column "hidden" guid = 909f9f57-94da-4e48-87f8-f303e8844813
Column "owner" guid = bc8865a4-e03b-4949-a298-95a81a4428f3
Column "tagged_count" guid = a51bb743-2315-40f1-a7fc-72ecc7489c42
 */
CREATE TABLE "postgres_callosum_schema"."tag" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "tagged_count" int,
    PRIMARY KEY ("id")
);


/*
Table "object_tag_link" guid = 348c95c0-d969-4515-aca1-a7fcb0212b19
Column "object_id" guid = 44757344-0379-4836-b734-1ace42cb32d9
Column "object_type" guid = 9438a64a-6dd5-4e51-90a9-a6650e43e93d
Column "tag_id" guid = ff5f5dbf-7514-49b2-b6ac-d1edb2fdff2b
 */
CREATE TABLE "postgres_callosum_schema"."object_tag_link" (
    "object_id" varchar(100),
    "object_type" varchar(100),
    "tag_id" varchar(100),
    PRIMARY KEY ("object_id", "tag_id")
);


/*
Table "table_filter" guid = 056b05a1-45fc-45cc-9f1d-5590dbe8dd0c
Column "id" guid = 3724e230-18b7-487f-8d30-4b2a0e92a65e
Column "name" guid = 872c5cf6-5f2b-494a-bd19-70f50cd5a32c
Column "description" guid = 27fcbaa9-4314-4be4-9479-25afea985a83
Column "author" guid = 2ea5690a-85a6-465b-9412-06bacc347efc
Column "created" guid = b6e7ef33-79e4-498d-a34b-ee38714e9b8c
Column "created_ms" guid = 2cc92028-4ede-4f8c-b220-9d2396119ef3 parsing hint %Y%m%d %H:%M:%S
Column "modified" guid = f38dfdd1-9cc8-48a1-b2b8-c4934020f735
Column "modified_ms" guid = 5846559e-ac52-486a-b6eb-bbffddde998f parsing hint %Y%m%d %H:%M:%S
Column "modified_by" guid = 930bc654-8eca-458a-af7f-290d6faec0f2
Column "deleted" guid = da26a270-1813-4348-896e-f8868b96ac59
Column "hidden" guid = 21cadb77-700a-4c0b-a1ca-d5f96832cf67
Column "owner" guid = 29c16193-74c7-4008-b1e4-7a032109e5f0
Column "type" guid = 76270ee7-cd38-4a83-98c4-2f9bdd681567
 */
CREATE TABLE "postgres_callosum_schema"."table_filter" (
    "id" varchar(100),
    "name" varchar(100),
    "description" varchar(100),
    "author" varchar(100),
    "created" bigint,
    "created_ms" DATETIME,
    "modified" bigint,
    "modified_ms" DATETIME,
    "modified_by" varchar(100),
    "deleted" bool,
    "hidden" bool,
    "owner" varchar(100),
    "type" varchar(100),
    PRIMARY KEY ("id")
);


/*
Table "table_filter_relationship_column_link" guid = 473b058b-9fdb-41cd-afee-7d5a3e34bc09
Column "table_filter_id" guid = e3365780-32b6-4da8-a14c-82a9d06f85ae
Column "table_filter_owner_id" guid = 369243b0-13f4-464b-94f3-24fc8567f2ce
Column "logical_relationship_id" guid = 6403975d-f2a7-4093-abb6-1002c0b6a12d
Column "logical_column_id" guid = 6dbc4334-45f1-4681-96c1-44d4f873d002
 */
CREATE TABLE "postgres_callosum_schema"."table_filter_relationship_column_link" (
    "table_filter_id" varchar(100),
    "table_filter_owner_id" varchar(100),
    "logical_relationship_id" varchar(100),
    "logical_column_id" varchar(100),
    PRIMARY KEY ("table_filter_id", "logical_relationship_id", "logical_column_id")
);
