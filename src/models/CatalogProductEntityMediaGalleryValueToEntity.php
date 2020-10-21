<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "mg_catalog_product_entity_media_gallery_value_to_entity".
 *
 * @property int $value_id Value media Entry ID
 * @property int $entity_id
 *
 * @property MgCatalogProductEntity $entity
 * @property MgCatalogProductEntityMediaGallery $value
 */
class CatalogProductEntityMediaGalleryValueToEntity extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mg_catalog_product_entity_media_gallery_value_to_entity';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['value_id', 'entity_id'], 'required'],
            [['value_id', 'entity_id'], 'integer'],
            [['value_id', 'entity_id'], 'unique', 'targetAttribute' => ['value_id', 'entity_id']],
            [['entity_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntity::className(), 'targetAttribute' => ['entity_id' => 'entity_id']],
            [['value_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntityMediaGallery::className(), 'targetAttribute' => ['value_id' => 'value_id']],
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
        ];
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
    public function getValue()
    {
        return $this->hasOne(CatalogProductEntityMediaGallery::className(), ['value_id' => 'value_id']);
    }
}
