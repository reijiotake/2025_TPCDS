--以下を実行しレイクハウスのデルタテーブルをウェアハウスにコピー

create table dbo.Table_name
as select * from Lakehouse_name.dbo.Table_name
