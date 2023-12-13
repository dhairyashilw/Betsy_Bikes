connection: "betsy"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: betsy_bikes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: betsy_bikes_default_datagroup

explore: sales_order_header {}
