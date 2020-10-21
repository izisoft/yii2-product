<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "mg_catalog_product_entity".
 *
 * @property int $entity_id Entity Id
 * @property int $attribute_set_id Attribute Set ID
 * @property string $type_id Type ID
 * @property string $sku SKU
 * @property int $has_options Has Options
 * @property int $required_options Required Options
 * @property string $created_at Creation Time
 * @property string $updated_at Update Time
 *
 * @property CatalogProductEntityDatetime[] $mgCatalogProductEntityDatetimes
 * @property CatalogProductEntityDecimal[] $mgCatalogProductEntityDecimals
 * @property CatalogProductEntityGallery[] $mgCatalogProductEntityGalleries
 * @property CatalogProductEntityInt[] $mgCatalogProductEntityInts
 * @property CatalogProductEntityMediaGalleryValue[] $mgCatalogProductEntityMediaGalleryValues
 * @property CatalogProductEntityMediaGalleryValueToEntity[] $mgCatalogProductEntityMediaGalleryValueToEntities
 * @property CatalogProductEntityMediaGallery[] $values
 * @property CatalogProductEntityText[] $mgCatalogProductEntityTexts
 * @property CatalogProductEntityTierPrice[] $mgCatalogProductEntityTierPrices
 * @property CatalogProductEntityVarchar[] $mgCatalogProductEntityVarchars
 */
class Product extends \izi\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return CatalogProductEntity::tableName();
    }
    
    
    public $items;
    
    public function getItem($entity_id)
    {
        if(isset($this->items[$entity_id])){
            return $this->items[$entity_id];
        }
        
        $query = CatalogProductEntity::find();
        
        $query->from(['a'   =>  CatalogProductEntity::tableName()]);
        
        $query->select([
            'a.*'
        ]);
        
        $query->where(['a.entity_id'=>$entity_id]);
        
        $this->items[$entity_id] = $query->one();
        
        return $this->items[$entity_id];
    }
    
    public function getItemAttribute($entity_id, $attribute_code)
    {
        // Get attribute_id from mg_eav_attribute
        $attribute = EavAttribute::find()
        ->from(['a' =>  EavAttribute::tableName()])
        ->where([
            'a.attribute_code'=>$attribute_code,
            'a.entity_type_id'  =>  (new \yii\db\Query())->from(EavEntityType::tableName())->where(['entity_type_code'=>'catalog_product'])->select('entity_type_id')
        ])
        
        ->one();         
        
        if(!empty($attribute)){
        // mg_catalog_product_entity_varchar
        $entity_type = $attribute->backend_type;
        
        switch ($entity_type) {
            case 'static':                
                return $this->getItem($entity_id)->{$attribute_code};
            break;
            
            default:
                ;
            break;
        }
        
        $entity_table = "izi\product\models\CatalogProductEntity" . ucfirst( $entity_type);
 
        $v = $entity_table::find()->where([
            'attribute_id' => $attribute->attribute_id,
            'entity_id'    =>  $entity_id
        ])->one();
        
        return isset($v->value) ? $v->value : null;
        
        }
    }
    
    
    public function getItemName($entity_id)
    {
        return $this->getItemAttribute($entity_id, 'name');
    }
    
    public function getItemSku($entity_id)
    {
        return $this->getItemAttribute($entity_id, 'sku');
    }
    
    public function validateSku($sku, $entity_id){
        $item = CatalogProductEntity::find()->where(['and', ['sku' => $sku], ['not in', 'entity_id' , $entity_id]])->one();
        if(!empty($item)) return false;
        return true;
    }

    public function addBaseProduct($params, $return_mode = 0)
    {
        extract($params);
        if($this->validateSku($product['sku'], (isset($entity_id) ? $entity_id : 0))){
            $item = new CatalogProductEntity();
            $item->sid = __SID__;
            foreach($product as $k=>$v){
                $item->$k = $v;
            }
            $item->updated_at = date('Y-m-d H:i:s');
            $item->save();
            return $item;
        }

        if($return_mode == 1 && empty($item)){
            return CatalogProductEntity::findOne(['sku' => $product['sku']]);
        }

    }

    public function updateProduct($params)
    {
        //
        if(!isset($params['entity_id'])){
            $item = $this->addBaseProduct($params , 1);

        }else{
            $item = CatalogProductEntity::findOne(['entity_id' => $params['entity_id']]);
        }

        if(!empty($item) && $this->validateSku($params['product']['sku'], $item->entity_id) ){
            
            // update base product
            foreach($params['product'] as $k=>$v){
                $item->$k = $v;
            }
            
            $item->updated_at = date('Y-m-d H:i:s');
            
            $item->save();

            // update category
            if(isset($params['categorys'])){
                
                ProductEntityToCategory::deleteAll(['entity_id' => $item->entity_id]);
    
                if(!empty($params['categorys'])){
                    
                    foreach($params['categorys'] as $cid){
                        $c = new ProductEntityToCategory();
                        $c->category_id = $cid; 
                        $c->entity_id = $item->entity_id;
                        $c->save();
                    }
                }
    
            }
            
            // update attributes
            $product_attr = isset($params['product_attr']) ? $params['product_attr'] : [];

            $images = isset($product_attr['images']) ? $product_attr['images'] : [];

            if(!empty($images)){
                $icon = '';
                $fk = -1;
                foreach($images as $k=>$v){
                    if($fk < 0){
                        $fk = $k;
                    }
                    if(!isset($v['title'])) $images[$k]['title'] = '';
                    if(!isset($v['info'])) $images[$k]['info'] = '';
                    if(isset($v['main']) && $v['main'] == 1){
                        $icon = $v['src'];
                    }
                }
                if($icon == ''){
                    $icon = $images[$fk]['src'];
                    $images[$fk]['main'] = 1;
                }
                $product_attr['icon'] = $icon;
                $product_attr['images'] = json_encode($images);

            }

            foreach($product_attr as $k=>$v){
                $this->updateProductAttr($item->entity_id, $k, $v);
            }

            $this->updateProductWebsite($item->entity_id, STORE_WEBSITE_ID);

            return $item;
        }
        

    }

    public function updateProductJsonAttribute($entity_id, $attribute_code, $json_code, $value){

        $attribute_value = json_decode($this->getAttrValue($entity_id, $attribute_code),1);
        $attribute_value[$json_code] = $value;
 
        $this->updateProductAttr($entity_id, $attribute_code, json_encode($attribute_value,JSON_UNESCAPED_UNICODE));
    }

    public function getJsonAttributeValue($entity_id, $attribute_code, $json_code){
        $attribute_value = json_decode($this->getAttrValue($entity_id, $attribute_code),1);
        return isset($attribute_value[$json_code]) ? $attribute_value[$json_code] : null;
    }
    
    public function getEntityAttribute($entity_id, $attr_code, $store_id = 0){
        $eav = $this->eavBackendType($attr_code);
        if(!empty($eav)){
            $tableName = CatalogProductEntity::tableName() ."_" . $eav->backend_type;
            $model = "\izi\product\models\CatalogProductEntity" . ucfirst($eav->backend_type);
            //
            $item = $model::findOne(['attribute_id' => $eav->attribute_id, 'entity_id' => $entity_id]);
            if(!empty($item)){
                return $item;
            }
        }
    }

    public function getAttrValue($entity_id, $attr_code, $store_id = 0)
    {
        $item = $this->getEntityAttribute($entity_id, $attr_code, $store_id);
        if(!empty($item))
        return $item->value;
        
    }

    public function updateProductAttr($entity_id, $attr_code, $value){
        // get backend type
        $eav = $this->eavBackendType($attr_code);
        if(!empty($eav)){
//             $tableName = "catalog_product_entity_" . $eav->backend_type;
            $model = "\izi\product\models\CatalogProductEntity" . ucfirst($eav->backend_type);
            // 
            switch($eav->backend_type){
                case 'int': case 'decimal':
                    $value = cprice($value);
                    break;
                case 'text':
                    if(is_array($value)){
                        $value = json_encode($value);
                    }
                    break;
            }
            //            

            $item = $model::findOne(['attribute_id' => $eav->attribute_id, 'entity_id' => $entity_id]);
            if(empty($item)){
                $item = new $model();
            }
            $item->entity_id = $entity_id;
            $item->attribute_id = $eav->attribute_id;
            // $item->store_id = $store_id;

            $item->value = $value;

            
            if($item->save()){

            }else{
                 
            }

        }
    }
    
    
    public function getItemCategory($entity_id)
    {
        $query = \izi\models\SiteMenu::find()
        ->from(['a' => \izi\models\SiteMenu::tableName()])
        ->innerJoin(['b' => ProductEntityToCategory::tableName()], 'a.id=b.category_id')
        ->where(['b.entity_id' => $entity_id])
        ;
        return $query->asArray()->one();
    }


    public function eavBackendType($attr_code)
    {
        $eav = EavAttribute::find()
        ->from(['a' => EavAttribute::tableName()])
        ->innerJoin(['b' => EavEntityType::tableName()], 'a.entity_type_id=b.entity_type_id')
        ->where(['b.entity_type_code' => 'catalog_product', 'attribute_code'=>$attr_code])
        ->one();

        return $eav;

    }


    public function updateProductRelation($parent_id, $child_id){
        if(!is_array($child_id)) $child_id = [$child_id];
        CatalogProductRelation::deleteAll(['parent_id' => $parent_id]);
        foreach($child_id as $c){
            $p = new CatalogProductRelation();
            $p->parent_id = $parent_id;
            $p->child_id = $c;
            $p->save();
        }
    }
    

    public function updateProductWebsite($product_id, $website_id){
        // update product website
        $pw = CatalogProductWebsite::findOne(['product_id' => $product_id, 'website_id' => $website_id]);
        if(empty($pw)){
            $pw = new CatalogProductWebsite();
            $pw->product_id = $product_id;
            $pw->website_id = $website_id;
            $pw->save();
        }
    }

    public function getProductRelation($parent_id, $option = []){
        $query = CatalogProductEntity::find()
        ->from(['a' => CatalogProductEntity::tableName()])
        ->innerJoin(['b' => CatalogProductRelation::tableName()], 'a.entity_id=b.child_id')
        ->where(['b.parent_id' => $parent_id])
        ;
        $items = $query->all();
        
        $existedItems = [];
        if(!empty($items)){
            foreach ($items as $item){
                $existedItems[] = $item->entity_id;
            }
        }
        
        $exs = [];
        if(!empty($option)){
            foreach ($option as $attribute_id => $option_id){
                $eav = $ev[$attribute_id] = Yii::$app->product->getEavAtrributeById($attribute_id);
                 
                $model = '\izi\product\models\CatalogProductEntity' . ucfirst($eav->backend_type);
                
                $t2 = $model::findAll(['attribute_id' => $eav->attribute_id, 'value'=>$option_id, 'entity_id' => $existedItems]);
                if(!empty($t2)){
                    foreach ($t2 as $t){
                        if(!isset($exs[$attribute_id])){
                            $exs[$attribute_id] = [];
                        }
                        $exs[$attribute_id][] = $t->entity_id;
                    }
                }
                
                 
            }
            $true = true;
            if(!empty($exs)){
                $a = current($exs);
                while($true){
                    $b = next($exs);
                    if(!empty($b)){
                        $a = array_intersect($a, $b);
                    }else{
                        $true = false;
                    }
                }
                
                $query->andWhere(['a.entity_id' => $a]);
            }
        }
         
         
        return $query->all();
    }
    
    
    /**
     * 
     */
    public function getListProduct($params = []){
        
//         view($params);
        
        $website_id = isset($params['website_id']) ? $params['website_id'] : Yii::$app->store->defaultWebsiteId;
        $paging = isset($params['paging']) && $params['paging'] == true ? true : false;
        
        $box = isset($params['box']) ? $params['box'] : [];
        $box_info = isset($params['box_info']) ? $params['box_info'] : [];
        
        if(empty($box) && !empty($box_info)){
            $box = Yii::$app->box->getBox($box_info['code'], $box_info);             
        }
        
        $limit = isset($params['limit']) ? $params['limit'] : 30;
        
        if(isset($box['limit']) && $box['limit'] > 0){
            $limit = $box['limit'];
        }
        
        if(isset($box['product_list']) && !empty($box['product_list'])){
            $params['in_product'] =  $box['product_list'] + (isset($params['in_product']) ? $params['in_product'] : []);
        }
        
        $notin_product = isset($params['notin_product']) ? is_array($params['notin_product']) : [];        
        
        $query = CatalogProductEntity::find()
        ->from(['a' => CatalogProductEntity::tableName()])
        ->innerJoin(['b' => CatalogProductWebsite::tableName()], 'a.entity_id=b.product_id')
        ->where(['b.website_id' => $website_id]) ;
        
        
        if(isset($params['relation']) && $params['relation'] === true){
            $notin_product[] = $params['product_id'];
        }
        
        if(isset($params['in_product']) && is_array($params['in_product'])){
            $query->andWhere(['a.entity_id' => $params['in_product']]);
        }
        
        if(!empty($notin_product)){
            $query->andWhere(['not in', 'a.entity_id' ,$notin_product]);
        }
        
        $w = false;
        if(isset($params['is_active']) || isset($params['is_hidden'])){
            $w = true;
        }
        
        if($w){
            $query->innerJoin(['w' => CatalogProductWebsite::tableName()], 'a.entity_id=w.product_id');
            
            if(isset($params['is_active'])){
                $query->andWhere(['w.is_active' => $params['is_active']]);
            }
            
            if(isset($params['is_hidden'])){
                $query->andWhere(['w.is_hidden' => $params['is_hidden']]);
            }
        }
        
        /**
         * Filter
         * 
         */
        $filter_conditions = [
            'or'           
        ];
        
        if(isset($params['filter_text']) && $params['filter_text'] != ""){
            $filter_conditions[] = ['like', 'a.sku' , $params['filter_text']];
            
            $query->innerJoin(['x' => CatalogProductEntityVarchar::tableName()], 'a.entity_id=x.entity_id')
            ;
            
            $filter_conditions[] = ['like', 'x.value' , $params['filter_text']];
        }
        
        if(isset($params['categorys']) && is_array($params['categorys'])){
            $categorys = $params['categorys'];
        }elseif(isset($params['category_id']) && ($category_id = $params['category_id']) != null){
            $categorys = Yii::$app->frontend->menu->getAllChildID($category_id);
        }
        
        if(!empty($categorys)){
            $query->innerJoin(['c' => ProductEntityToCategory::tableName()], 'a.entity_id=c.entity_id');
            $query->andWhere(['c.category_id' => $categorys]);
        }
        
        
        if(count($filter_conditions) > 1){
            $query->andWhere($filter_conditions);
        }
        
        
        
        $p = (int) (isset($params['p']) ? $params['p'] : getParam('p', 1));
        
        $offset = ($p - 1 ) * $limit;
        
        $query->groupBy('a.entity_id');
        
        if($paging){
            
           
            
            $total_records = $query->count(1);
            $total_pages = ceil($total_records/$limit);
            
            $query->offset($offset)->limit($limit);
            
            $query->orderBy(['a.updated_at' => SORT_DESC, 'a.created_at' => SORT_DESC]);
            
//             view($query->createCommand()->getRawSql());
            
            return [
                'p' => $p,
                'limit' => $limit,
                'total_records' => $total_records,
                'total_pages' => $total_pages,
                'list_items' => $query->all(),
                'box' => $box,
            ];
        }
        
        $query->offset($offset)->limit($limit);
        
        $query->orderBy(['a.updated_at' => SORT_DESC, 'a.created_at' => SORT_DESC]);
        
        return $query->all();
        
        
        
    }
    
    public function getCategoryByEntityId($entity_id)
    {
        $query = \izi\models\SiteMenu::find()
        ->from(['a' => \izi\models\SiteMenu::tableName()])->innerJoin(['b' => ProductEntityToCategory::tableName()], 'a.id = b.category_id')
        ->where(['a.sid' => __SID__, 'b.entity_id' => $entity_id])
        ->orderBy(['a.lft' => SORT_ASC])
        ;
        
        return $query->all();
    }

    public function getProductWebsiteOption($product_id, $website_id, $column)
    {
        $query = CatalogProductWebsite::find()
        ->select($column)
        ->where(['product_id' => $product_id, 'website_id' => $website_id])
        ;         
        
        return $query->scalar();
    }
    
    

}