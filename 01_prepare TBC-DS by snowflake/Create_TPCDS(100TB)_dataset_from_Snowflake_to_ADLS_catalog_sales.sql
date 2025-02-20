---------------------------1------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage31
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
  
COPY INTO @my_ext_unload_stage31 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK < 2451020 
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------2------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage32
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage32 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2451020 and CS_SOLD_DATE_SK < 2451225
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------3------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage33
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage33 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2451225 and CS_SOLD_DATE_SK < 2451430 
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;



---------------------------4------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage34
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

  
COPY INTO @my_ext_unload_stage34 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2451430 and CS_SOLD_DATE_SK <  2451635
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------5------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage35
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage35 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2451635 and CS_SOLD_DATE_SK <   2451840
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------6------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage36
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

  
COPY INTO @my_ext_unload_stage36 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2451840 and CS_SOLD_DATE_SK < 2452045  
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------7------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage37
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage37 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2452045 and CS_SOLD_DATE_SK < 2452250  
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------8------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage38
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
  
COPY INTO @my_ext_unload_stage38 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2452250 and CS_SOLD_DATE_SK < 2452455
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------9------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage39
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage39 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK >= 2452455
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;


---------------------------10------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage40
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>/<数字>/*parquet'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage40 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.catalog_sales
where  CS_SOLD_DATE_SK is null
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
