/*
Database "menulog" guid = 2f0e48cc-14e6-4895-a89e-1d325db21c63
 */
CREATE DATABASE "menulog";

USE "menulog";


/*
Schema "falcon_default_schema" guid = 4d46accf-19ed-44f8-ae25-bf52d72355e0
 */
CREATE SCHEMA "falcon_default_schema";


/*
Schema "reporting" guid = 4ef2b29c-092b-4193-b28d-75268a57b61d
 */
CREATE SCHEMA "reporting";


/*
Table "au_permissions_rls" guid = 367623e0-b263-4ba0-be26-987fd6f2bf51
Column "country" guid = 029eea67-07a4-48ed-ada5-00767aae3c31 compression AUTO
Column "username" guid = 9cb20403-c865-4526-9a5f-920e0450f913 compression AUTO
Column "restaurant_id" guid = 71de8589-f356-477f-8740-bdee3c02af9a compression AUTO
Column "count" guid = 4e641ac5-e858-4931-9b7d-e8cd4ef1c5f9 compression AUTO
Column "group_sync" guid = 56935f30-4263-41fe-ace0-c34c14b3a20d compression AUTO
Live Schema Version 1
 */
CREATE TABLE "reporting"."au_permissions_rls" (
    "country" varchar(25),
    "username" varchar(100),
    "restaurant_id" bigint,
    "count" int,
    "group_sync" varchar(100),
    PRIMARY KEY ("country", "username", "restaurant_id")
);


/*
Table "au_permissions_group" guid = ec8fb48a-a444-4abe-8c62-dd263dc263f6
Column "country" guid = 3b2fabca-d95e-431f-8104-9424ac9814a8
Column "username" guid = 21bc9edb-db65-4879-a901-716d1b27abcc
Column "restaurant_id" guid = bb2be0e7-55cb-44c4-ad93-569a2fd2068f
Column "group_name" guid = ab9be86a-cb89-46a0-adf4-37f2df5d90de
Column "display_name" guid = d7989161-9a4b-4e78-a02b-96eb608e2226
 */
CREATE TABLE "reporting"."au_permissions_group" (
    "country" varchar(25),
    "username" varchar(100),
    "restaurant_id" bigint,
    "group_name" varchar(100),
    "display_name" varchar(100)
);


/*
Table "au_restaurants" guid = 3ad68c82-acff-4ffc-9683-4cb09a5f9518
Column "country" guid = 69a8d423-40cc-45ff-9abb-c75fe8e998ec compression DISABLED
Column "restaurant_key" guid = a6c83567-7394-4856-84d0-2f843cb3bf93 compression DISABLED
Column "restaurant_id" guid = 764398aa-a55c-42d0-be9d-383c8762015e compression DISABLED
Column "rest_store_report_name" guid = a61e32be-0732-4b45-b515-1d89e81ec2df compression DISABLED
Column "brand_name" guid = 2d4d3c4e-fbff-4525-88b2-277103f8328b compression DISABLED
Column "restaurant_name" guid = dda205e6-1b25-40da-8142-0719db44b42b compression DISABLED
Column "store_id" guid = fb181799-fd65-411d-8990-7cbe8d508dcc compression DISABLED
Column "franchise" guid = 8d8b0641-65a1-4f99-b514-956fd857a45c compression DISABLED
Column "region" guid = 8c768398-aaa8-4c81-b034-710bc055fa01 compression DISABLED
Column "access_level_misc" guid = 509eb04b-833d-4846-9a15-f109e8fda2d6 compression DISABLED
Column "latitude" guid = c3416035-57f1-46ed-b96b-e772af094c24 compression DISABLED
Column "longitude" guid = 03e12bf7-1dd1-4ebd-b974-37a45cf7db84 compression DISABLED
Column "restaurant_suburb" guid = 6e348f69-51be-4a61-a77b-bfb81da5e2e6 compression DISABLED
Column "restaurant_state" guid = 28e6a4f3-782d-44fb-b9a3-5f4a58003c45 compression DISABLED
Column "just_eat_delivery" guid = fa8e4471-fd2d-46dc-897c-aa34369fb547 compression DISABLED
Column "restaurant_active_flag" guid = 9430daea-19bb-4ee3-b0ce-ae2771661331 compression DISABLED
Live Schema Version 1
 */
CREATE TABLE "reporting"."au_restaurants" (
    "country" varchar(25),
    "restaurant_key" varchar(100),
    "restaurant_id" bigint,
    "rest_store_report_name" varchar(100),
    "brand_name" varchar(100),
    "restaurant_name" varchar(100),
    "store_id" varchar(100),
    "franchise" varchar(100),
    "region" varchar(100),
    "access_level_misc" varchar(100),
    "latitude" double,
    "longitude" double,
    "restaurant_suburb" varchar(100),
    "restaurant_state" varchar(100),
    "just_eat_delivery" int,
    "restaurant_active_flag" int,
    PRIMARY KEY ("restaurant_key")
);


/*
Table "menulog_dates" guid = 5778c791-822f-4454-9242-0c9c0eeed730
Column "order_date" guid = be542102-f6ff-4a36-8cc2-5e1e48544554 parsing hint %Y%m%d
 */
CREATE TABLE "reporting"."menulog_dates" (
    "order_date" date,
    PRIMARY KEY ("order_date")
);


/*
Table "au_orders" guid = e7c5b047-32ac-4e82-836a-6f782458cae3
Column "restaurant_key" guid = 0ab21ab7-5a10-43d2-b192-dd917b8f1e14 compression DISABLED
Column "restaurant_id" guid = df468456-eec2-4e07-b071-c7f1376f3522 compression DISABLED
Column "order_id" guid = 15e55341-61db-46c0-b396-ccd589098271 compression DISABLED
Column "order_date" guid = 34714657-0c71-4cee-9c3e-432f852cb90e parsing hint %Y%m%d compression DISABLED
Column "order_datetime" guid = f827976e-e394-4282-af26-2be20a6b6e42 parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "order_rated_flag" guid = f6ee3d8f-9589-4fdd-9df7-be89c886c82b compression DISABLED
Column "rating_c1" guid = e91660ae-3df5-47b2-8378-25cc1e7c6437 compression DISABLED
Column "rating_c2" guid = f23830f1-47e8-40d6-afad-f62c48ef5517 compression DISABLED
Column "rating_c3" guid = a1a02dcb-9225-4a5c-9cda-ecd42a24f073 compression DISABLED
Column "rating_overall" guid = 85c2fc57-0bb3-4780-b111-f4895ab7416d compression DISABLED
Column "total_order_amount" guid = 4bd4df25-f8a9-473a-b19c-ce60c6541b01 compression DISABLED
Column "delivery_fee_amount" guid = e6b1a2a4-7f91-4de6-b684-fc998f22ec1e compression DISABLED
Column "delivery_flag" guid = 7d56e93e-fec6-475f-bf27-ac8042eb4251 compression DISABLED
Column "collection_flag" guid = c3c1501c-834e-45a1-8a39-8b521ef21fd5 compression DISABLED
Column "delivery_collection" guid = d19a3ca7-493a-42eb-865c-c44df6456667 compression DISABLED
Column "asap_flag" guid = e83dacb5-dfe4-4ec3-aa23-17fabc594605 compression DISABLED
Column "preorder_flag" guid = 9f1a6aba-b7a4-4169-8cf0-54a061b5a79d compression DISABLED
Column "asap_preorder" guid = eecf48d6-a41c-46d8-97f0-d83c744ddca2 compression DISABLED
Column "completed_order_flag" guid = 21698bf3-6550-4080-a34f-df348f35b66e compression DISABLED
Column "cancelled_order_flag" guid = 0ff0a14b-f2f1-45cf-8b47-eea94ad519b0 compression DISABLED
Column "completed_cancelled" guid = 93008f80-5445-4d15-8944-efc5993211a7 compression DISABLED
Column "cancellation_party" guid = aa87124f-f199-415c-9130-c487a3e6e2b7 compression DISABLED
Column "cancellation_reason" guid = 3322cb4c-9b20-4b4e-a6b2-702f45154609 compression DISABLED
Column "restaurant_push_minutes" guid = 34619d65-2c99-4f51-8300-7349bbd512ac compression DISABLED
Column "pushed_count" guid = d8c2d2b0-54c8-4afa-b4b1-c79267492856 compression DISABLED
Column "courier_hold" guid = 68539611-2046-46f1-931c-f4c90d5e8145 compression DISABLED
Column "time_to_accept" guid = 2e424933-df64-4ce1-8926-655d0e69a176 compression DISABLED
Column "time_to_accept_count" guid = 91e2760c-972a-4b24-82a4-ec908a576c7a compression DISABLED
Column "a_to_d_raw" guid = 0ac2f844-697a-4071-9e51-d2dd40957b63 compression DISABLED
Column "a_to_d_raw_count" guid = 9f3a08c4-b364-4f32-82c4-475ce2db6f05 compression DISABLED
Column "a_to_d_adj" guid = ed379847-287c-4bde-9209-ae10f85a9e1a compression DISABLED
Column "a_to_d_adj_count" guid = 842d4abc-9fc5-451a-af22-2d251882b8c6 compression DISABLED
Column "customer_key" guid = a54a1bf6-518d-4954-a021-9f6b0a2efdc6"customer_key" default null compression DISABLED
Column "rating_comment" guid = 7d97b1cd-f4b0-4f29-891f-0614c6622589"rating_comment" default null compression DISABLED
Column "currency" guid = a922e198-8ce1-46a7-af22-7dc29f3e2dc5"currency" default null compression DISABLED
Column "customer_new_to_brand" guid = eb4b7cd8-4572-4292-a6e7-21b2585aa8a7"customer_new_to_brand" default null
PARTITION BY HASH  (32) KEY ("order_id" )
Live Schema Version 7
 */
CREATE TABLE "reporting"."au_orders" (
    "restaurant_key" varchar(100),
    "restaurant_id" bigint,
    "order_id" bigint,
    "order_date" date,
    "order_datetime" DATETIME,
    "order_rated_flag" int,
    "rating_c1" int,
    "rating_c2" int,
    "rating_c3" int,
    "rating_overall" double,
    "total_order_amount" double,
    "delivery_fee_amount" double,
    "delivery_flag" int,
    "collection_flag" int,
    "delivery_collection" varchar(100),
    "asap_flag" int,
    "preorder_flag" int,
    "asap_preorder" varchar(100),
    "completed_order_flag" int,
    "cancelled_order_flag" int,
    "completed_cancelled" varchar(100),
    "cancellation_party" varchar(100),
    "cancellation_reason" varchar(255),
    "restaurant_push_minutes" int,
    "pushed_count" int,
    "courier_hold" double,
    "time_to_accept" double,
    "time_to_accept_count" int,
    "a_to_d_raw" double,
    "a_to_d_raw_count" int,
    "a_to_d_adj" double,
    "a_to_d_adj_count" int,
    "customer_key" varchar(50),
    "rating_comment" varchar(1000),
    "currency" varchar(28),
    "customer_new_to_brand" int,
    PRIMARY KEY ("order_id")
)
PARTITION BY HASH (32) KEY ("order_id");
