/*
Database "justeat" guid = 6ecff207-5cd5-4e67-9405-1ed66aadf9b5
 */
CREATE DATABASE "justeat";

USE "justeat";


/*
Schema "brands" guid = b8a1190c-6246-4c3e-a78b-c5b3bf42bcec
 */
CREATE SCHEMA "brands";


/*
Table "Orders" guid = 1face894-021b-44c7-af14-55099a196c19
Column "country" guid = 38f78c28-a7b5-4e96-82f3-923221ce2809 compression DISABLED
Column "order_id" guid = c0a5c676-6ed9-4fc3-b8d7-3da543c7ec4d compression DISABLED
Column "order_date" guid = bf022720-cd02-4201-b1b5-e8318d987259 parsing hint %Y%m%d compression DISABLED
Column "order_rated_flag" guid = bdc5424b-801f-4305-b0d5-12521e0390c0 compression DISABLED
Column "rating" guid = 17345182-d1d5-4d04-8982-0b8b30966f95 compression DISABLED
Column "basket_value" guid = 5783cb8c-7b26-4fe8-9c19-214652ac90d9 compression DISABLED
Column "chain" guid = 2353a053-1d50-4b43-b05c-2363747a0248 compression DISABLED
Column "restaurant_id" guid = cd6c2b41-94d3-481b-90c5-e51263e4f808 compression DISABLED
Column "restaurant_name" guid = bfa1af4b-7fb1-48e9-b1e4-d22c1743529c compression DISABLED
Column "store_id" guid = 6d3aa07d-f057-4434-b5b8-a44d50f42d72 compression DISABLED
Column "store_name" guid = 950af59d-a7a5-4538-89e9-f4b22c1cefad compression DISABLED
Column "rest_store_report_name" guid = 285b9d3d-59a7-4882-9a79-e35a0d103b88 compression DISABLED
Column "store_group" guid = 7ddf10e2-31ae-4dc0-a999-8a0711797ccd compression DISABLED
Column "franchise_manager" guid = d4694da5-5c8f-493e-8a44-7bb6cbf3bf26 compression DISABLED
Column "regional_manager" guid = 436592bf-48f4-43b4-85bb-cae0ced7eaf5 compression DISABLED
Column "store_manager" guid = 012b331d-eeea-486d-b26a-1be28c897030 compression DISABLED
Column "RDS_flag" guid = bdd82582-5081-4d14-a872-0c3e3646761b compression DISABLED
Column "delivery_flag" guid = 122d7b4c-ab98-4086-8aec-7f5332e74cfb compression DISABLED
Column "collection_flag" guid = 4756ed5c-2b60-483e-8c61-60a32884abf2 compression DISABLED
Column "delivery_collection" guid = 393eaeaf-241f-4c6a-894e-529ec23cf7ff compression DISABLED
Column "immediate_delivery_flag" guid = ed14826b-c9a3-48b1-84a0-ef749043ad43 compression DISABLED
Column "pre_order_flag" guid = b81992ef-9161-4e71-bc05-6b08e4bb92ef compression DISABLED
Column "immediate_pre_order" guid = 78898b74-8763-438e-872e-79356ea111a1 compression DISABLED
Column "good_order_flag" guid = 8ccf74da-646b-4f7f-8675-c6d32e4a50e7 compression DISABLED
Column "bad_order_flag" guid = 09c4dfe5-6767-4b04-a6b0-47efbe267191 compression DISABLED
Column "good_bad" guid = b58dc5ec-ebff-4950-96ca-6ba644f46296 compression DISABLED
Column "order_status_description" guid = c6da2be8-2a1c-41aa-bd2b-f882614cef64 compression DISABLED
Column "restaurant_district" guid = 83ca5d1e-e13b-4483-a41d-82f01e0ec4e8 compression DISABLED
Column "r_latitude" guid = 5930f34c-807a-40df-8e1f-65c93e2c43e2 compression DISABLED
Column "r_longitude" guid = 6742e6cb-044b-4e27-b49f-dbcaaf27bb56 compression DISABLED
Column "order_district" guid = 0b98e698-2122-4f66-865a-5695367f5aeb compression DISABLED
Column "o_latitude" guid = f23f143f-da75-4441-b53e-ee47fb22e2b0 compression DISABLED
Column "o_longitude" guid = d29dbd6c-a528-41ed-89c5-2a6ef71a4fe2 compression DISABLED
Column "restaurant_hold_hq" guid = 1be11b43-c075-4ec7-8600-e0edcaf70b4a compression DISABLED
Column "restaurant_hold_sign" guid = f7a766a5-92fe-485e-a50a-12002cdac665 compression DISABLED
Column "restaurant_hold_count" guid = e18cc99f-b01f-44db-becb-e17938647581 compression DISABLED
Column "order_timeliness" guid = 6eb49aa9-9fce-43a9-b882-583826ac9ce4 compression DISABLED
Column "order_on_time" guid = e53350ff-aca5-47f0-b645-9c8b8f2e67d2 compression DISABLED
Column "order_timeliness_count" guid = 5e4eb313-b23b-4581-a050-aafbfff633cc compression DISABLED
Column "delivery_time" guid = d6cd07f4-f314-471d-8307-4aa308a95548 compression DISABLED
Column "delivery_time_count" guid = 4f49679b-2387-437a-8368-38ba38fd01e4 compression DISABLED
Column "customer_key" guid = 5e48a87f-1b0f-481d-87c0-2bc6a58c762c compression DISABLED
Column "order_datetime" guid = 4d98a98f-a79f-4738-bb7a-3c4daa91fb6f parsing hint %Y%m%d %H:%M:%S"order_datetime" default null compression DISABLED
Column "bad_order_subcategory" guid = 031b4c45-9592-4fc8-8df5-63448feda61a"bad_order_subcategory" default null compression DISABLED
Column "received_to_accepted" guid = 2e4b75c0-4b3d-4dff-af85-4e5e02c92207"received_to_accepted" default null compression DISABLED
Column "received_to_accepted_count" guid = 85f6943d-672c-4a4c-93a2-382fb7db9f3a"received_to_accepted_count" default null compression DISABLED
Column "order_datetime_exact" guid = dd1ce3cd-b7e0-4f67-89ba-e4f6c5946de9 parsing hint %Y%m%d %H:%M:%S"order_datetime_exact" default null compression DISABLED
Column "commentary" guid = b65682b2-22bf-4525-9ef9-9a061e4ae022"commentary" default null compression DISABLED
Column "kitchen_delay" guid = 7795ec07-cbcc-464e-b15f-27fbe2549679"kitchen_delay" default null compression DISABLED
Column "kitchen_delay_pos" guid = 743884ad-bc2f-4be5-82f3-a4bf954ef0c9"kitchen_delay_pos" default null compression DISABLED
Column "kitchen_delay_count" guid = cb658ba9-3df5-49a8-856a-ecba6ef7301e"kitchen_delay_count" default null compression DISABLED
Column "missing_items_flag" guid = f0de2aa8-0adc-4027-bf6a-a9d12c089157"missing_items_flag" default null compression DISABLED
Column "missing_items_count" guid = e03f0b58-3990-40af-833e-83e2a177a9c8"missing_items_count" default null compression DISABLED
Column "order_pool_name" guid = cefbd7b7-3231-44d3-bbb8-7944e3fc7663"order_pool_name" default null compression DISABLED
Column "driver_accepted_time" guid = 9f14851c-3f40-47a7-8b12-f34fb5af9159"driver_accepted_time" default null compression DISABLED
Column "driver_wait_time" guid = 88444f13-1e5c-4aae-abf3-6ec00ad9b299"driver_wait_time" default null
Column "delivery_parent_name" guid = 963841fe-cb78-4fa4-961c-48a32a51483b"delivery_parent_name" default null
Column "offer_flag" guid = 37f0bb91-c52c-40b9-bd8d-1ac348a396f3"offer_flag" default null
Column "offer_type" guid = e685d44d-cbd0-432e-9dd6-94b6be418b57"offer_type" default null
Column "campaign_id" guid = f97af3fd-ae78-43a0-9a63-9a78183efdcb"campaign_id" default null
Column "discount_percent" guid = 51f332e2-9f8f-4a24-bbd6-efa044aa84f4"discount_percent" default null
Column "applied_discount_amount" guid = 926bc12e-0eaf-479b-9fe9-eb98f37ae81f"applied_discount_amount" default null
Column "driver_wait_time_pos" guid = d58b09b8-dad9-44c6-ae66-5da6653e2d5f"driver_wait_time_pos" default null
Column "driver_wait_time_count" guid = 69a42578-69d8-4fbe-9e7f-9ac468447cd1"driver_wait_time_count" default null
PARTITION BY HASH  (32) KEY ("order_id" )
Live Schema Version 33
 */
CREATE TABLE "brands"."Orders" (
    "country" varchar(25),
    "order_id" varchar(25),
    "order_date" date,
    "order_rated_flag" int,
    "rating" double,
    "basket_value" double,
    "chain" varchar(100),
    "restaurant_id" bigint,
    "restaurant_name" varchar(100),
    "store_id" varchar(25),
    "store_name" varchar(100),
    "rest_store_report_name" varchar(120),
    "store_group" varchar(100),
    "franchise_manager" varchar(100),
    "regional_manager" varchar(100),
    "store_manager" varchar(100),
    "RDS_flag" int,
    "delivery_flag" int,
    "collection_flag" int,
    "delivery_collection" varchar(25),
    "immediate_delivery_flag" int,
    "pre_order_flag" int,
    "immediate_pre_order" varchar(25),
    "good_order_flag" int,
    "bad_order_flag" int,
    "good_bad" varchar(10),
    "order_status_description" varchar(50),
    "restaurant_district" varchar(10),
    "r_latitude" double,
    "r_longitude" double,
    "order_district" varchar(10),
    "o_latitude" double,
    "o_longitude" double,
    "restaurant_hold_hq" double,
    "restaurant_hold_sign" int,
    "restaurant_hold_count" int,
    "order_timeliness" double,
    "order_on_time" int,
    "order_timeliness_count" int,
    "delivery_time" double,
    "delivery_time_count" int,
    "customer_key" varchar(25),
    "order_datetime" DATETIME,
    "bad_order_subcategory" varchar(255),
    "received_to_accepted" double,
    "received_to_accepted_count" int,
    "order_datetime_exact" DATETIME,
    "commentary" varchar(1023),
    "kitchen_delay" double,
    "kitchen_delay_pos" int,
    "kitchen_delay_count" int,
    "missing_items_flag" int,
    "missing_items_count" int,
    "order_pool_name" varchar(100),
    "driver_accepted_time" double,
    "driver_wait_time" double,
    "delivery_parent_name" varchar(255),
    "offer_flag" int,
    "offer_type" varchar(255),
    "campaign_id" varchar(255),
    "discount_percent" double,
    "applied_discount_amount" double,
    "driver_wait_time_pos" int,
    "driver_wait_time_count" int,
    PRIMARY KEY ("order_id")
)
PARTITION BY HASH (32) KEY ("order_id");


/*
Table "Offline" guid = 5ca3f02b-3ac9-434b-9a2a-0c697e7e00cb
Column "restaurant_id" guid = 93178e9c-d583-408d-b2bf-15088655a434
Column "calendar_date" guid = b3716d76-24e1-4cd8-8c6c-a880186245ef parsing hint %Y%m%d
Column "JEAgent_ClosedToday" guid = 4ad22c24-dc06-4b37-b2ee-04f51046dcc3
Column "JEAgent_FailedJctConnection" guid = cecc998f-bad2-49ff-9db4-ebc6224627b2
Column "JEAgent_IgnoredOrders" guid = b8570d59-8671-4f0f-8b83-438cbbc52c31
Column "JEAgent_NoTrOverride" guid = b68b0aea-2ab7-4505-b81e-0866b35eaacf
Column "JEAgent_TempOffline" guid = 1c4c1a5b-4a64-45c1-961e-b1e8932a3791
Column "JEDriverCapacityTool_DriverCapacity" guid = 681a5cbc-1cd9-4253-ac84-28d38717d3b4
Column "JEPTOL_FailedJctConnection" guid = 0e508227-b313-4f50-bc01-e8bd496dd85b
Column "JEPTOL_IgnoredOrders" guid = 18d1958e-477c-4318-b081-3d8c7ea37410
Column "Restaurant_ClosedToday" guid = afb915aa-7d0b-4048-b568-e804addc8994
Column "Restaurant_TempOffline" guid = 1be5e5cb-19b8-484f-be5c-69c1e1127ffc
Column "offline_total" guid = f14f59e0-2e22-4a63-8d5c-82be6f062e83
Column "online" guid = 8687e7f3-468a-4a21-a507-47aba753c496
Column "open" guid = 26d4cece-5660-4b4f-a8c8-89c7db2be4e7
Column "country" guid = 24d8de1b-cb2c-4a1e-a45f-205507c90017
Column "JEAgent_ClosedDueToEvent" guid = 45befff7-6589-4126-9239-e2ee9fa8d413"JEAgent_ClosedDueToEvent" default 0.000000
Column "JEPTOL_NoTrOverride" guid = 75ea7e81-b7fe-4fc3-b92c-2eca6db5ae8a"JEPTOL_NoTrOverride" default null
Column "Restaurant_ClosedDueToEvent" guid = 7518935e-2dbb-4157-8745-e006ba959869"Restaurant_ClosedDueToEvent" default null
Column "Restaurant_FailedJctConnection" guid = 0c13eac3-331c-42e9-9512-836a6fee4bf7"Restaurant_FailedJctConnection" default null
Column "Restaurant_IgnoredOrders" guid = 7b8cdaf3-4e65-4360-913e-fe8e87545566"Restaurant_IgnoredOrders" default null
Column "Restaurant_NoTrOverride" guid = 2ee5d3b3-39ee-4540-bfd0-98b708ccec13"Restaurant_NoTrOverride" default null
PARTITION BY HASH  (32) KEY ("restaurant_id" )
Live Schema Version 10
 */
CREATE TABLE "brands"."Offline" (
    "restaurant_id" bigint,
    "calendar_date" date,
    "JEAgent_ClosedToday" double,
    "JEAgent_FailedJctConnection" double,
    "JEAgent_IgnoredOrders" double,
    "JEAgent_NoTrOverride" double,
    "JEAgent_TempOffline" double,
    "JEDriverCapacityTool_DriverCapacity" double,
    "JEPTOL_FailedJctConnection" double,
    "JEPTOL_IgnoredOrders" double,
    "Restaurant_ClosedToday" double,
    "Restaurant_TempOffline" double,
    "offline_total" double,
    "online" double,
    "open" double,
    "country" varchar(25),
    "JEAgent_ClosedDueToEvent" double,
    "JEPTOL_NoTrOverride" double,
    "Restaurant_ClosedDueToEvent" double,
    "Restaurant_FailedJctConnection" double,
    "Restaurant_IgnoredOrders" double,
    "Restaurant_NoTrOverride" double,
    PRIMARY KEY ("restaurant_id", "calendar_date", "country")
)
PARTITION BY HASH (32) KEY ("restaurant_id");


/*
Table "Justeat_Dates" guid = 9fe00083-a85d-4bce-834e-50af0be1077c
Column "order_date" guid = eba6e024-5ae6-44b6-97f5-ec4474947c1a
Live Schema Version 2
 */
CREATE TABLE "brands"."Justeat_Dates" (
    "order_date" date,
    PRIMARY KEY ("order_date")
);


/*
Table "Restaurants" guid = 0d346b98-a9d1-4319-9aae-5db561cd9ba7
Column "restaurant_id" guid = 0a5bf3b8-83b6-4e2f-85f4-0829f2959583
Column "country" guid = 68d069a7-9069-42f4-b4e4-a0c5deaebb78"country" default uk
Column "chain" guid = 288e2df1-3c70-430b-b044-3010f76a9294"chain" default null
Column "restaurant_name" guid = f5fdf49c-8a38-44ea-9855-cd70660fab0c"restaurant_name" default null
Column "store_id" guid = b921714c-8180-4989-a153-6e8d671631ce"store_id" default null
Column "store_name" guid = 08b7e1f9-1b64-4718-89a2-f23931994c24"store_name" default null
Column "rest_store_report_name" guid = bc93489d-da1b-4416-a2ec-208de5bcdae8"rest_store_report_name" default null
Column "store_manager" guid = 639070fd-4905-4b57-b3e8-3e188e47cb9b"store_manager" default null
Column "franchise_manager" guid = a50a41cb-5eb9-461e-b5fc-9d72aca06200"franchise_manager" default null
Column "regional_manager" guid = 17aeb3f6-586d-45df-a1ec-778548eae02b"regional_manager" default null
Column "store_group" guid = b7b08a68-ed34-4af4-a58e-a06aa26cfda1"store_group" default null
Column "active_restaurant_flag" guid = ee0ff846-c30a-412b-8f9b-13ed8958e2b5"active_restaurant_flag" default null
Column "restaurant_city" guid = ac366004-45fd-4abc-9ab8-157533b7b9d9"restaurant_city" default null
Column "sales_region" guid = a75678df-5ae3-4f7e-9a2c-daf981a93611"sales_region" default null
Column "restaurant_key" guid = 3ceaf64a-9b78-4a13-a31b-1b7f0add2b8b"restaurant_key" default null
Column "primary_cuisine" guid = 1240e063-3c7a-460c-ac25-f68e5608da7d"primary_cuisine" default null
Column "secondary_cuisine" guid = 54d907f1-5e80-4625-b393-1706e271d062"secondary_cuisine" default null
Live Schema Version 42
 */
CREATE TABLE "brands"."Restaurants" (
    "restaurant_id" bigint,
    "country" varchar(25),
    "chain" varchar(100),
    "restaurant_name" varchar(100),
    "store_id" varchar(30),
    "store_name" varchar(100),
    "rest_store_report_name" varchar(150),
    "store_manager" varchar(100),
    "franchise_manager" varchar(150),
    "regional_manager" varchar(100),
    "store_group" varchar(55),
    "active_restaurant_flag" int,
    "restaurant_city" varchar(255),
    "sales_region" varchar(255),
    "restaurant_key" varchar(255),
    "primary_cuisine" varchar(255),
    "secondary_cuisine" varchar(255),
    PRIMARY KEY ("restaurant_id", "country")
);


/*
Table "Permissions_Group" guid = 1aedb6ba-ec80-4152-9831-75ceb2e98fd0
Column "country" guid = b4924e86-f7ca-48ae-bb83-dbc8367eb9e2
Column "username" guid = c178dc9f-1d14-4e82-8c7f-a3d57ea655f8
Column "restaurant_id" guid = cdd27378-2438-48fe-9f1f-f1d4dc5be816
Column "group_name" guid = b2a8b9ac-fa5a-4808-95a0-e9c880dc1649
Column "display_name" guid = f769f6c5-0670-4653-8ccb-cb48cecbc136
 */
CREATE TABLE "brands"."Permissions_Group" (
    "country" varchar(255),
    "username" varchar(255),
    "restaurant_id" bigint,
    "group_name" varchar(255),
    "display_name" varchar(255)
);


/*
Table "Permissions_RLS" guid = 9cb99d92-d55d-40b7-ab5a-2e1424700f95
Column "country" guid = 20027bbe-bc57-45ce-a6a0-88d7b3538f6d
Column "username" guid = 9ee97c09-6d82-4386-8550-00cf84dcbfaa
Column "restaurant_id" guid = 9b97c56d-5622-426b-b8eb-2935f42863ec
Column "count" guid = 5a386bfa-b8db-4c3c-a0b2-24236c8286d8
Column "group_sync" guid = 7f7bd0a5-ec18-4964-84c7-be13a03e9e3f"group_sync" default null
Live Schema Version 1
 */
CREATE TABLE "brands"."Permissions_RLS" (
    "country" varchar(255),
    "username" varchar(255),
    "restaurant_id" bigint,
    "count" bigint,
    "group_sync" varchar(255),
    PRIMARY KEY ("country", "username", "restaurant_id")
);


/*
Table "date_lkup" guid = b86b5fc8-4c8f-4f25-870e-2180ee5d5878
Column "date" guid = 478908f0-26fd-4e5f-a7af-ff2e6518da42 parsing hint %Y%m%d compression DISABLED
Column "weekday_name" guid = e95bd388-cd02-4121-8665-38df5daba250 compression DISABLED
Column "month_comm" guid = 34fcc7f7-97d2-46f5-9fb0-74a1e5d4c454 parsing hint %Y%m%d compression DISABLED
 */
CREATE TABLE "brands"."date_lkup" (
    "date" date,
    "weekday_name" varchar(255),
    "month_comm" date
);


/*
Table "User_Azure_Status" guid = 8d69c31c-b36a-4120-97eb-ec9fb20045de
Column "mail" guid = 7f64a304-17b1-4fb5-a383-bb321f57cb61 compression DISABLED
Column "displayname" guid = fd7c11c3-ec1b-4740-ae61-2087f674806d compression DISABLED
Column "userstate" guid = 96cf9434-163f-48c0-b1f4-fafc6c189df9 compression DISABLED
 */
CREATE TABLE "brands"."User_Azure_Status" (
    "mail" varchar(255),
    "displayname" varchar(255),
    "userstate" varchar(255)
);


/*
Table "Offline_v2_1" guid = 85edf6ad-8594-4329-9ca5-8998b37a7fa8
Column "restaurant_id" guid = 6b81c353-c584-49a7-9080-931dfa62def8 compression DISABLED
Column "order_datetime" guid = 17f287ac-2879-4605-9cd4-e3daff7d97fd parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "calendar_date" guid = 3b570894-77b1-416b-9a2d-34d7329d46ac parsing hint %Y%m%d compression DISABLED
Column "hour_start" guid = ad04879a-efd4-4c5d-afaa-c400c0577674 parsing hint %H:%M:%S compression DISABLED
Column "JEAgent_ClosedDueToEvent" guid = 4f3a807b-72c3-49ae-993c-a358f7f64a03 compression DISABLED
Column "JEAgent_ClosedToday" guid = 6ae0ecaf-f418-42f1-85f2-ae2697be9783 compression DISABLED
Column "JEAgent_FailedJctConnection" guid = 86b7ae27-1759-4a53-8333-19cfb5328a6e compression DISABLED
Column "JEAgent_IgnoredOrders" guid = 8ec94264-4491-4edb-8a15-e320cdf331e6 compression DISABLED
Column "JEAgent_NoTrOverride" guid = 5a5b8d68-3882-450b-b45f-c0ffcffdd810 compression DISABLED
Column "JEAgent_TempOffline" guid = 37d6ffe0-829e-4a6d-a44f-7a3379852f8f compression DISABLED
Column "JEDriverCapacityTool_DriverCapacity" guid = a775e03a-1ce4-424d-aa76-08c4a3eb35fe compression DISABLED
Column "JEPTOL_FailedJctConnection" guid = 01fd7ea4-211b-4ec1-be2e-5972c2765455 compression DISABLED
Column "JEPTOL_IgnoredOrders" guid = dc76b0d8-c8d7-4af5-8cb7-03495a8d95ba compression DISABLED
Column "JEPTOL_NoTrOverride" guid = f5e1a2a0-2597-4032-9484-c4700a87ec25 compression DISABLED
Column "Restaurant_ClosedDueToEvent" guid = 75c13b5b-90d2-4540-b37d-83d4c450a39d compression DISABLED
Column "Restaurant_ClosedToday" guid = db72ab2a-0be8-4079-9b77-fcb8a285fd18 compression DISABLED
Column "Restaurant_FailedJctConnection" guid = 17b1e8d9-bb0d-43b5-a5d7-1083f4b0ea8b compression DISABLED
Column "Restaurant_IgnoredOrders" guid = 8e62189c-1b05-4e34-8192-ffdd30dbf772 compression DISABLED
Column "Restaurant_NoTrOverride" guid = cbce183d-d209-4c9a-b10f-5c3ae40e9441 compression DISABLED
Column "Restaurant_TempOffline" guid = 2ff798ca-3a19-424b-9ba4-a6fe00a3908e compression DISABLED
Column "offline_total" guid = 231d2958-3d3d-4721-80bc-e3bcb8dc40d1 compression DISABLED
Column "online" guid = 6572d23c-c8a7-4c53-ad29-572307c74f2c compression DISABLED
Column "open" guid = 0f1e3e65-37d8-40d3-b166-2d848fb699c9 compression DISABLED
Column "country" guid = 07c4b8c7-de5a-4cff-aa1d-b19312be5d67 compression DISABLED
PARTITION BY HASH  (32) KEY ("restaurant_id" )
 */
CREATE TABLE "brands"."Offline_v2_1" (
    "restaurant_id" bigint,
    "order_datetime" DATETIME,
    "calendar_date" date,
    "hour_start" time,
    "JEAgent_ClosedDueToEvent" double,
    "JEAgent_ClosedToday" double,
    "JEAgent_FailedJctConnection" double,
    "JEAgent_IgnoredOrders" double,
    "JEAgent_NoTrOverride" double,
    "JEAgent_TempOffline" double,
    "JEDriverCapacityTool_DriverCapacity" double,
    "JEPTOL_FailedJctConnection" double,
    "JEPTOL_IgnoredOrders" double,
    "JEPTOL_NoTrOverride" double,
    "Restaurant_ClosedDueToEvent" double,
    "Restaurant_ClosedToday" double,
    "Restaurant_FailedJctConnection" double,
    "Restaurant_IgnoredOrders" double,
    "Restaurant_NoTrOverride" double,
    "Restaurant_TempOffline" double,
    "offline_total" double,
    "online" double,
    "open" double,
    "country" varchar(25),
    PRIMARY KEY ("restaurant_id", "country", "order_datetime")
)
PARTITION BY HASH (32) KEY ("restaurant_id");


/*
Table "Justeat_DateTime" guid = 99b3de99-f6a1-420e-a8a0-d1661b857d4f
Column "order_datetime" guid = 808d73d2-0840-4218-9c61-798b127be9cc parsing hint %Y%m%d %H:%M:%S compression DISABLED
 */
CREATE TABLE "brands"."Justeat_DateTime" (
    "order_datetime" DATETIME,
    PRIMARY KEY ("order_datetime")
);


/*
Table "Restaurant_Days" guid = 620ba6ef-9f6d-4cfa-924d-01ea690ebe63
Column "country_code" guid = b5c58ad4-0113-49c5-a118-695acf70d039 compression DISABLED
Column "restaurant_id_local" guid = b81f283e-0f75-48cb-b837-d6098a13ae36 compression DISABLED
Column "date" guid = 87ab59d8-d46f-4c92-8321-2a30ba91c0db parsing hint %Y%m%d compression DISABLED
PARTITION BY HASH  (32) KEY ("restaurant_id_local" )
 */
CREATE TABLE "brands"."Restaurant_Days" (
    "country_code" varchar(25),
    "restaurant_id_local" bigint,
    "date" date,
    PRIMARY KEY ("country_code", "restaurant_id_local", "date")
)
PARTITION BY HASH (32) KEY ("restaurant_id_local");


/*
Table "Orders_d_1" guid = 4c7a9f7c-c625-460e-a696-73e4a885649d
Column "country" guid = 70e74cbf-afc6-4273-aeba-690ec556290a compression DISABLED
Column "order_id" guid = 06bf5aba-7c3a-4b07-90c3-87d230da07a5 compression DISABLED
Column "order_date" guid = 5da05f4a-9f02-4b2b-a1eb-74249372a3b4 parsing hint %Y%m%d compression DISABLED
Column "order_rated_flag" guid = 1e9536fa-b974-4c2c-a631-2ed1663f27a4 compression DISABLED
Column "rating" guid = 5167f601-2621-4c0b-b23b-70adb0dd32fc compression DISABLED
Column "basket_value" guid = b4b1585b-8f36-46f4-8d10-f97762313e09 compression DISABLED
Column "chain" guid = f23e88e1-758e-4b1d-9a78-b58a6866835e compression DISABLED
Column "restaurant_id" guid = 8083346f-49ad-41b8-b9b8-279e6c661dc3 compression DISABLED
Column "restaurant_name" guid = 02a04732-61c6-4510-bb4c-3d5e8195f379 compression DISABLED
Column "store_id" guid = d3119542-65e8-429d-9640-649bfded9439 compression DISABLED
Column "store_name" guid = ad7d1a14-7774-4090-9102-551879d11b47 compression DISABLED
Column "rest_store_report_name" guid = f1e2b143-b8c8-4355-a4d7-e04e8e8f072a compression DISABLED
Column "store_group" guid = ecc416ef-f3d2-44b6-a070-97783587a72e compression DISABLED
Column "franchise_manager" guid = e81ad4dd-2a95-4255-9190-528e64375498 compression DISABLED
Column "regional_manager" guid = 597515b6-7ed7-44b6-9991-037e4503c75d compression DISABLED
Column "store_manager" guid = f07f5bcb-8b65-40e9-9785-8db8545a06f1 compression DISABLED
Column "RDS_flag" guid = 19548fe8-3adf-4405-9a7a-3eb7bf4bcdc0 compression DISABLED
Column "delivery_flag" guid = 113f587f-1188-4091-a948-213213e7b81f compression DISABLED
Column "collection_flag" guid = ee4b7af8-39b3-4f15-a755-23b340bc32d8 compression DISABLED
Column "delivery_collection" guid = fa4dc671-21b8-44e7-9cc8-f73ff9605e53 compression DISABLED
Column "immediate_delivery_flag" guid = 262752b2-89ea-4f2e-a6b7-5932abf48d07 compression DISABLED
Column "pre_order_flag" guid = f2858970-193d-4f07-b5a1-839fca100ede compression DISABLED
Column "immediate_pre_order" guid = f44a1d29-a83e-41d0-93d2-438b09331c09 compression DISABLED
Column "good_order_flag" guid = 3a693469-53a9-4906-858f-1f929930deba compression DISABLED
Column "bad_order_flag" guid = 4ec4d47d-25f0-4203-b263-b8093f6fce12 compression DISABLED
Column "good_bad" guid = c77c8340-8747-4306-b789-d75efcc7ed75 compression DISABLED
Column "order_status_description" guid = bc2c89c6-437d-44ad-a769-f7d24b10f034 compression DISABLED
Column "restaurant_district" guid = 66df162d-6df6-43ec-b086-cc8bda90ac6c compression DISABLED
Column "r_latitude" guid = f5f2a098-228a-475b-874d-57961be63186 compression DISABLED
Column "r_longitude" guid = 79e00407-1b4c-475f-ab81-a168491a3342 compression DISABLED
Column "order_district" guid = 2f231e0a-ba0a-4e02-b917-024bea4a8c3a compression DISABLED
Column "o_latitude" guid = 6552bcb0-c044-4870-97b1-80eb58a3f5e6 compression DISABLED
Column "o_longitude" guid = 6c9d5441-b063-4e2d-918c-05a33a420bcf compression DISABLED
Column "restaurant_hold_hq" guid = 75beb89e-047f-4e9a-88b3-b024065c7cf7 compression DISABLED
Column "restaurant_hold_sign" guid = 31ce752e-cfc8-4539-a548-ca958510351e compression DISABLED
Column "restaurant_hold_count" guid = 2ebb7e95-1ab3-4098-9a79-a1526cd96a21 compression DISABLED
Column "order_timeliness" guid = 0ddace4d-1442-429e-83f5-56d4ab7f2d04 compression DISABLED
Column "order_on_time" guid = efa115c7-0d82-488e-9e8f-c7e7356f5d0b compression DISABLED
Column "order_timeliness_count" guid = 6a197e0c-4056-4d0a-be0d-e4b1915eb18d compression DISABLED
Column "delivery_time" guid = 7988b702-f460-4ee3-b9ec-ab9a1a42c21d compression DISABLED
Column "delivery_time_count" guid = 134e44d3-5d49-4cfc-be0e-b2856dbd66c6 compression DISABLED
Column "customer_key" guid = 49608975-17de-45e5-97b9-599672729195 compression DISABLED
Column "order_datetime" guid = f876e7f6-bbb9-4356-8982-87e6ba36b6ab parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "bad_order_subcategory" guid = 8474f94d-c37e-4d2a-95f3-8d66f7b4d778 compression DISABLED
Column "received_to_accepted" guid = 85f4be35-55ca-4387-9b71-1bb2b7faa165 compression DISABLED
Column "received_to_accepted_count" guid = d8c466c8-f448-487a-ba6f-11c28c69b2ba compression DISABLED
Column "order_datetime_exact" guid = aabc2ebd-2949-478b-9270-01afd455c40e parsing hint %Y%m%d %H:%M:%S compression DISABLED
Column "commentary" guid = 4a4be5e6-c0af-4284-b39b-e7b55b7b51eb compression DISABLED
Column "kitchen_delay" guid = 0d2dfc1d-aff3-4133-a060-b6d2d6a2734b compression DISABLED
Column "kitchen_delay_pos" guid = de1c06c7-ca1a-4b67-a699-ee8b7ffa223e compression DISABLED
Column "kitchen_delay_count" guid = 050f7a8d-7880-4677-a7ec-6aa8f225816a compression DISABLED
Column "missing_items_flag" guid = 3cded90f-6d5a-49a0-8de7-365c8028338f compression DISABLED
Column "missing_items_count" guid = 465e7c83-8a10-4141-b8a6-e05631d563d5 compression DISABLED
Column "order_pool_name" guid = c5d0473f-c0c2-4f55-937a-42bca6c700f0"order_pool_name" default null
Column "driver_accepted_time" guid = e61c16a6-4a3b-4095-9277-851945593e91"driver_accepted_time" default null
PARTITION BY HASH  (8) KEY ("order_id" )
Live Schema Version 3
 */
CREATE TABLE "brands"."Orders_d_1" (
    "country" varchar(25),
    "order_id" varchar(25),
    "order_date" date,
    "order_rated_flag" int,
    "rating" double,
    "basket_value" double,
    "chain" varchar(100),
    "restaurant_id" bigint,
    "restaurant_name" varchar(100),
    "store_id" varchar(25),
    "store_name" varchar(100),
    "rest_store_report_name" varchar(120),
    "store_group" varchar(50),
    "franchise_manager" varchar(100),
    "regional_manager" varchar(100),
    "store_manager" varchar(100),
    "RDS_flag" int,
    "delivery_flag" int,
    "collection_flag" int,
    "delivery_collection" varchar(25),
    "immediate_delivery_flag" int,
    "pre_order_flag" int,
    "immediate_pre_order" varchar(25),
    "good_order_flag" int,
    "bad_order_flag" int,
    "good_bad" varchar(10),
    "order_status_description" varchar(50),
    "restaurant_district" varchar(10),
    "r_latitude" double,
    "r_longitude" double,
    "order_district" varchar(10),
    "o_latitude" double,
    "o_longitude" double,
    "restaurant_hold_hq" double,
    "restaurant_hold_sign" int,
    "restaurant_hold_count" int,
    "order_timeliness" double,
    "order_on_time" int,
    "order_timeliness_count" int,
    "delivery_time" double,
    "delivery_time_count" int,
    "customer_key" varchar(25),
    "order_datetime" DATETIME,
    "bad_order_subcategory" varchar(255),
    "received_to_accepted" double,
    "received_to_accepted_count" int,
    "order_datetime_exact" DATETIME,
    "commentary" varchar(1023),
    "kitchen_delay" double,
    "kitchen_delay_pos" int,
    "kitchen_delay_count" int,
    "missing_items_flag" int,
    "missing_items_count" int,
    "order_pool_name" varchar(100),
    "driver_accepted_time" double,
    PRIMARY KEY ("order_id")
)
PARTITION BY HASH (8) KEY ("order_id");


/*
Table "All_Usernames" guid = 50fcf7ed-b24b-403d-b88c-a43e5a9c8487
Column "username" guid = 54a39539-72a3-4ed9-8e60-3d2719db9bf2 compression DISABLED
Live Schema Version 5
 */
CREATE TABLE "brands"."All_Usernames" (
    "username" varchar(255)
);


/*
Table "reg" guid = 74ef0b2f-f2d9-49be-96cf-a6676cc73a6a
Column "username" guid = 72f4820c-340a-43df-b272-3103ffbd302f compression AUTO
Column "reg" guid = 43367bd4-8474-4b34-84de-3faa51d0cd49 compression AUTO
 */
CREATE TABLE "brands"."reg" (
    "username" varchar(255),
    "reg" varchar(255)
);


/*
Table "Permissions_RLS_ws" guid = e5a5cb3c-3196-4659-9fe2-e9e0c947c142
Column "country" guid = 2025bc64-9cf4-4912-8253-a3874a3bb729 compression DISABLED
Column "username" guid = a085f111-1605-480e-bf2a-26d5c08a8a16 compression DISABLED
Column "restaurant_id" guid = 8871cd81-6737-4b06-b8bd-f92c0af1f0d8 compression DISABLED
Column "count" guid = 305dec3f-6292-47b9-be49-db14fdf107e1 compression DISABLED
Column "group_sync" guid = ff5c13f1-ecd0-4392-b136-37e6890e6936 compression DISABLED
Live Schema Version 1
 */
CREATE TABLE "brands"."Permissions_RLS_ws" (
    "country" varchar(255),
    "username" varchar(255),
    "restaurant_id" bigint,
    "count" bigint,
    "group_sync" varchar(255),
    PRIMARY KEY ("country", "username", "restaurant_id")
);


/*
Table "Permissions_Errors" guid = d6a44f81-a2f5-4527-9ba6-47bb2707adc2
Column "username" guid = 588d1292-4540-4620-be0c-beea0cd67355 compression AUTO
Column "email" guid = 10b4bef7-c598-429b-9c12-61ea3d95ab0d compression AUTO
Column "country" guid = 0769afcf-ecfe-4411-ac3a-e560c2c0333e compression AUTO
Column "brand_name" guid = 919cd1b1-aa5e-4ef9-a25d-57aac66d3c29 compression AUTO
Column "access_level_type" guid = a27c678e-7024-4dae-9d54-88132b9986fa compression AUTO
Column "access_definition" guid = beb209ed-5fa8-48ac-abb7-b296216229f5 compression AUTO
Column "detail_1" guid = 1fc87fb3-87af-4721-91f8-47dd100e491b compression AUTO
Column "assert_name" guid = eeca7276-91ad-4dd8-b9bc-36c58dea47da compression AUTO
Column "stage" guid = 9a7bf59a-5086-49d2-9e55-5d6e82a7d919 compression AUTO
 */
CREATE TABLE "brands"."Permissions_Errors" (
    "username" varchar(255),
    "email" varchar(255),
    "country" varchar(55),
    "brand_name" varchar(55),
    "access_level_type" varchar(255),
    "access_definition" varchar(255),
    "detail_1" varchar(255),
    "assert_name" varchar(255),
    "stage" varchar(255)
);

