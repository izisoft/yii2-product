<?php

namespace izi\product\models;

use Yii;

/**
 * This is the model class for table "catalog_eav_attribute".
 *
 * @property int $attribute_id Attribute ID
 * @property string $frontend_input_renderer Frontend Input Renderer
 * @property int $is_global Is Global
 * @property int $is_visible Is Visible
 * @property int $is_searchable Is Searchable
 * @property int $is_filterable Is Filterable
 * @property int $is_comparable Is Comparable
 * @property int $is_visible_on_front Is Visible On Front
 * @property int $is_html_allowed_on_front Is HTML Allowed On Front
 * @property int $is_used_for_price_rules Is Used For Price Rules
 * @property int $is_filterable_in_search Is Filterable In Search
 * @property int $used_in_product_listing Is Used In Product Listing
 * @property int $used_for_sort_by Is Used For Sorting
 * @property string $apply_to Apply To
 * @property int $is_visible_in_advanced_search Is Visible In Advanced Search
 * @property int $position Position
 * @property int $is_wysiwyg_enabled Is WYSIWYG Enabled
 * @property int $is_used_for_promo_rules Is Used For Promo Rules
 * @property int $is_required_in_admin_store Is Required In Admin Store
 * @property int $is_used_in_grid Is Used in Grid
 * @property int $is_visible_in_grid Is Visible in Grid
 * @property int $is_filterable_in_grid Is Filterable in Grid
 * @property double $search_weight Search Weight
 * @property string $additional_data Additional swatch attributes data
 */
class CatalogEavAttribute extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'catalog_eav_attribute';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['attribute_id'], 'required'],
            [['attribute_id', 'is_global', 'is_visible', 'is_searchable', 'is_filterable', 'is_comparable', 'is_visible_on_front', 'is_html_allowed_on_front', 'is_used_for_price_rules', 'is_filterable_in_search', 'used_in_product_listing', 'used_for_sort_by', 'is_visible_in_advanced_search', 'position', 'is_wysiwyg_enabled', 'is_used_for_promo_rules', 'is_required_in_admin_store', 'is_used_in_grid', 'is_visible_in_grid', 'is_filterable_in_grid'], 'integer'],
            [['search_weight'], 'number'],
            [['additional_data'], 'string'],
            [['frontend_input_renderer', 'apply_to'], 'string', 'max' => 255],
            [['attribute_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'attribute_id' => 'Attribute ID',
            'frontend_input_renderer' => 'Frontend Input Renderer',
            'is_global' => 'Is Global',
            'is_visible' => 'Is Visible',
            'is_searchable' => 'Is Searchable',
            'is_filterable' => 'Is Filterable',
            'is_comparable' => 'Is Comparable',
            'is_visible_on_front' => 'Is Visible On Front',
            'is_html_allowed_on_front' => 'Is Html Allowed On Front',
            'is_used_for_price_rules' => 'Is Used For Price Rules',
            'is_filterable_in_search' => 'Is Filterable In Search',
            'used_in_product_listing' => 'Used In Product Listing',
            'used_for_sort_by' => 'Used For Sort By',
            'apply_to' => 'Apply To',
            'is_visible_in_advanced_search' => 'Is Visible In Advanced Search',
            'position' => 'Position',
            'is_wysiwyg_enabled' => 'Is Wysiwyg Enabled',
            'is_used_for_promo_rules' => 'Is Used For Promo Rules',
            'is_required_in_admin_store' => 'Is Required In Admin Store',
            'is_used_in_grid' => 'Is Used In Grid',
            'is_visible_in_grid' => 'Is Visible In Grid',
            'is_filterable_in_grid' => 'Is Filterable In Grid',
            'search_weight' => 'Search Weight',
            'additional_data' => 'Additional Data',
        ];
    }
}
