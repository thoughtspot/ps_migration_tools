/*
Database "FalconUserDataDataBase" guid = b75244b2-b0ea-4dd8-bb92-4e67c5333069
 */
CREATE DATABASE "FalconUserDataDataBase";

USE "FalconUserDataDataBase";


/*
Schema "FalconUserDataSchema" guid = 1e4a4272-5443-4d8e-87eb-3c6ec4757ac0
 */
CREATE SCHEMA "FalconUserDataSchema";


/*
DIMENSION
Table "USERDATA-fbd8695d-6c2d-4b40-9987-f806baab291e" guid = 6be72c10-6510-437e-b741-a4d6d2f00fb8
Column "country" guid = 8e45e3a8-f643-4ab3-b7ea-97c06f69a42c
Column "order_id" guid = cd146b0f-d3b3-4038-9861-7004659ebd67
Column "order_date" guid = 386a7dd2-5ac1-4bf1-99ec-9fbf3435e556 parsing hint yyyy-MM-dd
Column "order_rated_flag" guid = c4f328cf-3b97-477d-a88b-3ff7b7683633
Column "rating" guid = 88188243-d399-4dfe-b583-9087c7b51d5f
Column "basket_value" guid = cd8e90ba-4fad-410a-a3a7-e16ebad06f5f
Column "chain" guid = 1fbbb24b-617b-4aa3-825e-3d34c9d8a380
Column "restaurant_id" guid = c2414e46-4705-4563-90dd-fe685e034795
Column "restaurant_name" guid = f476c11e-5b8a-4291-bdfe-e3f9fef0a067
Column "store_id" guid = 6ff533b9-be17-469f-bc54-676f6c7aef9a
Column "store_name" guid = c1336765-33c2-4a36-becc-805e798e9dd9
Column "rest_store_report_name" guid = 1fde8af9-526b-418d-8b60-0d6f019ed386
Column "store_group" guid = 1cb03636-904d-4ce8-a2d4-8763e62722e5
Column "franchise_manager" guid = 8655c284-deb1-4532-bc6c-75daf2db491a
Column "regional_manager" guid = 06c2133b-b5bc-4d8a-8d35-2e57b27b0b48
Column "store_manager" guid = 5cdbfbf9-049f-4d3d-b0b2-becf7b734a18
Column "RDS_flag" guid = b4d03a58-7085-40f2-883a-bd50f4473ec7
Column "delivery_flag" guid = dc37ca45-b6ff-42bf-9f4f-4891da0cf57b
Column "collection_flag" guid = 13fd38b5-beaa-41f2-85eb-141e9039ca9f
Column "delivery_collection" guid = 67871d98-4ee2-44cd-89ce-d53630370729
Column "immediate_delivery_flag" guid = dbc024f1-9bad-4d23-8066-ba8ca1f84937
Column "pre_order_flag" guid = 588c69ef-bd1f-4c79-93c0-3eb956914f0e
Column "immediate_pre_order" guid = b8a1b14a-70d9-4686-8160-e063b61d4c4d
Column "good_order_flag" guid = 5214c858-372d-4d02-b43b-74392398d186
Column "bad_order_flag" guid = a00cbb7d-4890-41ea-b117-1c1e5198cfae
Column "good_bad" guid = a1428264-a6d5-4486-a98c-89062eeff752
Column "order_status_description" guid = fc4ee8c9-2548-43fa-8568-2154d48caf44
Column "restaurant_district" guid = fe0f745e-a291-4223-bca3-076063e8dd8b
Column "r_latitude" guid = 7806c3cb-2e53-44ab-b320-dfc0a5b2bfff
Column "r_longitude" guid = b091d553-3806-4e0f-802b-2e70a836ffc4
Column "order_district" guid = 3be3bb89-7b74-453f-8e85-9e7e9712f44f
Column "o_latitude" guid = 1af1a932-7791-4576-bc58-a450a86dd5a6
Column "o_longitude" guid = d81398de-363a-4e16-a110-bd8c4cac196b
Column "restaurant_hold_hq" guid = cb33ecb3-6494-427f-8f0e-19409e3a50ef
Column "restaurant_hold_sign" guid = db9b10ec-d6ff-4c29-afb2-ad9d1dc50ff6
Column "restaurant_hold_count" guid = 79125a0c-ae1f-43c8-9cdd-b7cfd6ee3453
Column "order_timeliness" guid = 7ec637aa-a8d5-410c-9ed2-8a3243451be8
Column "order_on_time" guid = 238d40d1-1978-45d0-8bf7-986e6ff3d94f
Column "order_timeliness_count" guid = c11db5d6-db7c-4693-bd64-05efe42cea53
Column "delivery_time" guid = 041b0548-0522-4dd3-9cde-2fc2eec23605
Column "delivery_time_count" guid = 25b2654d-dc3c-4a9f-bf2c-42bb8d143dd3
Column "customer_key" guid = b6c4f552-0b02-47bf-8445-ba784da2da8d
 */
CREATE DIMENSION TABLE "FalconUserDataSchema"."USERDATA-fbd8695d-6c2d-4b40-9987-f806baab291e" ("country" varchar(0), "order_id" varchar(0), "order_date" date, "order_rated_flag" bigint, "rating" double, "basket_value" double, "chain" varchar(0), "restaurant_id" bigint, "restaurant_name" varchar(0), "store_id" bigint, "store_name" varchar(0), "rest_store_report_name" varchar(0), "store_group" varchar(0), "franchise_manager" varchar(0), "regional_manager" varchar(0), "store_manager" varchar(0), "RDS_flag" bigint, "delivery_flag" bigint, "collection_flag" bigint, "delivery_collection" varchar(0), "immediate_delivery_flag" bigint, "pre_order_flag" bigint, "immediate_pre_order" varchar(0), "good_order_flag" bigint, "bad_order_flag" bigint, "good_bad" varchar(0), "order_status_description" varchar(0), "restaurant_district" varchar(0), "r_latitude" double, "r_longitude" double, "order_district" varchar(0), "o_latitude" double, "o_longitude" double, "restaurant_hold_hq" bigint, "restaurant_hold_sign" bigint, "restaurant_hold_count" bigint, "order_timeliness" bigint, "order_on_time" varchar(0), "order_timeliness_count" bigint, "delivery_time" bigint, "delivery_time_count" bigint, "customer_key" varchar(0)
);


/*
DIMENSION
Table "USERDATA-6f0dc8be-ad1b-4867-94a8-80da1ebe6494" guid = 7b9584d0-a69e-4621-9273-447c550939f4
Column "date" guid = 679e4dd6-aa22-4672-801e-f7eaf8084373 parsing hint yyyy-MM-dd compression DISABLED
Column "weekday_name" guid = e5dcf19f-095b-439a-937d-9018a75407e8 compression DISABLED
Column "month_comm" guid = a073395f-8db7-4b79-8812-20e6393a87ff parsing hint yyyy-MM-dd compression DISABLED
 */
CREATE DIMENSION TABLE "FalconUserDataSchema"."USERDATA-6f0dc8be-ad1b-4867-94a8-80da1ebe6494" ("date" date, "weekday_name" varchar(0), "month_comm" date
);


/*
DIMENSION
Table "USERDATA-347e1d2f-f3ec-4d33-8104-e20b3d6d1647" guid = 98021cc6-2403-4f56-ab0c-7b4f577d2b32
Column "restaurant_id" guid = 033c9bc8-946a-4f91-ae43-6137013e5c2a compression DISABLED
Column "country" guid = 6abf186e-a9e0-4f7f-accc-388131e5c1e8 compression DISABLED
Column "chain" guid = 58fba58c-12ee-4e79-a47f-019b48cc9fb8 compression DISABLED
Column "restaurant_name" guid = 7d4c507c-1db9-4f4d-8d69-d2047c149fcf compression DISABLED
Column "store_id" guid = 8b4503b5-0437-4902-9b18-bcd60ce5fd8e compression DISABLED
Column "store_name" guid = 3f9c4e3f-aa8a-47c1-9490-1c96fc88827d compression DISABLED
Column "rest_store_report_name" guid = d6637b94-3cf0-4663-aadc-fe91ea5f41e1 compression DISABLED
Column "store_manager" guid = f7691e36-5ffc-4d0e-8827-0b903add2142 compression DISABLED
Column "franchise_manager" guid = 29ebd042-de52-4003-8adf-846c5d8df765 compression DISABLED
Column "regional_manager" guid = 7433789f-7c65-41d3-8065-a10513a29279 compression DISABLED
Column "store_group" guid = 807f7e58-19c5-4e88-9bd5-293db2eb22a8 compression DISABLED
Column "active_restaurant_flag" guid = aa58869f-4b8c-4277-b70d-03991f931b3d compression DISABLED
Column "restaurant_city" guid = 3f5352a9-1189-439e-aaba-5969b87a8ba6 compression DISABLED
Column "sales_region" guid = 4cc1021c-0aa5-4f87-a4d0-df232e889f08 compression DISABLED
Column "restaurant_key" guid = d7f257a6-10a5-4c6e-b785-84a4e46bb6b0 compression DISABLED
 */
CREATE DIMENSION TABLE "FalconUserDataSchema"."USERDATA-347e1d2f-f3ec-4d33-8104-e20b3d6d1647" ("restaurant_id" bigint, "country" varchar(0), "chain" varchar(0), "restaurant_name" varchar(0), "store_id" bigint, "store_name" varchar(0), "rest_store_report_name" varchar(0), "store_manager" varchar(0), "franchise_manager" varchar(0), "regional_manager" varchar(0), "store_group" varchar(0), "active_restaurant_flag" bigint, "restaurant_city" varchar(0), "sales_region" varchar(0), "restaurant_key" varchar(0)
);


/*
DIMENSION
Table "USERDATA-5633217f-9b2b-41de-ade3-9d9d77f2fb60" guid = 6cee8f70-84ec-4b75-ad82-13122d12df7b
Column "Store ID (Brand)" guid = 2a45e3eb-57f7-44c0-959c-b68c95db67f3 compression DISABLED
Column "Store Name (Brand)" guid = e05fb571-6bb4-4de6-bf76-2b7d6bb8101d compression DISABLED
Column "Store Manager" guid = c63808ac-cfe1-4a6c-807d-f55709c9cecb compression DISABLED
 */
CREATE DIMENSION TABLE "FalconUserDataSchema"."USERDATA-5633217f-9b2b-41de-ade3-9d9d77f2fb60" ("Store ID (Brand)" varchar(0), "Store Name (Brand)" varchar(0), "Store Manager" varchar(0)
);


/*
DIMENSION
Table "USERDATA-ea6b1152-114d-42c6-b0b9-6aefa7e5c78e" guid = f41ed5b3-fecf-49e1-842e-cf8f9b106408
Column "Timestamp
(America/Los_Angeles)" guid = cb7a084e-a2fb-4d9c-be9a-ccf2ffd67ed8 parsing hint MM/dd/yyyy hh:mm a compression DISABLED
Column "Score" guid = 2f216249-5f3f-4906-aafe-45746d16cedf compression DISABLED
Column "Comment" guid = 5b8e0f18-9fc7-4b1a-be6b-acdd9f29eff6 compression DISABLED
Column "Response Type" guid = 7b7d7f27-657d-4d52-b831-4f7c0ab7af64 compression DISABLED
Column "User GUID" guid = 99f6afee-3cc4-4097-99b2-553ab90180b5 compression DISABLED
Column "Cluster ID" guid = 3ac53eec-25cb-4714-a3e4-c4637674e903 compression DISABLED
 */
CREATE DIMENSION TABLE "FalconUserDataSchema"."USERDATA-ea6b1152-114d-42c6-b0b9-6aefa7e5c78e" ("TS" DATETIME, "Score" bigint, "Comment" varchar(0), "Response Type" varchar(0), "User GUID" varchar(0), "Cluster ID" varchar(0)
);


/*
DIMENSION
Table "USERDATA-0785c6f7-f848-417f-bbf5-5aacc2e0a0db" guid = eb7ff0fa-3cab-42fb-b0ed-b4e067f25d08
Column "Country" guid = 792eae30-9914-40f9-b386-28848a7d1cfa compression AUTO
Column "Chain" guid = 1e5c8c6b-df0c-49b2-97b6-b38e65618427 compression AUTO
Column "Restaurant Id" guid = b712b980-ed0c-4587-80be-c47acbbb7bbd compression AUTO
Column "Order Status" guid = 36709189-9baa-457b-9f15-57295f9d933d compression AUTO
Column "Order Date" guid = 03265082-a936-4ac9-b1eb-c1afe4ddd76b parsing hint dd/MM/yyyy compression AUTO
Column "Order Count" guid = 6bf80d2d-9fa3-4f8c-8ac8-5721e5e3b063 compression AUTO
Column "Total Order Value" guid = c3fe34d4-dcd5-472c-a4d6-d07aecce552a compression AUTO
 */
CREATE DIMENSION TABLE "FalconUserDataSchema"."USERDATA-0785c6f7-f848-417f-bbf5-5aacc2e0a0db" ("Country" varchar(0), "Chain" varchar(0), "Restaurant Id" int, "Order Status" varchar(0), "Order Date" date, "Order Count" int, "Total Order Value" double
);


/*
DIMENSION
Table "USERDATA-9a42f45a-6fe8-440a-aa41-d77bc143f9b2" guid = 76be66c3-72d3-4fa2-80f5-149850daa19a
Column "Country" guid = bd640ddf-5e21-4555-a491-c0f4238d9ec4 compression AUTO
Column "Chain" guid = f13b86ab-1482-4850-9329-e5992bde3410 compression AUTO
Column "Restaurant Id" guid = a7c256a4-5153-4a42-bae8-077ed9d754d1 compression AUTO
Column "Order Status" guid = 606b0523-0075-412d-b83c-860f0fedc304 compression AUTO
Column "Order Date" guid = 7ebb5d43-6500-4496-8871-0407324752a4 parsing hint dd/MM/yyyy compression AUTO
Column "Order Count" guid = 0d06755d-0a5a-4375-a860-cecc28a7fb00 compression AUTO
Column "Total Order Value" guid = 62547d3b-e45a-4e8f-be94-71c5272f4bc3 compression AUTO
 */
CREATE DIMENSION TABLE "FalconUserDataSchema"."USERDATA-9a42f45a-6fe8-440a-aa41-d77bc143f9b2" ("Country" varchar(0), "Chain" varchar(0), "Restaurant Id" bigint, "Order Status" varchar(0), "Order Date" date, "Order Count" bigint, "Total Order Value" double
);
