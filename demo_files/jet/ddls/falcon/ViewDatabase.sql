/*
Database "ViewDatabase" guid = f4ad2049-7192-47f5-a6ec-b592e2cf45eb
 */
CREATE DATABASE "ViewDatabase";

USE "ViewDatabase";


/*
Schema "ViewSchema" guid = a0c74a18-8390-41f5-a4ae-2f0f22bd0b0d
 */
CREATE SCHEMA "ViewSchema";


/*
Table "Restaurant Count_0f4e2e9d-8810-4fbe-9bc7-7daa5ce4d6de" guid = e85a75bf-8e96-4b7b-a0a9-35b1563788f5
Column "restaurant_id" guid = b54d31f5-a673-4726-afcb-84be9540484d
Column "country" guid = f12e85df-3852-4e9f-8fbf-5445d1ebc946
Column "Day(Order Date)" guid = 7424e21d-c776-4ed5-86f3-56c8e18ca982
Column "Restaurant Count" guid = 6534352d-2045-4f14-88aa-139f34077eca
 */
CREATE TABLE "ViewSchema"."Restaurant Count_0f4e2e9d-8810-4fbe-9bc7-7daa5ce4d6de" ("restaurant_id" bigint, "country" varchar(0), "Day(Order Date)" date, "Restaurant Count" bigint, PRIMARY KEY ("restaurant_id", "country")
);
