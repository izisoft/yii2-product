<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "catalog_product_website".
 *
 * @property int $product_id Product ID
 * @property int $website_id Website ID
 */
class CatalogProductWebsite extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'catalog_product_website';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_id', 'website_id'], 'required'],
            [['product_id', 'website_id'], 'integer'],
            [['product_id', 'website_id'], 'unique', 'targetAttribute' => ['product_id', 'website_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'product_id' => 'Product ID',
            'website_id' => 'Website ID',
        ];
    }
}
