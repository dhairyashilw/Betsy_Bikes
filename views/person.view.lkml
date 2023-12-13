view: person {
  sql_table_name: `Betsy_dataset.Person` ;;

  dimension: business_entity_id {
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }
  dimension: email_promotion {
    type: number
    sql: ${TABLE}.EmailPromotion ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }
  dimension: middle_name {
    type: string
    sql: ${TABLE}.MiddleName ;;
  }
  dimension: name_style {
    type: number
    sql: ${TABLE}.NameStyle ;;
  }
  dimension: person_type {
    type: string
    sql: ${TABLE}.PersonType ;;
  }
  dimension: suffix {
    type: string
    sql: ${TABLE}.Suffix ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  measure: count {
    type: count
    drill_fields: [first_name, last_name, middle_name]
  }
}
