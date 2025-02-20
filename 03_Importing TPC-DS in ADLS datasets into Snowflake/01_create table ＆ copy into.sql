-----------------------catalog_page---------------------------------

----create empty tabale
CREATE TABLE catalog_page (
cp_catalog_page_sk INT,
cp_catalog_page_id CHAR(16),
cp_start_date_sk INT,
cp_end_date_sk INT,
cp_department VARCHAR(50),
cp_catalog_number INT,
cp_catalog_page_number INT,
cp_description VARCHAR(100),
cp_type VARCHAR(100)
);


--一回ステージを挟む--
CREATE STAGE catalog_page_stage3
  URL='azure://adlsfabricperfomance.blob.core.windows.net/datalake/tpcds-official-1tb-nopartition/tpc-ds/source_files_001TB_parquet/catalog_page/'
  CREDENTIALS=(AZURE_SAS_TOKEN='sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2025-03-31T10:22:56Z&st=2025-01-08T02:22:56Z&spr=https&sig=6bnGsvkJn44SKkZnkq3k%2BV4TfFuvgFrWzg9QZ1kZTWE%3D')
  FILE_FORMAT = ( TYPE = PARQUET)

LIST @catalog_page_stage3
  
--ステージから自分のテーブルに書き込める---
COPY INTO catalog_page
  FROM @catalog_page_stage3
  PATTERN='.*\.parquet'
   MATCH_BY_COLUMN_NAME = 'CASE_INSENSITIVE';
