%scala

// example for Store_sales

import com.databricks.spark.sql.perf.tpcds.TPCDSTables

// Set:
val scaleFactor = "100000" // scaleFactor defines the size of the dataset to generate (in GB).
val scaleFactoryInt = scaleFactor.toInt

val scaleName = if(scaleFactoryInt < 1000){
    f"${scaleFactoryInt}%03d" + "GB"
  } else {
    f"${scaleFactoryInt / 1000}%03d" + "TB"
  }

val fileFormat = "parquet" // valid spark file format like parquet, csv, json.
val tableName = "store_sales"
val rootDir = s"/mnt/datalake/raw/tpc-ds/source_files_${scaleName}_${fileFormat}/${tableName}"
val databaseName = "tpcds" + scaleName // name of database to create.

// Run:
val tables = new TPCDSTables(sqlContext,
    dsdgenDir = "/usr/local/bin/tpcds-kit/tools", // location of dsdgen 
    scaleFactor = scaleFactor,
    useDoubleForDecimal = false, // true to replace DecimalType with DoubleType 
    useStringForDate = false) // true to replace DateType with StringType

// Generate data
tables.genData(
    location = rootDir,
    format = fileFormat,
    overwrite = true, // overwrite the data that is already there
    partitionTables = false, // create the partitioned fact tables 
    clusterByPartitionColumns = false, // shuffle to get partitions coalesced into single files. 
    filterOutNullPartitionValues = false, // true to filter out the partition with NULL key value
    tableFilter = tableName, // "" means generate all tables
    numPartitions = 25000) // how many dsdgen partitions to run - number of input tasks.

