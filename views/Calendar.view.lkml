
view: calendar {
  derived_table: {
    sql: SELECT Date
      FROM UNNEST(
          GENERATE_DATE_ARRAY(DATE((select FORMAT_DATE('%Y-%d-%m',MIN(StartDate)) from `lookerstudy-406606.Betsy_dataset.SalesTerritoryHistory`)), (select MAX(OrderDate) from `lookerstudy-406606.Betsy_dataset.SalesOrderHeader`), INTERVAL 1 DAY)
      ) as Date ;;
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  set: detail {
    fields: [
      date
    ]
  }
}
