<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "eav_attribute_option_value".
 *
 * @property int $value_id Value ID
 * @property int $option_id Option ID
 * @property int $store_id Store ID
 * @property string $value Value
 */
class EavAttributeOptionValue extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'eav_attribute_option_value';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['option_id', 'store_id'], 'integer'],
            [['value'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'value_id' => 'Value ID',
            'option_id' => 'Option ID',
            'store_id' => 'Store ID',
            'value' => 'Value',
        ];
    }
}
