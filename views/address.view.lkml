view: address {
  sql_table_name: `Betsy_dataset.Address` ;;
  drill_fields: [address_id]

  dimension: address_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.AddressID ;;
  }
  dimension: address_line1 {
    type: string
    sql: ${TABLE}.AddressLine1 ;;
  }
  dimension: address_line2 {
    type: string
    sql: ${TABLE}.AddressLine2 ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: country_region_code {
    type: string
    sql: ${TABLE}.CountryRegionCode ;;
  }
  dimension: country_region_name {
    type: string
    sql: ${TABLE}.CountryRegionName ;;
  }
  dimension: is_only_state_province_flag {
    type: number
    sql: ${TABLE}.IsOnlyStateProvinceFlag ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }
  dimension: state_province_code {
    type: string
    sql: ${TABLE}.StateProvinceCode ;;
  }
  dimension: state_province_name {
    type: string
    sql: ${TABLE}.StateProvinceName ;;
  }
  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }
  measure: count {
    type: count
    drill_fields: [address_id, country_region_name, state_province_name]
  }
}
