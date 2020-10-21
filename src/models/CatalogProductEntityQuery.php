<?php

namespace izi\product\models;

/**
 * This is the ActiveQuery class for [[CatalogProductEntity]].
 *
 * @see CatalogProductEntity
 */
class CatalogProductEntityQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return CatalogProductEntity[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return CatalogProductEntity|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
