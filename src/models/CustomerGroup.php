<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "mg_customer_group".
 *
 * @property int $customer_group_id
 * @property string $customer_group_code Customer Group Code
 * @property int $tax_class_id Tax Class Id
 *
 * @property CatalogProductEntityTierPrice[] $mgCatalogProductEntityTierPrices
 */
class CustomerGroup extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mg_customer_group';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['customer_group_code'], 'required'],
            [['tax_class_id'], 'integer'],
            [['customer_group_code'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'customer_group_id' => 'Customer Group ID',
            'customer_group_code' => 'Customer Group Code',
            'tax_class_id' => 'Tax Class ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMgCatalogProductEntityTierPrices()
    {
        return $this->hasMany(CatalogProductEntityTierPrice::className(), ['customer_group_id' => 'customer_group_id']);
    }
}
