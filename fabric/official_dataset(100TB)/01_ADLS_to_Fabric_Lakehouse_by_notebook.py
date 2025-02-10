# 新規レイクハウスを作成、ショートカットでTCP-DSデータが格納されているADLSにショートカットを作成する
# 新規ノートブック作成後、レイクハウスをアタッチする。

## 一括取り込みの場合
spark.conf.set("spark.sql.delta.optimizeWrite.enabled", "true")
spark.conf.set("spark.sql.delta.autoCompact.enabled", "true")
spark.conf.set("spark.sql.autoCompact.maxFileSize", "536870912")


df = spark.read.parquet("Files/<file_name>/<Table_name>/*.parquet")
df.write.mode("overwrite").format("delta").save("Tables/Table_name")

## 分割取り込みの場合
spark.conf.set("spark.sql.delta.optimizeWrite.enabled", "true")
spark.conf.set("spark.sql.delta.autoCompact.enabled", "true")
spark.conf.set("spark.sql.autoCompact.maxFileSize", "536870912")

df = spark.read.parquet("Files/<file_name>/<Table_name>/*.parquet")
df.write.mode("overwrite").format("delta").save("Tables/Table_name")

df = spark.read.parquet("Files/tpcds-sf100tcl/<Table_name>/part-00*.parquet") 
df.write.mode("append").format("delta").save("Tables/store_sales")

df = spark.read.parquet("Files/tpcds-sf100tcl/<Table_name>/part-01~5*.parquet") 
df.write.mode("append").format("delta").save("Tables/store_sales")
