view: vendor {
  sql_table_name: `Betsy_dataset.Vendor` ;;

  dimension: account_number {
    type: string
    sql: ${TABLE}.AccountNumber ;;
  }
  dimension: active_flag {
    type: number
    sql: ${TABLE}.ActiveFlag ;;
  }
  dimension: business_entity_id {
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }
  dimension: credit_rating {
    type: number
    sql: ${TABLE}.CreditRating ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: preferred_vendor_status {
    type: number
    sql: ${TABLE}.PreferredVendorStatus ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
