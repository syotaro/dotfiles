

# 条件に該当するテーブルを取得する

mysql -uroot -proot tales -N -B --execute="show tables from tales"

SHOW DATABASES                   	 MySQLサーバ内のデータベース(スキーマ)の一覧
SHOW TABLES                      	 データベース内のテーブルの一覧
SHOW COLUMNS FROM tbl_name       	 テーブルの列の一覧
SHOW INDEX FROM tbl_name         	 テーブルのインデックスの一覧
SHOW FUNCTION STATUS             	 ストアドファンクションの一覧
SHOW PROCEDURE STATUS            	 ストアドプロシージャの一覧
SHOW TRIGGERS                    	 トリガの一覧
SHOW EVENTS                      	 イベントの一覧
SHOW ENGINES                     	 ストレージエンジンの一覧
SHOW PLUGINS                     	 プラグインの一覧
SHOW VARIABLES                   	 現在の設定変数の一覧
SHOW STATUS                      	 現在のステータス変数の一覧
SHOW PROCESSLIST                 	 起動中のスレッドの一覧
SHOW TABLE STATUS                	 各テーブルのストレージエンジンや行数、平均行長など統計情報の一覧
SHOW CREATE DATABASE db_name     	 データベースのCREATE文を表示
SHOW CREATE TABLE tbl_name       	 テーブルのCREATE文を表示
SHOW CREATE VIEW view_name       	 ビューのCREATE文を表示
SHOW CREATE FUNCTION func_name   	 ストアドファンクションのCREATE文を表示
SHOW CREATE PROCEDURE proc_name  	 ストアドプロシージャのCREATE文を表示
SHOW CREATE TRIGGER trigger_name 	 トリガのCREATE文を表示
SHOW CREATE EVENT event_name     	 イベントのCREATE文を表示
SHOW CHARACTER SET               	 利用できる文字コードの情報を表示
SHOW COLLATION                   	 各文字コードで利用できる照合順序を表示
