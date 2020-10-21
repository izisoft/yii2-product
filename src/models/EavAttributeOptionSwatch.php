<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "eav_attribute_option_swatch".
 *
 * @property int $swatch_id Swatch ID
 * @property int $option_id Option ID
 * @property int $store_id Store ID
 * @property int $type Swatch type: 0 - text, 1 - visual color, 2 - visual image
 * @property string $value Swatch Value
 */
class EavAttributeOptionSwatch extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'eav_attribute_option_swatch';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['option_id', 'store_id', 'type'], 'required'],
            [['option_id', 'store_id', 'type'], 'integer'],
            [['value'], 'string', 'max' => 255],
            [['store_id', 'option_id'], 'unique', 'targetAttribute' => ['store_id', 'option_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'swatch_id' => 'Swatch ID',
            'option_id' => 'Option ID',
            'store_id' => 'Store ID',
            'type' => 'Type',
            'value' => 'Value',
        ];
    }
}
