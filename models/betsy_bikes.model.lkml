connection: "betsy"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: betsy_bikes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: betsy_bikes_default_datagroup

# explore: sales_order_header {
#   label: "Sales vs Quota"
#   join: sales_territory_history {
#     type:  left_outer
#     relationship: many_to_one
#     sql_on: ${sales_order_header.territory_id} = ${sales_territory_history.territory_id} ;;
#     sql_where: ${sales_territory_history.start_date_date} <= ${sales_order_header.order_date_date}
#     AND ${sales_order_header.order_date_date} <= ${sales_territory_history.end_date_date};;
#     fields: []
#   }
#   join: sales_order_detail {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${sales_order_header.sales_order_id} = ${sales_order_detail.sales_order_id} ;;
#     fields: [sales_order_detail.total_sales]
#   }
#   join: quota {
#     type: left_outer
#     relationship: many_to_many
#     sql_on: ${sales_territory_history.business_entity_id} = ${quota.sales_person_id}
#           AND ${sales_order_header.order_date_quarter} = ${quota.quota_quarter};;
#     sql_where: ${sales_territory_history.start_date_date} <= ${quota.quota_date}
#           AND ${quota.quota_date} <= ${sales_territory_history.end_date_date};;
#     fields: [quota.data,quota.quotas,quota.quotass]
#   }
#   join: person {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${sales_territory_history.business_entity_id} = ${person.business_entity_id} ;;
#     fields: [person.first_name,person.middle_name,person.last_name]
#   }
# }

# explore: calendar {
#   join: sales_order_header {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${calendar.date} = ${sales_order_header.order_date_date} ;;
#     sql_where: (SELECT DATE_ADD(MAX(OrderDate),INTERVAL -1 YEAR) FROM `Betsy_dataset.SalesOrderHeader`) <= ${sales_order_header.order_date_date}
#       AND ${sales_order_header.order_date_date} <= (SELECT MAX(OrderDate) FROM `Betsy_dataset.SalesOrderHeader`) ;;
#     fields: []
#   }
#   join: sales_territory_history {
#     type:  left_outer
#     relationship: many_to_one
#     sql_on: ${sales_order_header.territory_id} = ${sales_territory_history.territory_id} ;;
#     sql_where: ${sales_territory_history.start_date_date} <= ${sales_order_header.order_date_date}
#       AND ${sales_order_header.order_date_date} <= ${sales_territory_history.end_date_date};;
#     fields: []
#   }
#   join: sales_order_detail {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${sales_order_header.sales_order_id} = ${sales_order_detail.sales_order_id} ;;
#   }
#   join: quota {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${calendar.date} = ${quota.quota_date} AND ${sales_territory_history.business_entity_id} = ${quota.sales_person_id};;
#     sql_where: (SELECT DATE_ADD(MAX(OrderDate),INTERVAL -1 YEAR) FROM `Betsy_dataset.SalesOrderHeader`) <= ${quota.quota_date}
#       AND ${quota.quota_date} <= (SELECT MAX(OrderDate) FROM `Betsy_dataset.SalesOrderHeader`) ;;
#     fields: [quota.data]
#   }
# }


explore: sales {
  from: sales_order_header
  join: sales_order_detail {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales.sales_order_id} = ${sales_order_detail.sales_order_id} ;;
  }
  join: customer {
    type: left_outer
    relationship: one_to_many
    sql_on: ${customer.customer_id}=${sales.customer_id} ;;
  }
  join: person {
    type: left_outer
    relationship: one_to_many
    sql_on: ${person.business_entity_id}=${customer.person_id} ;;
  }
  join: product {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sales_order_detail.product_id} = ${product.product_id} ;;
  }
  join: product_subcategory {
    type: left_outer
    relationship: many_to_one
    sql_on: ${product.product_subcategory_id} = ${product_subcategory.product_subcategory_id} ;;
  }
  join: product_category {
    type: left_outer
    relationship: many_to_one
    sql_on: ${product_subcategory.product_category_id} = ${product_category.product_category_id} ;;
  }
  join: sales_territory {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sales.territory_id} = ${sales_territory.territory_id} ;;
  }
}

explore: sales_order_header {}
