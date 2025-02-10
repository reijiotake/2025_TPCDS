

-TPC-DSデータセットをADLSに保存する場合のテンプレート-

---------------------------Template------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

  
COPY INTO @my_ext_unload_stage<任意の数字> from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.<テーブル名>
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;


-1つのテーブルを分割でADLSに保存したいとき(store_salesの場合)-

  ---------------------------分割Template1------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/1/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

  
COPY INTO @my_ext_unload_stage<任意の数字> from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.store_sales
where  SS_SOLD_DATE_SK < 2450966
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;

---------------------------2------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/2/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

  
COPY INTO @my_ext_unload_stage2 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2450966 and SS_SOLD_DATE_SK < 2451176
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------3------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/3/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

  
COPY INTO @my_ext_unload_stage3 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2451176 and SS_SOLD_DATE_SK < 2451386
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------4------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/4/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

  
COPY INTO @my_ext_unload_stage4 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2451386 and SS_SOLD_DATE_SK < 2451596
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------5------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/5/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

 
  
COPY INTO @my_ext_unload_stage5 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2451596 and SS_SOLD_DATE_SK < 2451806
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------6------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/6/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage6 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2451806 and SS_SOLD_DATE_SK < 2452016
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------7------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/7/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

 
  
COPY INTO @my_ext_unload_stage7 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2452016 and SS_SOLD_DATE_SK <  2452226
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------8------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/8/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

 
  
COPY INTO @my_ext_unload_stage8 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2452226 and SS_SOLD_DATE_SK <  2452436
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------9------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/9/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;

 
  
COPY INTO @my_ext_unload_stage9 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK >= 2452436 
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
 
 
---------------------------10------------------------------
CREATE OR REPLACE STAGE my_ext_unload_stage<任意の数字>
  URL='azure://<ストレージ名>.blob.core.windows.net/<フォルダ名>/10/<作りたいテーブル名（新規でフォルダが作成される）>'
  CREDENTIALS=(AZURE_SAS_TOKEN=' <your token> '
   ;
 
  
COPY INTO @my_ext_unload_stage10 from (
select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.STORE_SALES
where  SS_SOLD_DATE_SK is null
)
file_format = (type=parquet)
MAX_FILE_SIZE = 1073741824
;
