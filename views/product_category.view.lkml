view: product_category {
  sql_table_name: `Betsy_dataset.ProductCategory` ;;

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: product_category_id {
    type: number
    sql: ${TABLE}.ProductCategoryID ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
