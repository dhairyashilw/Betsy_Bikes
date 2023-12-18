view: sales_order_header {
  sql_table_name: `Betsy_dataset.SalesOrderHeader` ;;

  dimension: account_number {
    type: string
    sql: ${TABLE}.AccountNumber ;;
  }
  dimension: bill_to_address_id {
    type: number
    sql: ${TABLE}.BillToAddressID ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }
  dimension: freight {
    type: number
    sql: ${TABLE}.Freight ;;
  }
  dimension: local_currency {
    type: string
    sql: ${TABLE}.LocalCurrency ;;
  }
  dimension: online_order_flag {
    type: number
    sql: ${TABLE}.OnlineOrderFlag ;;
  }
  dimension_group: order_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.OrderDate ;;
  }
  dimension: purchase_order_number {
    type: string
    sql: ${TABLE}.PurchaseOrderNumber ;;
  }
  dimension: revision_number {
    type: number
    sql: ${TABLE}.RevisionNumber ;;
  }
  dimension: sales_order_id {
    type: number
    sql: ${TABLE}.SalesOrderID ;;
  }
  dimension: sales_order_number {
    type: string
    sql: ${TABLE}.SalesOrderNumber ;;
  }
  dimension: ship_method_id {
    type: number
    sql: ${TABLE}.ShipMethodID ;;
  }
  dimension: ship_to_address_id {
    type: number
    sql: ${TABLE}.ShipToAddressID ;;
  }
  dimension: status {
    type: number
    sql: ${TABLE}.Status ;;
  }
  dimension: tax_amt {
    type: number
    sql: ${TABLE}.TaxAmt ;;
  }
  dimension: territory_id {
    type: number
    sql: CASE
    WHEN ${TABLE}.OnlineOrderFlag = -1 THEN 11
    ELSE ${TABLE}.TerritoryID
  END ;;
  }

  measure: count {
    type: count
    drill_fields: [customer.customer_id]
  }
}
