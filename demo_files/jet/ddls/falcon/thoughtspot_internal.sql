/*
Database "thoughtspot_internal" guid = de77e93b-9a80-4634-9f33-863e3033a12b
 */
CREATE DATABASE "thoughtspot_internal";

USE "thoughtspot_internal";


/*
Schema "falcon_default_schema" guid = c0d32ec1-1fc9-480d-a12c-535011ee6b0f
 */
CREATE SCHEMA "falcon_default_schema";


/*
DIMENSION
Table "calendar" guid = 290a2ac6-108b-454b-b666-004a7415c5cd
Column "date" guid = db4d7f3d-e16b-4210-b607-1e5c7576ce54
Column "day_of_week" guid = 3128bb77-2176-4e8e-a624-5647889e75e0
Column "month" guid = 20bc76c9-68aa-46e7-a44d-b3a5b92cad54
Column "quarter" guid = 64927f16-d96b-436e-b4d1-91f748023396
Column "year" guid = 09d18bac-f0b5-452e-aba6-d45b018ba537
Column "day_number_of_week" guid = 5aff2ab4-faa9-4d97-9de6-679afa5f377c
Column "week_number_of_month" guid = d18f0830-e7b9-4612-a217-aa4d4de4d75f
Column "week_number_of_quarter" guid = a2eb4957-2c01-43ba-bb54-e122f243ad08
Column "week_number_of_year" guid = c071ffad-104b-4a40-9381-20ad5deca77b
Column "is_weekend" guid = 414b5add-80cd-43d4-89d1-60ccf304cc08
Column "monthly" guid = 48f409b8-b169-48b7-ba08-0300e9f5eb11
Column "quarterly" guid = 962f85a3-6308-4afe-b0d4-9ee19934b564
Column "day_number_of_month" guid = 35a97c34-2890-4bdc-9b88-c615c883dd5a
Column "day_number_of_quarter" guid = 5fd70db5-06df-449a-a8d5-4aef28f60e92
Column "day_number_of_year" guid = f86a38f3-e5c4-4292-bbb9-c806900289f1
Column "month_number_of_quarter" guid = 75717f35-866f-4d68-983b-d4840001dd52
Column "month_number_of_year" guid = 1deae52f-9699-4755-ac18-9cda46d1f7db
Column "quarter_number_of_year" guid = 042f86e4-2a08-4c0b-9ca2-a9866dfced7c
Column "absolute_week_number" guid = 59d32f98-86e1-40b2-9490-76e6b4d43c26
Column "start_of_week_epoch" guid = 7bc98cc9-3e40-4af7-899d-698370ff40e8
Column "end_of_week_epoch" guid = e662f4fd-8d37-42f5-acb8-75e2c455ad99
Column "absolute_month_number" guid = 9b7fafce-055a-48e7-a451-7620bc9c16a3
Column "start_of_month_epoch" guid = 15eb5049-17bb-4c58-b22a-de60693ee2ed
Column "end_of_month_epoch" guid = 0adc99bf-033d-401f-b7d4-5c7c0a4825fc
Column "absolute_quarter_number" guid = f7b69d53-beab-4917-949d-dea92fa2c3ad
Column "start_of_quarter_epoch" guid = 5cdcb65c-afd7-4fd8-bbcf-714bbe4a0bda
Column "end_of_quarter_epoch" guid = 92e0d045-d1a9-4de1-a8b5-561c9822bd10
Column "absolute_year_number" guid = 63edbfdd-3ca6-418a-8dec-aa3631aa423c
Column "start_of_year_epoch" guid = 71e2ab8d-a65c-4a2f-969a-8f8d0474d109
Column "end_of_year_epoch" guid = 9f4af543-3288-465a-b568-636555114cb8
 */
CREATE DIMENSION TABLE "falcon_default_schema"."calendar" (
    "date" date,
    "day_of_week" varchar(0),
    "month" varchar(0),
    "quarter" varchar(0),
    "year" varchar(0),
    "day_number_of_week" bigint,
    "week_number_of_month" bigint,
    "week_number_of_quarter" bigint,
    "week_number_of_year" bigint,
    "is_weekend" bool,
    "monthly" varchar(0),
    "quarterly" varchar(0),
    "day_number_of_month" bigint,
    "day_number_of_quarter" bigint,
    "day_number_of_year" bigint,
    "month_number_of_quarter" bigint,
    "month_number_of_year" bigint,
    "quarter_number_of_year" bigint,
    "absolute_week_number" bigint,
    "start_of_week_epoch" date,
    "end_of_week_epoch" date,
    "absolute_month_number" bigint,
    "start_of_month_epoch" date,
    "end_of_month_epoch" date,
    "absolute_quarter_number" bigint,
    "start_of_quarter_epoch" date,
    "end_of_quarter_epoch" date,
    "absolute_year_number" bigint,
    "start_of_year_epoch" date,
    "end_of_year_epoch" date,
    PRIMARY KEY ("date")
);


/*
DIMENSION
Table "fiscal" guid = c5078f7f-a6b2-4507-8379-5e3663405b32
Column "date" guid = c4a47910-cc48-44cd-bc97-52fb08ff8675
Column "day_of_week" guid = a3ee069a-2c33-4476-93e0-de8e2b79f0da
Column "month" guid = 5ffc7858-b538-4d97-86ba-c386f549dcbe
Column "quarter" guid = 6620c0e7-3975-4041-9c77-3cb48c5799ee
Column "year" guid = 34534350-9f76-4754-aa55-bfc0c4e9ad18
Column "day_number_of_week" guid = 7209fafe-518b-427f-a607-9f0a0b513a97
Column "week_number_of_month" guid = 76215241-7e67-4f95-a310-01aaeed80f62
Column "week_number_of_quarter" guid = 54b45897-034a-42a5-9cea-4f01679e739c
Column "week_number_of_year" guid = f03d097b-bb11-421e-a567-92d4f3f9d01f
Column "is_weekend" guid = f93b126f-fb24-4538-9d2a-1d790692fd73
Column "monthly" guid = e99ecb94-45bb-4311-b71c-fc3c4ae57658
Column "quarterly" guid = 99ea9f82-1db9-492b-84be-b96f3cb98709
Column "day_number_of_month" guid = 5f9f68ad-807f-404f-803d-bcad59978bd0
Column "day_number_of_quarter" guid = 32c23fab-6754-467b-912a-6bfaec8aff67
Column "day_number_of_year" guid = 649674ae-8364-48dc-a60c-d9a5bef8397e
Column "month_number_of_quarter" guid = a805646a-7065-46ac-bf61-2ae704dc496e
Column "month_number_of_year" guid = 9ce44ed8-8008-428b-b59c-82e7a1bbbc7f
Column "quarter_number_of_year" guid = 22111f76-69a1-4b33-8b6e-cdc71fe5fd53
Column "absolute_week_number" guid = 0ea925f4-d11f-4ef9-bd52-38e0d459a674
Column "start_of_week_epoch" guid = d055f56b-568e-4fcd-9966-c9fb798cf14a
Column "end_of_week_epoch" guid = 0ecc0666-cf79-4ffb-8350-a294f3de1762
Column "absolute_month_number" guid = 5c51631c-d4e6-4874-8c3c-815046eba64b
Column "start_of_month_epoch" guid = ffeb9c71-ad7d-428f-b159-444539a67d8b
Column "end_of_month_epoch" guid = 4dc66216-99ef-48e7-b5dd-021103113766
Column "absolute_quarter_number" guid = 8ea143c9-ef79-4a49-b514-4d1b21fb009f
Column "start_of_quarter_epoch" guid = 8818fa5e-2603-4d1a-84c8-f213458a51a4
Column "end_of_quarter_epoch" guid = 79550f10-bc1e-46c6-b0eb-5f031ac74585
Column "absolute_year_number" guid = c24207dc-783e-44f7-b57e-deacb9061ebc
Column "start_of_year_epoch" guid = a89da6e1-ac9a-4176-972f-c920811af050
Column "end_of_year_epoch" guid = d6a789bd-bd68-47cb-8909-6e1a6ed6d742
 */
CREATE DIMENSION TABLE "falcon_default_schema"."fiscal" (
    "date" date,
    "day_of_week" varchar(0),
    "month" varchar(0),
    "quarter" varchar(0),
    "year" varchar(0),
    "day_number_of_week" bigint,
    "week_number_of_month" bigint,
    "week_number_of_quarter" bigint,
    "week_number_of_year" bigint,
    "is_weekend" bool,
    "monthly" varchar(0),
    "quarterly" varchar(0),
    "day_number_of_month" bigint,
    "day_number_of_quarter" bigint,
    "day_number_of_year" bigint,
    "month_number_of_quarter" bigint,
    "month_number_of_year" bigint,
    "quarter_number_of_year" bigint,
    "absolute_week_number" bigint,
    "start_of_week_epoch" date,
    "end_of_week_epoch" date,
    "absolute_month_number" bigint,
    "start_of_month_epoch" date,
    "end_of_month_epoch" date,
    "absolute_quarter_number" bigint,
    "start_of_quarter_epoch" date,
    "end_of_quarter_epoch" date,
    "absolute_year_number" bigint,
    "start_of_year_epoch" date,
    "end_of_year_epoch" date,
    PRIMARY KEY ("date")
);
