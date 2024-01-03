view: sales_order_detail {
  sql_table_name: `Betsy_dataset.SalesOrderDetail` ;;

  dimension: carrier_tracking_number {
    type: string
    sql: ${TABLE}.CarrierTrackingNumber ;;
  }
  dimension: due_date {
    type: string
    sql: ${TABLE}.DueDate ;;
  }
  dimension: order_qty {
    type: number
    sql: ${TABLE}.OrderQty ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProductID ;;
  }
  dimension: sales_order_detail_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.SalesOrderDetailID ;;
  }
  dimension: sales_order_id {
    type: number
    sql: ${TABLE}.SalesOrderID ;;
  }
  dimension: ship_date {
    type: string
    sql: ${TABLE}.ShipDate ;;
  }
  dimension: special_offer_id {
    type: number
    sql: ${TABLE}.SpecialOfferID ;;
  }
  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }
  dimension: unit_price_discount {
    type: number
    sql: ${TABLE}.UnitPriceDiscount ;;
  }
  measure: count {
    type: count
    drill_fields: [product.product_id, product.name]
  }
  dimension: sales{
    type: number
    sql: ${order_qty}*${unit_price}*(1-${unit_price_discount}) ;;
    description: "Sales"
  }
  measure:  total_sales{
    type:  sum
    sql: ${order_qty}*${unit_price}*(1-${unit_price_discount}) ;;
    description: "Total Sales"
    value_format_name: usd
  }
}
