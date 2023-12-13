view: sales_territory_history {
  sql_table_name: `Betsy_dataset.SalesTerritoryHistory` ;;

  dimension: business_entity_id {
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }
  dimension_group: end_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndDate ;;
  }
  dimension_group: start_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: FORMAT_DATE('%Y-%d-%m',${TABLE}.StartDate) ;;
  }
  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }
  measure: count {
    type: count
  }
}
