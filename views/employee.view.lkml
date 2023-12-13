view: employee {
  sql_table_name: `Betsy_dataset.Employee` ;;

  dimension: base_rate {
    type: number
    sql: ${TABLE}.BaseRate ;;
  }
  dimension: birth_date {
    type: string
    sql: ${TABLE}.BirthDate ;;
  }
  dimension: current_flag {
    type: number
    sql: ${TABLE}.CurrentFlag ;;
  }
  dimension: department_name {
    type: string
    sql: ${TABLE}.DepartmentName ;;
  }
  dimension: email_address {
    type: string
    sql: ${TABLE}.EmailAddress ;;
  }
  dimension: emergency_contact_name {
    type: string
    sql: ${TABLE}.EmergencyContactName ;;
  }
  dimension: emergency_contact_phone {
    type: string
    sql: ${TABLE}.EmergencyContactPhone ;;
  }
  dimension: employee_business_entity_id {
    type: number
    sql: ${TABLE}.EmployeeBusinessEntityID ;;
  }
  dimension: end_date {
    type: string
    sql: ${TABLE}.EndDate ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }
  dimension: hire_date {
    type: string
    sql: ${TABLE}.HireDate ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }
  dimension: marital_status {
    type: string
    sql: ${TABLE}.MaritalStatus ;;
  }
  dimension: middle_name {
    type: string
    sql: ${TABLE}.MiddleName ;;
  }
  dimension: parent_employee_business_entity_id {
    type: number
    sql: ${TABLE}.ParentEmployeeBusinessEntityID ;;
  }
  dimension: pay_frequency {
    type: number
    sql: ${TABLE}.PayFrequency ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }
  dimension: salaried_flag {
    type: number
    sql: ${TABLE}.SalariedFlag ;;
  }
  dimension: sales_person_flag {
    type: number
    sql: ${TABLE}.SalesPersonFlag ;;
  }
  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }
  dimension: sick_leave_hours {
    type: number
    sql: ${TABLE}.SickLeaveHours ;;
  }
  dimension: start_date {
    type: string
    sql: ${TABLE}.StartDate ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  dimension: vacation_hours {
    type: number
    sql: ${TABLE}.VacationHours ;;
  }
  measure: count {
    type: count
    drill_fields: [first_name, middle_name, department_name, last_name, emergency_contact_name]
  }
}
