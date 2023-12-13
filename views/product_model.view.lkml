view: product_model {
  sql_table_name: `Betsy_dataset.ProductModel` ;;

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: product_model_id {
    type: number
    sql: ${TABLE}.ProductModelID ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
