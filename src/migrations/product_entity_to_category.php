<?php 
namespace izi\product\migrations;
use yii\db\Migration;
use Yii;

class product_entity_to_category extends Migration
{
    public $tableName = 'product_entity_to_category';

    public function up()
    {
        
        $sql = file_get_contents(__DIR__ . "/sql/{$this->tableName}.sql");
        $this->execute($sql);
    }


    public function down()
    {
        $tableSchema = Yii::$app->db->schema->getTableSchema($this->tableName);

        if($tableSchema !== null){
            $this->dropTable($this->tableName);
        }
        
    }
}