connection: "betsy"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: betsy_bikes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: betsy_bikes_default_datagroup

explore: sales_territory_history {
  join: sales_order_header {
    type: inner
    relationship: many_to_many
    sql_on: ${sales_territory_history.territory_id} = ${sales_order_header.territory_id} ;;
  }
}

explore: sales_order_header {
  join: sales_territory_history {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${sales_order_header.territory_id} = ${sales_territory_history.territory_id} ;;
  }
}
