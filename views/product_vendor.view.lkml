view: product_vendor {
  sql_table_name: `Betsy_dataset.ProductVendor` ;;

  dimension: average_lead_time {
    type: number
    sql: ${TABLE}.AverageLeadTime ;;
  }
  dimension: business_entity_id {
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }
  dimension: last_receipt_cost {
    type: number
    sql: ${TABLE}.LastReceiptCost ;;
  }
  dimension_group: last_receipt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.LastReceiptDate ;;
  }
  dimension: max_order_qty {
    type: number
    sql: ${TABLE}.MaxOrderQty ;;
  }
  dimension: min_order_qty {
    type: number
    sql: ${TABLE}.MinOrderQty ;;
  }
  dimension: on_order_qty {
    type: number
    sql: ${TABLE}.OnOrderQty ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProductID ;;
  }
  dimension: standard_price {
    type: number
    sql: ${TABLE}.StandardPrice ;;
  }
  dimension: unit_measure_code {
    type: string
    sql: ${TABLE}.UnitMeasureCode ;;
  }
  measure: count {
    type: count
    drill_fields: [product.product_id, product.name]
  }
}
