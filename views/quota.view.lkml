view: quota {
  sql_table_name: `Betsy_dataset.Quota` ;;

  dimension: data {
    type: number
    sql: ${TABLE}.Data ;;
  }
  dimension_group: quota {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.QuotaDate ;;
  }
  dimension: sales_person_id {
    type: string
    sql: ${TABLE}.SalesPerson_ID ;;
  }
  measure: quotas {
    type: list
    list_field: data }
}
