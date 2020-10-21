<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "mg_catalog_product_entity_media_gallery_value_video".
 *
 * @property int $value_id Media Entity ID
 * @property int $store_id Store ID
 * @property string $provider Video provider ID
 * @property string $url Video URL
 * @property string $title Title
 * @property string $description Page Meta Description
 * @property string $metadata Video meta data
 *
 * @property MgCatalogProductEntityMediaGallery $value
 * @property MgStore $store
 */
class CatalogProductEntityMediaGalleryValueVideo extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mg_catalog_product_entity_media_gallery_value_video';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['value_id', 'store_id'], 'required'],
            [['value_id', 'store_id'], 'integer'],
            [['url', 'description', 'metadata'], 'string'],
            [['provider'], 'string', 'max' => 32],
            [['title'], 'string', 'max' => 255],
            [['value_id', 'store_id'], 'unique', 'targetAttribute' => ['value_id', 'store_id']],
            [['value_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntityMediaGallery::className(), 'targetAttribute' => ['value_id' => 'value_id']],
            [['store_id'], 'exist', 'skipOnError' => true, 'targetClass' => Store::className(), 'targetAttribute' => ['store_id' => 'store_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'value_id' => 'Value ID',
            'store_id' => 'Store ID',
            'provider' => 'Provider',
            'url' => 'Url',
            'title' => 'Title',
            'description' => 'Description',
            'metadata' => 'Metadata',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getValue()
    {
        return $this->hasOne(CatalogProductEntityMediaGallery::className(), ['value_id' => 'value_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStore()
    {
        return $this->hasOne(Store::className(), ['store_id' => 'store_id']);
    }
}
