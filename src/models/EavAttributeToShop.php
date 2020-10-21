<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "eav_attribute_to_shop".
 *
 * @property int $sid
 * @property int $attribute_id
 */
class EavAttributeToShop extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'eav_attribute_to_shop';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sid', 'attribute_id'], 'required'],
            [['sid', 'attribute_id'], 'integer'],
            [['sid', 'attribute_id'], 'unique', 'targetAttribute' => ['sid', 'attribute_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'sid' => 'Sid',
            'attribute_id' => 'Attribute ID',
        ];
    }
}
