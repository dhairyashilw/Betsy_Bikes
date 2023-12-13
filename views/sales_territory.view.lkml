view: sales_territory {
  sql_table_name: `Betsy_dataset.SalesTerritory` ;;

  dimension: country_region_code {
    type: string
    sql: ${TABLE}.CountryRegionCode ;;
  }
  dimension: group {
    type: string
    sql: ${TABLE}.`Group` ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
