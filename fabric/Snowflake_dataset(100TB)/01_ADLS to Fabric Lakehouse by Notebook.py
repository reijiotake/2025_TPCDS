# 新規レイクハウスを作成、ショートカットでTCP-DSデータが格納されているADLSにショートカットを作成する
# 新規ノートブック作成後、レイクハウスをアタッチする。

spark.conf.set("spark.sql.delta.optimizeWrite.enabled", "true")
spark.conf.set("spark.sql.delta.autoCompact.enabled", "true")
spark.conf.set("spark.sql.autoCompact.maxFileSize", "536870912")


df = spark.read.parquet("Files/tpcds-sf100tcl/<Table_name>/*.parquet")
df.write.mode("overwrite").format("delta").save("Tables/Table_name")
