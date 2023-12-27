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
    sql: CASE
    WHEN ${TABLE}.SalesPerson_ID = 'Website' THEN '285'
    ELSE ${TABLE}.SalesPerson_ID
    END;;
  }
  dimension: new_sales_person_id {
    type: string
    sql: ${sales_person_id} ;;
  }
  measure: quotas {
    type: list
    list_field: data }
}
