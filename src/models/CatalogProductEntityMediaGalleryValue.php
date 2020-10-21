<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "mg_catalog_product_entity_media_gallery_value".
 *
 * @property int $value_id Value ID
 * @property int $store_id Store ID
 * @property int $entity_id
 * @property string $label Label
 * @property int $position Position
 * @property int $disabled Is Disabled
 * @property int $record_id Record Id
 *
 * @property CatalogProductEntityMediaGallery $value
 * @property CatalogProductEntity $entity
 * @property Store $store
 */
class CatalogProductEntityMediaGalleryValue extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mg_catalog_product_entity_media_gallery_value';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['value_id', 'store_id', 'entity_id', 'position', 'disabled'], 'integer'],
            [['label'], 'string', 'max' => 255],
            [['value_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntityMediaGallery::className(), 'targetAttribute' => ['value_id' => 'value_id']],
            [['entity_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntity::className(), 'targetAttribute' => ['entity_id' => 'entity_id']],
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
            'entity_id' => 'Entity ID',
            'label' => 'Label',
            'position' => 'Position',
            'disabled' => 'Disabled',
            'record_id' => 'Record ID',
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
    public function getEntity()
    {
        return $this->hasOne(CatalogProductEntity::className(), ['entity_id' => 'entity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStore()
    {
        return $this->hasOne(Store::className(), ['store_id' => 'store_id']);
    }
}
