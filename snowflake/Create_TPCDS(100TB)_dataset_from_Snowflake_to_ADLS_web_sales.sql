---------------------------1------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage41
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/1/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage41 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.web_sales
where  WS_SOLD_DATE_SK < 2451186 
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------2------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage42
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/1/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage42 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.web_sales
where WS_SOLD_DATE_SK >= 2451186 and WS_SOLD_DATE_SK < 2451556
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------3------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage43
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/1/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage43 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.web_sales
where WS_SOLD_DATE_SK >= 2451556 and WS_SOLD_DATE_SK < 2451926
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------4------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage44
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/1/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage44 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.web_sales
where WS_SOLD_DATE_SK >= 2451926 and WS_SOLD_DATE_SK < 2452296
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------5------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage45
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/1/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage45 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.web_sales
where WS_SOLD_DATE_SK >= 2452296
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------6------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage46
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/1/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage46 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.web_sales
where WS_SOLD_DATE_SK is null
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;


