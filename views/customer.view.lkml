view: customer {
  sql_table_name: `Betsy_dataset.Customer` ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.CustomerID ;;
  }
  dimension: account_number {
    type: string
    sql: ${TABLE}.AccountNumber ;;
  }
  dimension: person_id {
    type: number
    sql: ${TABLE}.PersonID ;;
  }
  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.StoreID ;;
  }
  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_id, store.store_id, store.store_name, sales_order_header.count]
  }
}
