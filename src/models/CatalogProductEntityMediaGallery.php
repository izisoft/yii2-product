<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "{{%mg_catalog_product_entity_media_gallery}}".
 *
 * @property int $value_id Value ID
 * @property int $attribute_id Attribute ID
 * @property string $value Value
 * @property string $media_type Media entry type
 * @property int $disabled Visibility status
 *
 * @property EavAttribute $attribute0
 * @property CatalogProductEntityMediaGalleryValue[] $mgCatalogProductEntityMediaGalleryValues
 * @property CatalogProductEntityMediaGalleryValueToEntity[] $mgCatalogProductEntityMediaGalleryValueToEntities
 * @property CatalogProductEntity[] $entities
 * @property CatalogProductEntityMediaGalleryValueVideo[] $mgCatalogProductEntityMediaGalleryValueVideos
 * @property Store[] $stores
 */
class CatalogProductEntityMediaGallery extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%mg_catalog_product_entity_media_gallery}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['attribute_id', 'disabled'], 'integer'],
            [['value'], 'string', 'max' => 255],
            [['media_type'], 'string', 'max' => 32],
            [['attribute_id'], 'exist', 'skipOnError' => true, 'targetClass' => EavAttribute::className(), 'targetAttribute' => ['attribute_id' => 'attribute_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'value_id' => 'Value ID',
            'attribute_id' => 'Attribute ID',
            'value' => 'Value',
            'media_type' => 'Media Type',
            'disabled' => 'Disabled',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAttribute0()
    {
        return $this->hasOne(EavAttribute::className(), ['attribute_id' => 'attribute_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMgCatalogProductEntityMediaGalleryValues()
    {
        return $this->hasMany(CatalogProductEntityMediaGalleryValue::className(), ['value_id' => 'value_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMgCatalogProductEntityMediaGalleryValueToEntities()
    {
        return $this->hasMany(CatalogProductEntityMediaGalleryValueToEntity::className(), ['value_id' => 'value_id']);
    }

    /**
     * @return \yii\db\ActiveQuery 
     */
    public function getEntities()
    {
        return $this->hasMany(CatalogProductEntity::className(), ['entity_id' => 'entity_id'])->viaTable('{{%mg_catalog_product_entity_media_gallery_value_to_entity}}', ['value_id' => 'value_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMgCatalogProductEntityMediaGalleryValueVideos()
    {
        return $this->hasMany(CatalogProductEntityMediaGalleryValueVideo::className(), ['value_id' => 'value_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStores()
    {
        return $this->hasMany(Store::className(), ['store_id' => 'store_id'])->viaTable('{{%mg_catalog_product_entity_media_gallery_value_video}}', ['value_id' => 'value_id']);
    }
}
