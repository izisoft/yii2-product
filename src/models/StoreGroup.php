<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "store_group".
 *
 * @property int $group_id Group ID
 * @property int $website_id Website ID
 * @property string $name Store Group Name
 * @property int $root_category_id Root Category ID
 * @property int $default_store_id Default Store ID
 * @property string $code Store group unique code
 *
 * @property Store[] $stores
 * @property StoreWebsite $website
 */
class StoreGroup extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'store_group';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['website_id', 'root_category_id', 'default_store_id'], 'integer'],
            [['name'], 'required'],
            [['name'], 'string', 'max' => 255],
            [['code'], 'string', 'max' => 32],
            [['code'], 'unique'],
            [['website_id'], 'exist', 'skipOnError' => true, 'targetClass' => StoreWebsite::className(), 'targetAttribute' => ['website_id' => 'website_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'group_id' => 'Group ID',
            'website_id' => 'Website ID',
            'name' => 'Name',
            'root_category_id' => 'Root Category ID',
            'default_store_id' => 'Default Store ID',
            'code' => 'Code',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStores()
    {
        return $this->hasMany(Store::className(), ['group_id' => 'group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWebsite()
    {
        return $this->hasOne(StoreWebsite::className(), ['website_id' => 'website_id']);
    }
}
