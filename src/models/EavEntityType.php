<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "eav_entity_type".
 *
 * @property int $entity_type_id Entity Type ID
 * @property string $entity_type_code Entity Type Code
 * @property string $entity_model Entity Model
 * @property string $attribute_model Attribute Model
 * @property string $entity_table Entity Table
 * @property string $value_table_prefix Value Table Prefix
 * @property string $entity_id_field Entity ID Field
 * @property int $is_data_sharing Defines Is Data Sharing
 * @property string $data_sharing_key Data Sharing Key
 * @property int $default_attribute_set_id Default Attribute Set ID
 * @property string $increment_model Increment Model
 * @property int $increment_per_store Increment Per Store
 * @property int $increment_pad_length Increment Pad Length
 * @property string $increment_pad_char Increment Pad Char
 * @property string $additional_attribute_table Additional Attribute Table
 * @property string $entity_attribute_collection Entity Attribute Collection
 *
 * @property EavAttribute[] $eavAttributes
 */
class EavEntityType extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'eav_entity_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['entity_type_code', 'entity_model'], 'required'],
            [['is_data_sharing', 'default_attribute_set_id', 'increment_per_store', 'increment_pad_length'], 'integer'],
            [['entity_type_code'], 'string', 'max' => 50],
            [['entity_model', 'attribute_model', 'entity_table', 'value_table_prefix', 'entity_id_field', 'increment_model', 'additional_attribute_table', 'entity_attribute_collection'], 'string', 'max' => 255],
            [['data_sharing_key'], 'string', 'max' => 100],
            [['increment_pad_char'], 'string', 'max' => 1],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'entity_type_id' => 'Entity Type ID',
            'entity_type_code' => 'Entity Type Code',
            'entity_model' => 'Entity Model',
            'attribute_model' => 'Attribute Model',
            'entity_table' => 'Entity Table',
            'value_table_prefix' => 'Value Table Prefix',
            'entity_id_field' => 'Entity Id Field',
            'is_data_sharing' => 'Is Data Sharing',
            'data_sharing_key' => 'Data Sharing Key',
            'default_attribute_set_id' => 'Default Attribute Set ID',
            'increment_model' => 'Increment Model',
            'increment_per_store' => 'Increment Per Store',
            'increment_pad_length' => 'Increment Pad Length',
            'increment_pad_char' => 'Increment Pad Char',
            'additional_attribute_table' => 'Additional Attribute Table',
            'entity_attribute_collection' => 'Entity Attribute Collection',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEavAttributes()
    {
        return $this->hasMany(EavAttribute::className(), ['entity_type_id' => 'entity_type_id']);
    }
}
