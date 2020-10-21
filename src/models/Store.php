<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "store".
 *
 * @property int $store_id Store ID
 * @property string $code Code
 * @property int $website_id Website ID
 * @property int $group_id Group ID
 * @property string $name Store Name
 * @property int $sort_order Store Sort Order
 * @property int $is_active Store Activity
 *
 * @property CatalogProductEntityDatetime[] $catalogProductEntityDatetimes
 * @property CatalogProductEntityDecimal[] $catalogProductEntityDecimals
 * @property CatalogProductEntityGallery[] $catalogProductEntityGalleries
 * @property CatalogProductEntityInt[] $catalogProductEntityInts
 * @property CatalogProductEntityText[] $catalogProductEntityTexts
 * @property CatalogProductEntityVarchar[] $catalogProductEntityVarchars
 * @property StoreGroup $group
 * @property StoreWebsite $website
 */
class Store extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'store';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['website_id', 'group_id', 'sort_order', 'is_active'], 'integer'],
            [['name'], 'required'],
            [['code'], 'string', 'max' => 32],
            [['name'], 'string', 'max' => 255],
            [['code'], 'unique'],
            [['group_id'], 'exist', 'skipOnError' => true, 'targetClass' => StoreGroup::className(), 'targetAttribute' => ['group_id' => 'group_id']],
            [['website_id'], 'exist', 'skipOnError' => true, 'targetClass' => StoreWebsite::className(), 'targetAttribute' => ['website_id' => 'website_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'store_id' => 'Store ID',
            'code' => 'Code',
            'website_id' => 'Website ID',
            'group_id' => 'Group ID',
            'name' => 'Name',
            'sort_order' => 'Sort Order',
            'is_active' => 'Is Active',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityDatetimes()
    {
        return $this->hasMany(CatalogProductEntityDatetime::className(), ['store_id' => 'store_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityDecimals()
    {
        return $this->hasMany(CatalogProductEntityDecimal::className(), ['store_id' => 'store_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityGalleries()
    {
        return $this->hasMany(CatalogProductEntityGallery::className(), ['store_id' => 'store_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityInts()
    {
        return $this->hasMany(CatalogProductEntityInt::className(), ['store_id' => 'store_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityTexts()
    {
        return $this->hasMany(CatalogProductEntityText::className(), ['store_id' => 'store_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogProductEntityVarchars()
    {
        return $this->hasMany(CatalogProductEntityVarchar::className(), ['store_id' => 'store_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGroup()
    {
        return $this->hasOne(StoreGroup::className(), ['group_id' => 'group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWebsite()
    {
        return $this->hasOne(StoreWebsite::className(), ['website_id' => 'website_id']);
    }
}
