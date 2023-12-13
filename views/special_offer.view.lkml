view: special_offer {
  sql_table_name: `Betsy_dataset.SpecialOffer` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }
  dimension: discount_pct {
    type: number
    sql: ${TABLE}.DiscountPct ;;
  }
  dimension: special_offer_id {
    type: number
    sql: ${TABLE}.SpecialOfferID ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }
  measure: count {
    type: count
  }
}
