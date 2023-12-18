view: new_sales_territory_history {
  derived_table: {
    sql: SELECT
        BusinessEntityID,
        COALESCE(EndDate,(SELECT MAX(OrderDate) FROM SalesOrderHeader)) AS EndDate,
        FORMAT_DATE('%Y-%d-%m',StartDate) AS StartDate,
        TerritoryID
      FROM SalesTerritoryHistory ;;
    datagroup_trigger: betsy_bikes_default_datagroup
  }

  dimension: business_entity_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }

  dimension: end_date {
    type: date
    datatype: date
    sql: ${TABLE}.EndDate ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}.StartDate ;;
  }

  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }

  set: detail {
    fields: [
      business_entity_id,
      end_date,
      start_date,
      territory_id
    ]
  }
}
