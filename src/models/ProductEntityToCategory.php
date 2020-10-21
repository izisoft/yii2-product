<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "product_entity_to_category".
 *
 * @property int $entity_id
 * @property int $category_id
 *
 * @property CatalogProductEntity $entity
 */
class ProductEntityToCategory extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_entity_to_category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['entity_id', 'category_id'], 'required'],
            [['entity_id', 'category_id'], 'integer'],
            [['entity_id', 'category_id'], 'unique', 'targetAttribute' => ['entity_id', 'category_id']],
            [['entity_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntity::className(), 'targetAttribute' => ['entity_id' => 'entity_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'entity_id' => 'Entity ID',
            'category_id' => 'Category ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEntity()
    {
        return $this->hasOne(CatalogProductEntity::className(), ['entity_id' => 'entity_id']);
    }
}
