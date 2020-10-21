<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "catalog_product_relation".
 *
 * @property int $parent_id Parent ID
 * @property int $child_id Child ID
 *
 * @property CatalogProductEntity $child
 * @property CatalogProductEntity $parent
 */
class CatalogProductRelation extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'catalog_product_relation';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['parent_id', 'child_id'], 'required'],
            [['parent_id', 'child_id'], 'integer'],
            [['parent_id', 'child_id'], 'unique', 'targetAttribute' => ['parent_id', 'child_id']],
            [['child_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntity::className(), 'targetAttribute' => ['child_id' => 'entity_id']],
            [['parent_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogProductEntity::className(), 'targetAttribute' => ['parent_id' => 'entity_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'parent_id' => 'Parent ID',
            'child_id' => 'Child ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getChild()
    {
        return $this->hasOne(CatalogProductEntity::className(), ['entity_id' => 'child_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParent()
    {
        return $this->hasOne(CatalogProductEntity::className(), ['entity_id' => 'parent_id']);
    }
}
