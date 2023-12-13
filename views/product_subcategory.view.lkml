view: product_subcategory {
  sql_table_name: `Betsy_dataset.ProductSubcategory` ;;

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: product_category_id {
    type: number
    sql: ${TABLE}.ProductCategoryID ;;
  }
  dimension: product_subcategory_id {
    type: number
    sql: ${TABLE}.ProductSubcategoryID ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
