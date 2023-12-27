connection: "betsy"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: betsy_bikes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: betsy_bikes_default_datagroup

explore: sales_order_header {
  label: "Sales vs Quota"
  join: sales_territory_history {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${sales_order_header.territory_id} = ${sales_territory_history.territory_id} ;;
    sql_where: ${sales_territory_history.start_date_date} <= ${sales_order_header.order_date_date}
     AND ${sales_order_header.order_date_date} <= ${sales_territory_history.end_date_date};;
    fields: []
  }
  join: sales_order_detail {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_order_header.sales_order_id} = ${sales_order_detail.sales_order_id} ;;
    fields: [sales_order_detail.total_sales]
  }
  join: quota {
    type: left_outer
    relationship: many_to_many
    sql_on: ${sales_territory_history.business_entity_id} = ${quota.sales_person_id}
          AND ${sales_order_header.order_date_quarter} = ${quota.quota_quarter};;
    sql_where: ${sales_territory_history.start_date_date} <= ${quota.quota_date}
          AND ${quota.quota_date} <= ${sales_territory_history.end_date_date};;
  }
  join: person {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sales_territory_history.business_entity_id} = ${person.business_entity_id} ;;
    fields: [person.first_name,person.middle_name,person.last_name]
  }
}
