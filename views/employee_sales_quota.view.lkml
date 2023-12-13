view: employee_sales_quota {
  sql_table_name: `Betsy_dataset.EmployeeSalesQuota` ;;

  dimension_group: f1 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.F1 ;;
  }
  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }
  dimension: sales_person_id {
    type: string
    sql: ${TABLE}.SalesPersonID ;;
  }
  measure: count {
    type: count
  }
}
