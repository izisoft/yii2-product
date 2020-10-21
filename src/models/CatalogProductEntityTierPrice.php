<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "mg_catalog_product_entity_tier_price".
 *
 * @property int $value_id Value ID
 * @property int $entity_id
 * @property int $all_groups Is Applicable To All Customer Groups
 * @property int $customer_group_id Customer Group ID
 * @property string $qty QTY
 * @property string $value Value
 * @property int $website_id Website ID
 * @property string $percentage_value Percentage value
 *
 * @property CustomerGroup $customerGroup
 * @property CatalogProductEntity $entity
 * @property StoreWebsite $website
 */
class CatalogProductEntityTierPrice extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mg_catalog_product_entity_tier_price';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['entity_id', 'all_groups', 'customer_group_id', 'website_id'], 'integer'],
            [['qty', 'value', 'percentage_value'], 'number'],
            [['website_id'], 'required'],
            [['entity_id', 'all_groups', 'customer_group_id', 'qty', 'website_id'], 'unique', 'targetAttribute' => ['entity_id', 'all_groups', 'customer_group_id', 'qty', 'website_id']],
            [['customer_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => CustomerGroup::className(), 'targetAttribute' => ['customer_group_id' => 'customer_group_id']],
            [['entity_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntity::className(), 'targetAttribute' => ['entity_id' => 'entity_id']],
            [['website_id'], 'exist', 'skipOnError' => true, 'targetClass' => StoreWebsite::className(), 'targetAttribute' => ['website_id' => 'website_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'value_id' => 'Value ID',
            'entity_id' => 'Entity ID',
            'all_groups' => 'All Groups',
            'customer_group_id' => 'Customer Group ID',
            'qty' => 'Qty',
            'value' => 'Value',
            'website_id' => 'Website ID',
            'percentage_value' => 'Percentage Value',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCustomerGroup()
    {
        return $this->hasOne(CustomerGroup::className(), ['customer_group_id' => 'customer_group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEntity()
    {
        return $this->hasOne(CatalogProductEntity::className(), ['entity_id' => 'entity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWebsite()
    {
        return $this->hasOne(StoreWebsite::className(), ['website_id' => 'website_id']);
    }
}
