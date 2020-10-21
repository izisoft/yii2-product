<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "eav_attribute_label".
 *
 * @property int $attribute_label_id Attribute Label ID
 * @property int $attribute_id Attribute ID
 * @property int $store_id Store ID
 * @property string $value Value
 */
class EavAttributeLabel extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'eav_attribute_label';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['attribute_id', 'store_id'], 'integer'],
            [['value'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'attribute_label_id' => 'Attribute Label ID',
            'attribute_id' => 'Attribute ID',
            'store_id' => 'Store ID',
            'value' => 'Value',
        ];
    }
}
