from cli._ux import output_message
# import sqlparse
import sqlglot


class DDL:

    def __init__(self, ddl_file):
        self._ddl_file = ddl_file
        output_message(f"Importing DDL from file {self._ddl_file}", "info")
        self.parse()

    def parse(self):
        sql = "CREATE TABLE T1 (V1 VARCHAR(100));"
        fail1 = 'CREATE DATABASE "justeat"'
        sql = 'USE "justeat"'
        sql = '''
/* some comments
here */
CREATE TABLE "brands"."Orders" (
    "country" varchar(25),
    "test" NUMBER (18, 3),
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
    PRIMARY KEY ("order_id","other_key")
);
--PARTITION BY HASH (32) KEY ("order_id");
        '''

        with open(self._ddl_file, 'r') as file:
            sql = file.read()  # .replace('\n', '')

        result = sqlglot.transpile(sql, read="postgres", write="bigquery")[0]
        print(result)

# OLD sqlparse stuff
    # def get_table_name(self, tokens):
    #     for token in reversed(tokens):
    #         if token.ttype is None:
    #             return token.value
    #     return " "

    # def parse2(self):
    #     sql = 'select * from foo; select * from bar;'
    #     elements = sqlparse.split(sql)
    #     print(elements)

    #     sql = 'select * from foo where id in (select id from bar);'
    #     print(sqlparse.format(sql, reindent=True, keyword_case='upper'))

    #     sql = 'select * from "someschema"."mytable" where id = 1'
    #     sql = 'CREATE TABLE "brands"."Justeat_Dates" ("order_date" date, PRIMARY KEY("order_date"))'
    #     parsed = sqlparse.parse(sql)
    #     print(parsed)
    #     stmt = parsed[0]  # grab the Statement object
    #     print(stmt.tokens)

    #     print(stmt)
    #     for t in stmt.tokens:
    #         print(t)

    #     # print(parsed.TokenList)

    # def extract_definitions(self, token_list):
    #     # assumes that token_list is a parenthesis
    #     definitions = []
    #     tmp = []
    #     par_level = 0
    #     for token in token_list.flatten():
    #         if token.is_whitespace:
    #             continue
    #         elif token.match(sqlparse.tokens.Punctuation, '('):
    #             par_level += 1
    #             continue
    #         if token.match(sqlparse.tokens.Punctuation, ')'):
    #             if par_level == 0:
    #                 break
    #             else:
    #                 par_level += 1
    #         elif token.match(sqlparse.tokens.Punctuation, ','):
    #             if tmp:
    #                 definitions.append(tmp)
    #             tmp = []
    #         else:
    #             tmp.append(token)
    #     if tmp:
    #         definitions.append(tmp)
    #     return definitions

    # def parse(self):

    #     line = '''
    #     CREATE TABLE public.actor (
    #         actor_id integer DEFAULT nextval('public.actor_actor_id_seq'::regclass) NOT NULL,
    #         first_name character varying(45) NOT NULL,
    #         last_name character varying(45) NOT NULL,
    #         last_update timestamp without time zone DEFAULT now() NOT NULL
    #     );

    #     CREATE TABLE public.category (
    #         category_id integer DEFAULT nextval('public.category_category_id_seq'::regclass) NOT NULL,
    #         name character varying(25) NOT NULL,
    #         last_update timestamp without time zone DEFAULT now() NOT NULL
    #     );

    #     CREATE TABLE IF NOT EXISTS "sample_schema"."sample_table"
    #     (
    #         "div_cd" VARCHAR(2) NOT NULL
    #         ,"div_name" VARCHAR(30) NOT NULL
    #         ,"org_cd" VARCHAR(8) NOT NULL
    #         ,"org_name" VARCHAR(60) NOT NULL
    #         ,"team_cd" VARCHAR(2) NOT NULL
    #         ,"team_name" VARCHAR(120) NOT NULL
    #         ,"personal_cd" VARCHAR(7) NOT NULL
    #         ,"personal_name" VARCHAR(300) NOT NULL
    #         ,"username" VARCHAR(6) NOT NULL
    #         ,"staff_flg" CHAR(1)  DEFAULT '0'::bpchar ENCODE lzo
    #         ,"leader_flg" CHAR(1)  DEFAULT '0'::bpchar ENCODE lzo
    #     )
    #     DISTSTYLE EVEN
    #     ;

    #     CREATE TABLE IF NOT EXISTS "sample_schema"."ref_table"
    #     (
    #         "staff_flg" CHAR(1)  DEFAULT '0'::bpchar SORTKEY ENCODE lzo
    #         ,"leader_flg" CHAR(1)  DEFAULT '0'::bpchar ENCODE lzo
    #     )
    #     DISTSTYLE EVEN
    #     ;
    #     '''
    #     with open(self._ddl_file, 'r') as file:
    #         line = file.read()  # .replace('\n', '')

    #     sql_statements = sqlparse.split(line)
    #     print(f"{len(sql_statements)} statements found.")
    #     for sql_statement in sql_statements:
    #         clean_statement = sqlparse.format(sql_statement, strip_comments=True).strip()

    #         print(clean_statement)
    #         print("-------------\n\n")
    #         parsed = sqlparse.parse(clean_statement)
    #         for stmt in parsed:
    #             print("TYPE:" + stmt.get_type())
    #             tokens = [t for t in sqlparse.sql.TokenList(stmt.tokens) if t.ttype != sqlparse.tokens.Whitespace]
    #             print("TOKENS:")
    #             print(tokens)

    #             # extract the parenthesis which holds column definitions
    #             _, par = parsed[0].token_next_by(i=sqlparse.sql.Parenthesis)
    #             columns = self.extract_definitions(par)

    #             for column in columns:
    #                 print(f"column: {column[0]}")
    #                 print(f"data type: {' '.join(str(t) for t in column[1:])}")

    #             # is_create_stmt = False
    #             # for i, token in enumerate(tokens):
    #             #     # Is it a create statements ?
    #             #     if token.match(sqlparse.tokens.DDL, 'CREATE'):
    #             #         is_create_stmt = True
    #             #         continue

    #             #     # If it was a create statement and the current token starts with "("
    #             #     if is_create_stmt and token.value.startswith("("):
    #             #         # Get the table name by looking at the tokens in reverse order till you find
    #             #         # a token with None type
    #             #         print(f"table: {self.get_table_name(tokens[:i])}")

    #             #         # Now parse the columns
    #             #         txt = token.value
    #             #         print("text:")
    #             #         print(txt)
    #             #         columns = txt[1:txt.rfind(")")].replace("\n", "").split(",")
    #             #         print("columns:")
    #             #         print(columns)
    #             #         print(...)
    #             #         for column in columns:
    #             #             c = ' '.join(column.split()).split()
    #             #             print(c)
    #             #             if c[0] == 'PRIMARY' and c[1] == 'KEY':
    #             #                 print("primary key")
    #             #             else:
    #             #                 c_name = c[0].replace('\"', "")
    #             #                 c_type = c[1]  # For condensed type information
    #             #                 # OR
    #             #                 c_type = " ".join(c[1:])  # For detailed type information
    #             #                 print(f"column: {c_name}")
    #             #                 print(f"data type: {c_type}")
    #             #         print("---" * 20)
    #             #         break
    #             #     # else:
    #             #     #     print("NOPE")
    #             #     #     # print(token)

    #         input("Press Enter to continue...")

    #     # # print(line)
    #     # parse = sqlparse.parse(line)
    #     # for stmt in parse:
    #     #     print("PARSE:" + str(stmt))
    #     #     print("TYPE:" + stmt.get_type())
    #     #     # Get all the tokens except whitespaces
    #     #     tokens = [t for t in sqlparse.sql.TokenList(stmt.tokens) if t.ttype != sqlparse.tokens.Whitespace]
    #     #     is_create_stmt = False
    #     #     for i, token in enumerate(tokens):
    #     #         # Is it a create statements ?
    #     #         if token.match(sqlparse.tokens.DDL, 'CREATE'):
    #     #             is_create_stmt = True
    #     #             continue

    #     #         # If it was a create statement and the current token starts with "("
    #     #         if is_create_stmt and token.value.startswith("("):
    #     #             # Get the table name by looking at the tokens in reverse order till you find
    #     #             # a token with None type
    #     #             print(f"table: {self.get_table_name(tokens[:i])}")

    #     #             # # Now parse the columns
    #     #             # txt = token.value
    #     #             # columns = txt[1:txt.rfind(")")].replace("\n", "").split(",")
    #     #             # for column in columns:
    #     #             #     c = ' '.join(column.split()).split()
    #     #             #     c_name = c[0].replace('\"', "")
    #     #             #     c_type = c[1]  # For condensed type information
    #     #             #     # OR
    #     #             #     # c_type = " ".join(c[1:]) # For detailed type information
    #     #             #     print(f"column: {c_name}")
    #     #             #     print(f"date type: {c_type}")
    #     #             # print("---" * 20)
    #     #             break
    #     #         else:
    #     #             print("NOPE")
    #     #             # print(token)
