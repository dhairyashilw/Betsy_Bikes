view: store {
  sql_table_name: `Betsy_dataset.Store` ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.StoreID ;;
  }
  dimension: sales_person_id {
    type: number
    sql: ${TABLE}.SalesPersonID ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.StoreName ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id, store_name, customer.count]
  }
}
