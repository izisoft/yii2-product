<?php

namespace izi\product\models;

use Yii;
use izi\models\Shops;
/**
 * This is the model class for table "catalog_product_entity".
 *
 * @property int $entity_id ID
 * @property int $attribute_set_id Attribute Set ID
 * @property string $type_id Type ID
 * @property string $type Type
 * @property string $sku Sku
 * @property int $has_options Has Options
 * @property int $required_options Required Options
 * @property string $created_at Creation Time
 * @property string $updated_at Update Time
 *
 * @property CatalogProductEntityDatetime[] $catalogProductEntityDatetimes
 * @property CatalogProductEntityDecimal[] $catalogProductEntityDecimals
 * @property CatalogProductEntityGallery[] $catalogProductEntityGalleries
 * @property CatalogProductEntityInt[] $catalogProductEntityInts
 * @property CatalogProductEntityText[] $catalogProductEntityTexts
 * @property CatalogProductEntityVarchar[] $catalogProductEntityVarchars
 */
class CatalogProductEntity extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'catalog_product_entity';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['attribute_set_id', 'has_options', 'required_options', 'sid'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['type_id', 'type'], 'string', 'max' => 32],
            [['sku'], 'string', 'max' => 64],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'entity_id' => 'Entity ID',
            'attribute_set_id' => 'Attribute Set ID',
            'type_id' => 'Type ID',
            'type' => 'Type',
            'sku' => 'Sku',
            'has_options' => 'Has Options',
            'required_options' => 'Required Options',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityDatetimes()
    {
        return $this->hasMany(CatalogProductEntityDatetime::className(), ['entity_id' => 'entity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityDecimals()
    {
        return $this->hasMany(CatalogProductEntityDecimal::className(), ['entity_id' => 'entity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityGalleries()
    {
        return $this->hasMany(CatalogProductEntityGallery::className(), ['entity_id' => 'entity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityInts()
    {
        return $this->hasMany(CatalogProductEntityInt::className(), ['entity_id' => 'entity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityTexts()
    {
        return $this->hasMany(CatalogProductEntityText::className(), ['entity_id' => 'entity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityVarchars()
    {
        return $this->hasMany(CatalogProductEntityVarchar::className(), ['entity_id' => 'entity_id']);
    }
    
    public function getS()
    {
        return $this->hasMany(Shops::className(), ['sid' => 'id']);
    }
}
