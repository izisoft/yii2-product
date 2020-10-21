<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "eav_attribute".
 *
 * @property int $attribute_id Attribute ID
 * @property int $entity_type_id Entity Type ID
 * @property string $attribute_code Attribute Code
 * @property string $attribute_model Attribute Model
 * @property string $backend_model Backend Model
 * @property string $backend_type Backend Type
 * @property string $backend_table Backend Table
 * @property string $frontend_model Frontend Model
 * @property string $frontend_input Frontend Input
 * @property string $frontend_label Frontend Label
 * @property string $frontend_class Frontend Class
 * @property string $source_model Source Model
 * @property int $is_required Defines Is Required
 * @property int $is_user_defined Defines Is User Defined
 * @property string $default_value Default Value
 * @property int $is_unique Defines Is Unique
 * @property string $note Note
 *
 * @property CatalogProductEntityDatetime[] $catalogProductEntityDatetimes
 * @property CatalogProductEntityDecimal[] $catalogProductEntityDecimals
 * @property CatalogProductEntityGallery[] $catalogProductEntityGalleries
 * @property CatalogProductEntityInt[] $catalogProductEntityInts
 * @property CatalogProductEntityText[] $catalogProductEntityTexts
 * @property CatalogProductEntityVarchar[] $catalogProductEntityVarchars
 * @property EavEntityType $entityType
 */
class EavAttribute extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'eav_attribute';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['entity_type_id', 'is_required', 'is_user_defined', 'is_unique'], 'integer'],
            [['attribute_code'], 'required'],
            [['default_value'], 'string'],
            [['attribute_code', 'attribute_model', 'backend_model', 'backend_table', 'frontend_model', 'frontend_label', 'frontend_class', 'source_model', 'note'], 'string', 'max' => 255],
            [['backend_type'], 'string', 'max' => 8],
            [['frontend_input'], 'string', 'max' => 50],
            [['entity_type_id', 'attribute_code'], 'unique', 'targetAttribute' => ['entity_type_id', 'attribute_code']],
            [['entity_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => EavEntityType::className(), 'targetAttribute' => ['entity_type_id' => 'entity_type_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'attribute_id' => 'Attribute ID',
            'entity_type_id' => 'Entity Type ID',
            'attribute_code' => 'Attribute Code',
            'attribute_model' => 'Attribute Model',
            'backend_model' => 'Backend Model',
            'backend_type' => 'Backend Type',
            'backend_table' => 'Backend Table',
            'frontend_model' => 'Frontend Model',
            'frontend_input' => 'Frontend Input',
            'frontend_label' => 'Frontend Label',
            'frontend_class' => 'Frontend Class',
            'source_model' => 'Source Model',
            'is_required' => 'Is Required',
            'is_user_defined' => 'Is User Defined',
            'default_value' => 'Default Value',
            'is_unique' => 'Is Unique',
            'note' => 'Note',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityDatetimes()
    {
        return $this->hasMany(CatalogProductEntityDatetime::className(), ['attribute_id' => 'attribute_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityDecimals()
    {
        return $this->hasMany(CatalogProductEntityDecimal::className(), ['attribute_id' => 'attribute_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityGalleries()
    {
        return $this->hasMany(CatalogProductEntityGallery::className(), ['attribute_id' => 'attribute_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityInts()
    {
        return $this->hasMany(CatalogProductEntityInt::className(), ['attribute_id' => 'attribute_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityTexts()
    {
        return $this->hasMany(CatalogProductEntityText::className(), ['attribute_id' => 'attribute_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityVarchars()
    {
        return $this->hasMany(CatalogProductEntityVarchar::className(), ['attribute_id' => 'attribute_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEntityType()
    {
        return $this->hasOne(EavEntityType::className(), ['entity_type_id' => 'entity_type_id']);
    }
}
