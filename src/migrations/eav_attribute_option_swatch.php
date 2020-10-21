<?php 
namespace izi\product\migrations;
use yii\db\Migration;
use Yii;

class eav_attribute_option_swatch extends Migration
{
    public $tableName = 'eav_attribute_option_swatch';

    public function up()
    {
        
        $sql = file_get_contents(__DIR__ . "/sql/{$this->tableName}.sql");
        $this->execute($sql);
    }


    public function down()
    {
        $tableSchema = Yii::$app->db->schema->getTableSchema($this->tableName);

        if($tableSchema !== null){

            preg_match('/dbname=([A-Za-z0-9_\-]+)/i', Yii::$app->db->dsn, $db);
            $dbName = $db[1];
            $sql = "SELECT
            TABLE_NAME,
            COLUMN_NAME,
            CONSTRAINT_NAME,
            REFERENCED_TABLE_NAME,
            REFERENCED_COLUMN_NAME
        FROM
            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
        WHERE
            REFERENCED_TABLE_SCHEMA = '$dbName'
            AND REFERENCED_TABLE_NAME = '{$this->tableName}';";

            $fks = Yii::$app->db->createCommand($sql)->queryAll();
            if(!empty($fks)){
                foreach($fks as $fk){
                    $this->dropForeignKey($fk['CONSTRAINT_NAME'], $fk['TABLE_NAME']);
                }
            }
             
            
            $this->dropTable($this->tableName);
        }
        
    }
}