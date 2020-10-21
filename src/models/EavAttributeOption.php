<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "eav_attribute_option".
 *
 * @property int $option_id Option ID
 * @property int $attribute_id Attribute ID
 * @property int $sort_order Sort Order
 */
class EavAttributeOption extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'eav_attribute_option';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['attribute_id', 'sort_order'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'option_id' => 'Option ID',
            'attribute_id' => 'Attribute ID',
            'sort_order' => 'Sort Order',
        ];
    }
}
