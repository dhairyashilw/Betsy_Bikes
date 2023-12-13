view: product {
  sql_table_name: `Betsy_dataset.Product` ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ProductID ;;
  }
  dimension: class {
    type: string
    sql: ${TABLE}.Class ;;
  }
  dimension: color {
    type: string
    sql: ${TABLE}.Color ;;
  }
  dimension: days_to_manufacture {
    type: number
    sql: ${TABLE}.DaysToManufacture ;;
  }
  dimension: discontinued_date {
    type: string
    sql: ${TABLE}.DiscontinuedDate ;;
  }
  dimension: finished_goods_flag {
    type: number
    sql: ${TABLE}.FinishedGoodsFlag ;;
  }
  dimension: list_price {
    type: number
    sql: ${TABLE}.ListPrice ;;
  }
  dimension: make_flag {
    type: number
    sql: ${TABLE}.MakeFlag ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: product_line {
    type: string
    sql: ${TABLE}.ProductLine ;;
  }
  dimension: product_model_id {
    type: number
    sql: ${TABLE}.ProductModelID ;;
  }
  dimension: product_number {
    type: string
    sql: ${TABLE}.ProductNumber ;;
  }
  dimension: product_subcategory_id {
    type: number
    sql: ${TABLE}.ProductSubcategoryID ;;
  }
  dimension: reorder_point {
    type: number
    sql: ${TABLE}.ReorderPoint ;;
  }
  dimension: safety_stock_level {
    type: number
    sql: ${TABLE}.SafetyStockLevel ;;
  }
  dimension_group: sell_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.SellEndDate ;;
  }
  dimension_group: sell_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.SellStartDate ;;
  }
  dimension: size {
    type: string
    sql: ${TABLE}.Size ;;
  }
  dimension: size_unit_measure_code {
    type: string
    sql: ${TABLE}.SizeUnitMeasureCode ;;
  }
  dimension: standard_cost {
    type: number
    sql: ${TABLE}.StandardCost ;;
  }
  dimension: style {
    type: string
    sql: ${TABLE}.Style ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}.Weight ;;
  }
  dimension: weight_unit_measure_code {
    type: string
    sql: ${TABLE}.WeightUnitMeasureCode ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, name, sales_order_detail.count, product_vendor.count]
  }
}
