<?php
/**
 * 
 * @link http://iziweb.vn
 * @copyright Copyright (c) 2016 iziWeb
 * @email zinzinx8@gmail.com
 *
 */
namespace izi\product;

use izi\product\models\CatalogProductWebsite;
use Yii;
use izi\product\models\EavAttribute;
use izi\product\models\EavAttributeOptionValue;
use izi\product\models\EavEntityType;
use izi\product\models\CatalogProductEntity;
 
class Product extends \yii\base\Component
{
    
//     public function init()
//     {
//         // 
//         $tables = [            
//             'eav_entity_type',
//             'eav_attribute',
            

//             'store_website',
//             'store_group',
//             'store',
//             'eav_attribute_option',
//             'eav_attribute_label',
//             'eav_attribute_option_swatch',
//             'eav_attribute_option_value',
//             'catalog_eav_attribute',
//             'catalog_product_entity',
//             'catalog_product_entity_datetime',
//             'catalog_product_entity_decimal',
//             'catalog_product_entity_gallery',
//             'catalog_product_entity_int',
//             'catalog_product_entity_text',
//             'catalog_product_entity_tier_price',
//             'catalog_product_entity_varchar',
//             'catalog_product_entity_media_gallery_value_video',
//             'catalog_product_entity_media_gallery_value_to_entity',
//             'catalog_product_entity_media_gallery_value',
//             'catalog_product_website',
//             'catalog_product_relation',
//             'product_entity_to_category',
//         ];

//         foreach($tables as $table){
//             $tableSchema = Yii::$app->db->schema->getTableSchema($table);
//             if($tableSchema !== null){
//                 // $class = "\izi\product\migrations\\$table"; (new $class)->down();                (new $class)->up();
//             }

//             if($tableSchema === null){
//                 $class = "\izi\product\migrations\\$table";
//                 (new $class)->up();
//             }
//         }        
//     }

    private $_model;
    
    public function getModel()
    {
        if($this->_model == null){
            $this->_model = Yii::createObject('izi\product\models\Product');
        }
        
        return $this->_model;
    }
    
    
    public function updateStockStatus(){
        
        $items = CatalogProductEntity::find()->all();
        
        foreach ($items as $item){
            $this->updateProductAttr($item->entity_id, 'quantity_and_stock_status', 1);
        }
    }
    
    
    public function getItem($entity_id)
    {
        return $this->getModel()->getItem($entity_id);
    }
    
    public function getItemName($entity_id)
    {
        return $this->getModel()->getItemName($entity_id);
        
    }
    
    public function getItemSku($entity_id)
    {
        return $this->getItem($entity_id)->sku;
        
    }

    public function validateSku($sku, $entity_id){
        $item = \izi\product\models\CatalogProductEntity::find()->where(['and', ['sku' => $sku], ['not in', 'entity_id' , $entity_id]])->one();
        if(!empty($item)) return false;
        return true;
    }

    public function addBaseProduct($params)
    {
        extract($params);
        if($this->validateSku($product['sku'], (isset($entity_id) ? $entity_id : 0))){
            $item = new \izi\product\models\CatalogProductEntity();
            $item->sid = __SID__;
            foreach($product as $k=>$v){
                $item->$k = $v;
            }
            $item->updated_at = date('Y-m-d H:i:s');
            $item->save();
            return $item;
        }

    }

    public function submitProductV2($params)
    {
        $action = Yii::$app->controller->action->id;
        extract($params);
        switch($action){
            case 'add':
                $item = $this->addBaseProduct($params);
                break;
            default: $item = \izi\product\models\CatalogProductEntity::findOne(['entity_id' => $entity_id]); break;
        }

        $entity_id = $item->entity_id;
 
        if($this->validateSku($product['sku'], (isset($entity_id) ? $entity_id : 0))){
            
            foreach($product as $k=>$v){
                $item->$k = $v;
            }
            $item->updated_at = date('Y-m-d H:i:s');
            $item->save();
            //
            $category_id = post('category_id', []);
            \izi\product\models\ProductEntityToCategory::deleteAll(['entity_id' => $entity_id]);

            if(!empty($category_id)){
                
                foreach($category_id as $cid){
                    $c = new \izi\product\models\ProductEntityToCategory();
                    $c->category_id = $cid; 
                    $c->entity_id = $entity_id;
                    $c->save();
                }
            }
            // update attr
            //images
            $images = post('images', []);  
            $icon = '';
            if(!empty($images)){
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
            }
            $product_attr['icon'] = $icon;
            $product_attr['images'] = json_encode($images);

            if(isset($product_attr['name']) && !isset($product_attr['url'])){
                $product_attr['url'] = unMark($product_attr['name']);
            }

            if(isset($product_attr['url'])){
                $url = \izi\models\Slug::find()->where(['url' => $product_attr['url'], 'sid' => __SID__])->one();
 

                $true = true;
                while($true){
                    if(!empty($url)){
                        if($url->item_type == 8 && $url->item_id == $entity_id){
                            $true = false;
                        }else{
                            $product_attr['url'] .= "-$entity_id";
                            $url = \izi\models\Slug::find()->where(['url' => $product_attr['url'], 'sid' => __SID__]);
                        }
                    }else{
                        $true = false;
                    }
                }

                $product_attr['url_link'] = cu(['/' . $product_attr['url']]);

                //
                if(empty($url)){

                    $url2 = \izi\models\Slug::find()
                    ->where([
                        'item_type' => 8, 
                        'item_id'   => $entity_id,
                        'sid'       => __SID__
                    ])->one();

                    if(!empty($url2)){
                        $url2->url = $product_attr['url'];                        
                        $url2->save();
                    }else{                    
                        $url = new \izi\models\Slug();
                        $url->url = $product_attr['url'];
                        $url->item_type = 8;
                        $url->item_id = $entity_id;
                        $url->route = $item->type;
                        $url->sid = __SID__;
                        $url->save();
                    }
                }else{

                }

            }

            foreach($product_attr as $k=>$v){
                $this->updateProductAttr($entity_id, $k, $v);
            }

            // update product website
            $pw = CatalogProductWebsite::findOne(['product_id' => $entity_id, 'website_id' => STORE_WEBSITE_ID]);
            if(empty($pw)){
                $pw = new CatalogProductWebsite();
                $pw->product_id = $entity_id;
                $pw->website_id = STORE_WEBSITE_ID;
                $pw->save();
            }
             
        }else{
             
        }
        
        
        
        btnClickReturn(post('btnSubmit', 1),$entity_id,'#');

    }


    public function updateProductAttr($entity_id, $attr_code, $value){
        // get backend type
        $eav = $this->eavBackendType($attr_code);
        if(!empty($eav)){
            $tableName = "catalog_product_entity_" . $eav->backend_type;
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
                view($attr_code, $value);
            }

        }
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
    
    
    public function getPrices($entity_id)
    {
        $price = $sale_price = $this->getPrice($entity_id, 'price');
        $special_price  = $this->getPrice($entity_id, 'special_price');
        $compare_price  = $this->getPrice($entity_id, 'compare_price');
        
        if($special_price > 0 && $special_price < $price){
            $sale_price = $special_price;
            $compare_price = $compare_price > $price ? $compare_price : $price;
        }
        
        $compare_price = $compare_price > $sale_price ? $compare_price : 0;
        
        $discount_percent = 0;
                
        if($compare_price > $sale_price){
            $discount_percent = round((1 - ($sale_price / $compare_price)) * 100,2);
        }
        
        $p = new \stdClass();
        $p->sale_price = $sale_price;
        $p->price = $price;
        $p->compare_price = $compare_price;
        $p->discount_percent = $discount_percent;
        
        return $p;
    }
    
    
    public function getPrice($entity_id, $attr_code, $store_id = 0){
        $val = $this->getAttrValue($entity_id, $attr_code, $store_id);
        return is_numeric($val) ? $val : 0;
    }

    public function getAttrValue($entity_id, $attr_code, $store_id = 0)
    {
        $eav = $this->eavBackendType($attr_code);
        if(!empty($eav)){
            $tableName = "catalog_product_entity_" . $eav->backend_type;
            $model = "\izi\product\models\CatalogProductEntity" . ucfirst($eav->backend_type);
            // 
            $item = $model::findOne(['attribute_id' => $eav->attribute_id, 'entity_id' => $entity_id]);
            if(!empty($item)){
                return $item->value;
            }
        }
    }
    
    
    public function getListEavAttrOption($attr_code, $option_ids = [])
    {
         $query = \izi\product\models\EavAttributeOptionValue::find()
         ->select(['a.*'])
         ->from(['a' => \izi\product\models\EavAttributeOptionValue::tableName()])
         ->innerJoin(['b'=>\izi\product\models\EavAttributeOption::tableName()],'a.option_id=b.option_id')
         ->innerJoin(['c'=>\izi\product\models\EavAttribute::tableName()], 'b.attribute_id=c.attribute_id')
         ->innerJoin(['d'=>\izi\product\models\EavEntityType::tableName()], 'c.entity_type_id=d.entity_type_id')
         ->where(['c.attribute_code'=>$attr_code, 'd.entity_type_code'=>'catalog_product'])
         ;
        
         if(!empty($option_ids)){
             $query->andWhere(['b.option_id' => $option_ids]);
         }
         return $query->all();
    }


    public function getUserDefinedEavAttributes()
    {
         $query = \izi\product\models\EavAttribute::find()
         ->select(['a.*'])
         ->from(['a' => \izi\product\models\EavAttribute::tableName()])
         ->innerJoin(['b'=>\izi\product\models\CatalogEavAttribute::tableName()],'b.attribute_id=a.attribute_id')
         ->innerJoin(['d'=>\izi\product\models\EavEntityType::tableName()], 'a.entity_type_id=d.entity_type_id')
         ->where([
             'd.entity_type_code'=>'catalog_product',
             'a.frontend_input' => 'select',
             'a.is_user_defined' => 1,
             'b.is_global' => 1,
         ])
         ;
        //  view($query->createCommand()->getRawSql());
         return $query->all();
    }


    public function getEavAttributes($params = [])
    {
         $query = \izi\product\models\EavAttribute::find()
         
         ->from(['a' => \izi\product\models\EavAttribute::tableName()])
         ->innerJoin(['b'=>\izi\product\models\CatalogEavAttribute::tableName()],'b.attribute_id=a.attribute_id')
         ->innerJoin(['d'=>\izi\product\models\EavEntityType::tableName()], 'a.entity_type_id=d.entity_type_id')
         ->where([
             'd.entity_type_code'=>'catalog_product',
             //'a.frontend_input' => 'select',
             //'a.is_user_defined' => 1,
             //'b.is_global' => 1,
         ])
         ->andWhere(['not in', 'backend_type', ['static', 'text']])
         ->andWhere(['not in', 'frontend_label', ['']])
         ;
        $p = getParam('p', 1);
        $limit = 30;
        $offset = ($p-1) * $limit; 

        $c = 0;
    	//if($count){
    		$query->select('count(1)');
    		$c = $query->scalar();
    	//}
    	$query->select(['a.*'])
    	->orderBy(['a.frontend_label' => SORT_ASC])
    	->offset($offset)
    	->limit($limit);
    	$l = $query->asArray()->all();
    	//
    	return [
    			'list_items'=>$l,
    			'total_records'=>$c,
    			'total_pages'=>ceil($c/$limit),
    			'limit'=>$limit,
    			'p'=>$p,
    	];

        //  return $query->all();
    }


    public function getEavAtrributeById($attribute_id){
        return \izi\product\models\EavAttribute::findOne($attribute_id);
    }



    public function explodeArrayAttrRecusive(array $array){
        
        $current = current($array);
        $key = key($array);
        $result = []; $i = 0;

        if(!empty($current)){
            $next = next($array);
            $key2 = key($array);
            $next2 = next($array);
            $key3 = key($array);
            $next3 = next($array);
            $key4 = key($array);
            $next4 = next($array);
            $key5 = key($array);
            $next5 = next($array);
            $key6 = key($array);
            foreach($current as $v1){            

                if(!empty($next)){                 
                    foreach($next as $v2){
                        if(!empty($next2)){
                            foreach($next2 as $v3){
                                if(!empty($next3)){
                                    foreach($next3 as $v4){
                                        if(!empty($next4)){
                                            foreach($next4 as $v5){
                                                if(!empty($next5)){
                                                    foreach($next5 as $v6){ 
                                                        if(!isset($result[$i]['options'])) $result[$i]['options'] = [];
                                                        $result[$i]['attributes'] = [$key => $v1, $key2 => $v2, $key3 => $v3, $key4=>$v4, $key5=> $v5, $key6 => $v6];
                                                        $result[$i]['options'][$key] = $v1;
                                                        $result[$i]['options'][$key2] = $v2;
                                                        $result[$i]['options'][$key3] = $v3;
                                                        $result[$i]['options'][$key4] = $v4;
                                                        $result[$i]['options'][$key5] = $v5;                                                    
                                                        $result[$i++]['options'][$key6] = $v6;
                                                                                            
                                                    }
                                                }else{
                                                    if(!isset($result[$i]['options'])) $result[$i]['options'] = [];
                                                    $result[$i]['attributes'] = [$key => $v1, $key2 => $v2, $key3 => $v3, $key4=>$v4, $key5 => $v5];
                                                    $result[$i]['options'][$key] = $v1;
                                                    $result[$i]['options'][$key2] = $v2;
                                                    $result[$i]['options'][$key3] = $v3;
                                                    $result[$i]['options'][$key4] = $v4;
                                                    $result[$i++]['options'][$key5] = $v5;
                                                }                                        
                                            }
                                        }else{
                                            if(!isset($result[$i]['options'])) $result[$i]['options'] = [];
                                            $result[$i]['attributes'] = [$key => $v1, $key2 => $v2, $key3 => $v3, $key4=>$v4];
                                            $result[$i]['options'][$key] = $v1;
                                            $result[$i]['options'][$key2] = $v2;
                                            $result[$i]['options'][$key3] = $v3;
                                            $result[$i++]['options'][$key4] = $v4;
                                        }                                        
                                    }
                                }else{
                                    if(!isset($result[$i]['options'])) $result[$i]['options'] = [];
                                    $result[$i]['attributes'] = [$key => $v1, $key2 => $v2, $key3 => $v3];
                                    $result[$i]['options'][$key] = $v1;
                                    $result[$i]['options'][$key2] = $v2;
                                    $result[$i++]['options'][$key3] = $v3;
                                }                                        
                            }
                        }else{
                            if(!isset($result[$i]['options'])) $result[$i]['options'] = [];
                            $result[$i]['attributes'] = [$key => $v1, $key2 => $v2];
                            $result[$i]['options'][$key] = $v1;
                            $result[$i++]['options'][$key2] = $v2;
                        }                                        
                    }
                }else{
                    if(!isset($result[$i]['options'])) $result[$i]['options'] = [];
                    $result[$i]['attributes'] = [$key => $v1];
                    $result[$i++]['options'][$key] = $v1;
                }
            }
        }
        return $result;
    }


    public function updateProduct($data)
    {
        //


    }
    
    
    public function getEntityCategoryName($entity_id)
    {
        $cate = $this->getModel()->getCategoryByEntityId($entity_id);
        $r  = [];
        if(!empty($cate)){
            foreach ($cate as $c){
                $r[] = $c->title;
            }
        }
        
        return $r;
    }
    
    
    public function miggrateProduct($data, $param)
    {
                
        if(!isset($data['sku'])) return;
        
        $product['sku'] = $data['sku'];
        
        if(isset($data['type'])) $product['type'] = $data['type'];
        
        $item = CatalogProductEntity::findOne(['sku' => $data['sku']]);
        if(empty($item)){
            $item = $this->model->addBaseProduct(['product' => $product]);
        }else{
            if(!(isset($param['overwrite']) && $param['overwrite'] == true)){
                return;
            }
        }
        
        if(!isset($item->entity_id)){
            return ;
        }
        
        $entity_id = $item->entity_id;
        
        if($this->validateSku($product['sku'], (isset($entity_id) ? $entity_id : 0))){
            
            foreach($product as $k=>$v){
                $item->$k = $v;
            }
            $item->updated_at = date('Y-m-d H:i:s');
            $item->save();
            
            $categories = isset($param['categories']) ? $param['categories'] : (isset($param['category_id']) ? $param['category_id'] : []);
            
            if(!is_array($categories)){
                $categories = [$categories];
            }
            
            if(!empty($categories)){                 
                
                \izi\product\models\ProductEntityToCategory::deleteAll(['entity_id' => $entity_id]);
                
                if(!empty($categories)){
                    
                    foreach($categories as $cid){
                        $c = new \izi\product\models\ProductEntityToCategory();
                        $c->category_id = $cid;
                        $c->entity_id = $entity_id;
                        $c->save();
                    }
                }
                
            }
            
            $product_attr = [];
            
            if(isset($data['images'])){
                //images
                $images = $data['images'];
                $icon = '';
                if(!empty($images)){
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
                }
                $product_attr['icon'] = $icon;
                $product_attr['images'] = json_encode($images);
            }
            
            $product_attr['name'] = $data['name'];
            
            if(isset($product_attr['name']) && !isset($product_attr['url'])){
                $product_attr['url'] = unMark($product_attr['name']);
            }
            
            if(isset($product_attr['url'])){
                $url = \izi\models\Slug::find()->where(['url' => $product_attr['url'], 'sid' => __SID__])->one();
                
                
                $true = true;
                while($true){
                    if(!empty($url)){
                        
                        if(!isset($url->item_type)){
                            //view($url, 1,1);
                        }
                        
                        if($url->item_type == 8 && $url->item_id == $entity_id){
                            $true = false;
                        }else{
                            $product_attr['url'] .= "-$entity_id";
                            $url = \izi\models\Slug::find()->where(['url' => $product_attr['url'], 'sid' => __SID__])->one();
                        }
                    }else{
                        $true = false;
                    }
                }
                
                $product_attr['url_link'] = cu(['/' . $product_attr['url']]);
                
                //
                if(empty($url)){
                    
                    $url2 = \izi\models\Slug::find()
                    ->where([
                        'item_type' => 8,
                        'item_id'   => $entity_id,
                        'sid'       => __SID__
                    ])->one();
                    
                    if(!empty($url2)){
                        $url2->url = $product_attr['url'];
                        $url2->save();
                    }else{
                        
                      
                        $url = new \izi\models\Slug();
                        $url->url = $product_attr['url'];
                        $url->item_type = 8;
                        $url->item_id = $entity_id;
                        $url->route = $item->type;
                        $url->sid = __SID__;
                        $url->save();
                    }
                }else{
                    
                }
                
            }
            
            if(isset($data['description'])){
                $product_attr['description'] = $data['description'];
            }
            
            if(isset($data['long_description'])){
                $product_attr['long_description'] = $data['long_description'];
            }
            
            if(isset($data['short_description'])){
                $product_attr['short_description'] = $data['short_description'];
            }
            
            if(isset($data['warranty_policy'])){
                $product_attr['warranty_policy'] = $data['warranty_policy'];
            }
            
            if(isset($data['warranty_text'])){
                $product_attr['warranty_text'] = $data['warranty_text'];
            }
            
            if(isset($data['warranty_time'])){
                $product_attr['warranty_time'] = $data['warranty_time'];
            }
            
            
            
            if(isset($data['content'])){
                
                if(!is_array($data['content'])){
                    //product_attr[content][tabs][0][title]
                    $data['content'] = [
                        'tabs' => [
                            ['title' => 'Chi tiết', 'text' => $data['content']]
                        ]
                    ];
                }
                
                $product_attr['content'] = $data['content'];
            }
            
            $product_attr['currency'] = 1;
            if(isset($data['price'])){
                $product_attr['price'] = $data['price'];
            }
            
            if(isset($data['compare_price'])){
                $product_attr['compare_price'] = $data['compare_price'];
            }
            if(isset($data['origin_url'])){
                $product_attr['origin_url'] = $data['origin_url'];
            }
            
            $quantity = 0;
            if(isset($data['stock_status'])){
                
                
                switch (unMark($data['stock_status'])) {
                    case 'con-hang':
                        $quantity = 100;
                    break;
                    
                    default:
                        ;
                    break;
                }
                
//                 $product_attr['quantity_and_stock_status'] = $quantity;
                $product_attr['quantity_and_stock_status'] = $quantity > 0 ? 1 : 0;
            }
            
            foreach($product_attr as $k=>$v){
                $this->updateProductAttr($entity_id, $k, $v);
            }
            
            // update product website
            $pw = CatalogProductWebsite::findOne(['product_id' => $entity_id, 'website_id' => STORE_WEBSITE_ID]);
            if(empty($pw)){
                $pw = new CatalogProductWebsite();
                $pw->product_id = $entity_id;
                $pw->website_id = STORE_WEBSITE_ID;
                $pw->save();
            }
            
            
            if(isset($param['source']) && $quantity>0){
                Yii::$app->inventory->source->updateQuantity($param['source'], $product['sku'],$quantity);
            }
        }
        
        
        
        

        
        
    }

}