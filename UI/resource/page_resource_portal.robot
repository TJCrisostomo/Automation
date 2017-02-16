*** Settings ***
Documentation    A resource file of locators (xpaths) related to the Rave Portal.


*** Variables ***
#***************************** Login Page Elements *****************************
${login_logo_locator}	  	             xpath=//img[@src="/static/img/SC-Logo-Login.png"]
${login_brand_locator}                   xpath=//div[@id="brand"]//h1

${login_input_username_locator}          xpath=//input[@id="inputUsername"]
${login_input_password_locator}          xpath=//input[@id="inputPassword"]
${login_button_locator}		             xpath=//button[@id="login_submit"]

${login_error_toast_locator}             xpath=//div[@id="toast-container"]/div[@class="toast toast-error"]
${login_error_toast_message_locator}     ${login_error_toast_locator}/div[@class="toast-message"]


#**************************** Landing Page Elements ****************************
${nav_bar_xpath}                         //ul[@id="nav-menu-id"]/li
${nav_bar_home_locator}                  xpath=//ul[@id="nav-menu-id"]//a[text()="Home"]
${nav_bar_content_management_locator}    xpath=//ul[@id="nav-menu-id"]//a[text()="Content Management"]
${nav_bar_analytics_locator}             xpath=//ul[@id="nav-menu-id"]//a[text()="Analytics"]
${nav_bar_reporting_locator}             xpath=//ul[@id="nav-menu-id"]//a[text()="Reporting"]
${nav_bar_service_desk_locator}          xpath=//ul[@id="nav-menu-id"]//a[text()="Service Desk"]
${nav_bar_administration_locator}        xpath=//ul[@id="nav-menu-id"]//a[text()="Administration"]
${nav_bar_settings_locator}              xpath=//ul[@id="nav-menu-id"]//a[text()="Settings"]

${logout_locator}                        xpath=//a[@id="account_logout"]
${logout_prompt_locator}                 xpath=//div[@id="logout_id"]
${logout_prompt_logout_locator}          xpath=//div[@id="logout_id"]//button[text()="Log out"]

#**************************** Breadcumb Elements *******************************
${breadcrumb_home_locator}               xpath=//ul[@class="breadcrumb"]//a[@href="/"]
${breadcrumb_admin_locator}              xpath=//ul[@class="breadcrumb"]/li[contains(text(),"Administration")]

#****************************Calendar Date Picker*****************************************
${Calendar_left_input_locator}            xpath=//div[@class="calendar left"]//input[@name="daterangepicker_start"]
${Calendar_right_input_locator}           xpath=//div[@class="calendar right"]//input[@name="daterangepicker_end"]
${Calendar_outside_locator}               xpath=//div[@class="portlet light"]


#*************************** Reporting Page Elements ***************************
${loading_spinner_locator}               xpath=//div[@id="loadingDiv"]/div[@class="spinner"]

${rpt_caption_locator}                   xpath=//div[@class="caption"]/h2/span[contains(text(),"Reports")]

${rpt_filter_button_locator}             xpath=//div[@class="input-group-btn"]//button[@id="filter-button"]
${rpt_filter_by_locator}                 xpath=//div[@class="input-group"]//input[@id="filter"]

${rpt_filter_name_locator}               xpath=//div[@class="input-group-btn open"]//ul[@id="filter-dropdown-menu"]//a[contains(text(),"Name")]

${rpt_filter_type_locator}               xpath=//div[@class="input-group-btn open"]//ul[@id="filter-dropdown-menu"]//a[contains(text(),"Type")]

${rpt_filter_date_locator}               xpath=//div[@class="input-group-btn open"]//ul[@id="filter-dropdown-menu"]//a[contains(text(),"Creation Date")]
${rpt_filter_date_today_locator}         xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Today")]
${rpt_filter_date_yesterday_locator}     xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Yesterday")]
${rpt_filter_date_last7days_locator}     xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last 7 Days")]
${rpt_filter_date_last30days_locator}    xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last 30 Days")]
${rpt_filter_date_thismonth_locator}     xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"This Month")]
${rpt_filter_date_lastmonth_locator}     xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last Month")]
${rpt_filter_date_custom_locator}        xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Custom Range")]



${rpt_filter_interval_locator}           xpath=//div[@class="input-group-btn open"]//ul[@id="filter-dropdown-menu"]//a[contains(text(),"Interval")]
${rpt_interval_button_locator}           xpath=//div[@id="interval-button"]//button[@id="filter-interval-button"]
${rpt_interval_daily_locator}            xpath=//div[@id="interval-button"]//a[contains(text(),"Daily")]
${rpt_interval_weekly_locator}           xpath=//div[@id="interval-button"]//a[contains(text(),"Weekly")]
${rpt_interval_monthly_locator}          xpath=//div[@id="interval-button"]//a[contains(text(),"Monthly")]

${rpt_filter_format_locator}             xpath=//div[@class="input-group-btn open"]//ul[@id="filter-dropdown-menu"]//a[contains(text(),"Format")]
${rpt_format_button_locator}             xpath=//div[@id="format-button"]//button[@id="filter-format-button"]
${rpt_format_csv_locator}                xpath=//div[@id="format-button"]//a[contains(text(),"CSV")]
${rpt_format_excel_locator}              xpath=//div[@id="format-button"]//a[contains(text(),"Excel")]
${rpt_format_pdf_locator}                xpath=//div[@id="format-button"]//a[contains(text(),"PDF")]

${rpt_table_label_locator}               xpath=//div[@id="reportsTable_length"]//label
${rpt_table_length_locator}              xpath=//div[@id="reportsTable_length"]//select[@name="reportsTable_length"]

${rpt_table_locator}                     xpath=//table[@id="reportsTable"]
${rpt_table_empty_locator}               xpath=//table[@id="reportsTable"]//td[@class="dataTables_empty" and contains(text(),"No data available in table")]
${rpt_table_rows}                        //table[@id="reportsTable"]/tbody/tr[@role="row"]    #--- intentionally without the 'xpath=' prefix ---#
${rpt_table_name_locator}                xpath=//table[@id="reportsTable"]//tr[@role="row"]//th[contains(text(),"Name")]
${rpt_table_creation_date_locator}       xpath=//table[@id="reportsTable"]//tr[@role="row"]//th[contains(text(),"Creation Date")]
${rpt_table_type_locator}                xpath=//table[@id="reportsTable"]//tr[@role="row"]//th[contains(text(),"Type")]
${rpt_table_interval_locator}            xpath=//table[@id="reportsTable"]//tr[@role="row"]//th[contains(text(),"Interval")]
${rpt_table_format_locator}              xpath=//table[@id="reportsTable"]//tr[@role="row"]//th[contains(text(),"Format")]
${rpt_table_name_row_locator}            xpath=//table[@id="reportsTable"]/tbody//tr

${rpt_table_info_locator}                xpath=//div[@id="reportsTable_info"]

${rpt_table_first_page_locator}          xpath=//div[@id="reportsTable_paginate"]//span[@class="i fa fa-angle-double-left"]
${rpt_table_previous_page_locator}       xpath=//div[@id="reportsTable_paginate"]//span[@class="i fa fa-angle-left"]
${rpt_table_next_page_locator}           xpath=//div[@id="reportsTable_paginate"]//span[@class="i fa fa-angle-right"]
${rpt_table_last_page_locator}           xpath=//div[@id="reportsTable_paginate"]//span[@class="i fa fa-angle-double-right"]
${rpt_table_current_page_locator}        xpath=//div[@id="reportsTable_paginate"]//div[@class="pagination-input"]        
${rpt_table_pages_locator}               xpath=//div[@id="reportsTable_paginate"]//span[@class="paginate_of"]
${rpt_table_page_input_locator}          xpath=//div[@id="reportsTable_paginate"]//input[@class="paginate_input"]

${rpt_active_filter_text_locator}        xpath=//div[@id="filterRow"]//p[@id="filters-label" and contains(text(),"Active filters:")]
${rpt_active_filter_by_locator}          xpath=//div[@id="filterRow"]//li[last()]//span[@class="label label-info"]
${rpt_active_filter_x_locator}           xpath=//div[@id="filterRow"]//li[last()]//span[@class="pficon pficon-close"]
${rpt_active_filter_clear_locator}       xpath=//div[@id="filterRow"]//p[@id="clear-filters"]/a[contains(text(),"Clear All Filters")]


#**************************** Administration Page Elements *********************
${adm_admin_locator}                     xpath=//div[@class="panel-heading"]//a[contains(text(),Administration)]
${adm_users_text_locator}                xpath=//*[@id="users_nav_id"]/a[text()="Users"]
${adm_users_icon_locator}                xpath=//*[@id="users_nav_id"]/a[text()="Users"]/i[@class="fa pficon-user fa-lg"]
${adm_roles_text_locator}                xpath=//*[@id="roles_nav_id"]/a[text()="Roles"]
${adm_roles_icon_locator}                xpath=//*[@id="roles_nav_id"]/a[text()="Roles"]/i[@class="fa pficon-users fa-lg"]

#*** Users Page ***
${adm_caption_users_locator}             xpath=//div[@class="caption"]/h2[text()="Users"]
${adm_create_user_locator}               xpath=//button[text()="Create new user"]

${adm_filter_button_locator}             xpath=//button[@id="filter-button"]
${adm_filter_by_locator}                 xpath=//input[@id="filter"]
${adm_filter_email_locator}              xpath=//*[@id="filter-button-menu"]//a[text()="Email"]
${adm_filter_status_locator}             xpath=//*[@id="filter-button-menu"]//a[text()="Status"]
${adm_filter_status_select_locator}      xpath=//div[@id="status-button"]/button
${adm_filter_status_select_active_locator}      ${adm_filter_status_select_locator}/following-sibling::ul//a[text()="Active"]
${adm_filter_status_select_inactive_locator}    ${adm_filter_status_select_locator}/following-sibling::ul//a[text()="Inactive"]

${adm_table_label_locator}               xpath=//div[@id="datatable_users_length"]/label
${adm_table_length_locator}              xpath=//div[@id="datatable_users_length"]//select[@name="datatable_users_length"]

${adm_table_locator}                     xpath=//table[@id="datatable_users"]
${adm_table_colhead_email_locator}       xpath=//*[@id="colhead-email" and text()="Email"]
${adm_table_colhead_status_locator}      xpath=//*[@id="colhead-status" and text()="Status"]
${adm_table_colhead_lastlogin_locator}   xpath=//*[@id="colhead-lastlogin" and text()="Last login"]

${adm_table_row_xpath}                   //table[@id="datatable_users"]/tbody/tr[@role="row"]
${adm_table_body_locator}                xpath=//*[@id="datatable_users"]/tbody
${adm_table_roles}                       following-sibling::td[2]
${adm_table_details}                     following-sibling::td//button[text()="Details"]
${adm_table_action}                      following-sibling::td//button[@id="dropdownKebab"]
${adm_table_action_edit}                 following-sibling::td//a[text()="Edit"]
${adm_table_action_deactivate}           following-sibling::td//a[text()="Deactivate"]
${adm_table_action_activate}             following-sibling::td//a[text()="Activate"]
# Placeholder constructed in "Construct User Elements" keyword
${adm_table_email_locator}
${adm_table_roles_locator}
${adm_table_lastlogin_locator}
${adm_table_status_locator}
${adm_table_details_locator}
${adm_table_action_locator}
${adm_table_action_edit_locator}
${adm_table_action_deactivate_locator}
${adm_table_action_activate_locator}

${adm_table_empty_locator}               xpath=//*[@id="datatable_users"]/tbody//td[@class="dataTables_empty"]
${adm_table_info_locator}                id=datatable_users_info

${adm_table_paging_locator}              xpath=//div[@id="datatable_users_paginate"]
${adm_table_first_page_locator}          ${adm_table_paging_locator}//span[@class="i fa fa-angle-double-left"]
${adm_table_previous_page_locator}       ${adm_table_paging_locator}//span[@class="i fa fa-angle-left"]
${adm_table_next_page_locator}           ${adm_table_paging_locator}//span[@class="i fa fa-angle-right"]
${adm_table_last_page_locator}           ${adm_table_paging_locator}//span[@class="i fa fa-angle-double-right"]
${adm_table_current_page_locator}        ${adm_table_paging_locator}//input[@class="paginate_input"]
${adm_table_pages_locator}               ${adm_table_paging_locator}//span[@class="paginate_of"]

${adm_detail_input_text}                           following-sibling::div/input
${adm_detail_input_textarea}                       following-sibling::div/textarea
${adm_detail_input_button}                         following-sibling::div//button
${adm_create_user_prompt_locator}                  xpath=//div[@id="users-create-new-user-modal"]
${adm_create_user_prompt_header_locator}           ${adm_create_user_prompt_locator}//h4[@class="modal-title"]
${adm_create_user_prompt_close_locator}            ${adm_create_user_prompt_locator}//button[@class="close"]/span[@class="pficon pficon-close"]
${adm_create_user_prompt_cancel_locator}           ${adm_create_user_prompt_locator}//button[text()="Cancel"]
${adm_create_user_prompt_save_locator}             ${adm_create_user_prompt_locator}//button[text()="Save"]
${adm_create_user_prompt_label_email_locator}      ${adm_create_user_prompt_locator}//label[@for="textinput-users-email"]
${adm_create_user_prompt_label_password_locator}   ${adm_create_user_prompt_locator}//label[@for="textinput-users-password"]
${adm_create_user_prompt_label_firstname_locator}  ${adm_create_user_prompt_locator}//label[@for="textinput-users-firstname"]
${adm_create_user_prompt_label_lastname_locator}   ${adm_create_user_prompt_locator}//label[@for="textinput-users-lastname"]
${adm_create_user_prompt_label_address_locator}    ${adm_create_user_prompt_locator}//label[@for="textinput-users-address"]
${adm_create_user_prompt_label_number_locator}     ${adm_create_user_prompt_locator}//label[@for="textinput-users-number"]
${adm_create_user_prompt_label_roles_locator}      ${adm_create_user_prompt_locator}//label[@for="textinput-users-roles"]
${adm_create_user_prompt_label_status_locator}     ${adm_create_user_prompt_locator}//label[@for="textinput-users-status"]
${adm_create_user_input_email_locator}             ${adm_create_user_prompt_label_email_locator}/${adm_detail_input_text}
${adm_create_user_input_password_locator}          ${adm_create_user_prompt_label_password_locator}/${adm_detail_input_text}
${adm_create_user_input_firstname_locator}         ${adm_create_user_prompt_label_firstname_locator}/${adm_detail_input_text}
${adm_create_user_input_lastname_locator}          ${adm_create_user_prompt_label_lastname_locator}/${adm_detail_input_text}
${adm_create_user_input_address_locator}           ${adm_create_user_prompt_label_address_locator}/${adm_detail_input_textarea}
${adm_create_user_input_number_locator}            ${adm_create_user_prompt_label_number_locator}/${adm_detail_input_text}
${adm_create_user_input_roles_button_locator}      ${adm_create_user_prompt_label_roles_locator}/${adm_detail_input_button}
${adm_create_user_input_status_button_locator}     ${adm_create_user_prompt_label_status_locator}/${adm_detail_input_button}
${adm_create_user_input_status_button_active_locator}      ${adm_create_user_input_status_button_locator}/following-sibling::div//a/span[text()="Active"]
${adm_create_user_input_status_button_inactive_locator}    ${adm_create_user_input_status_button_locator}/following-sibling::div//a/span[text()="Inactive"]

${adm_user_detail_prompt_locator}                  xpath=//div[@id="users-user-details-modal"]
${adm_user_detail_prompt_header_locator}           ${adm_user_detail_prompt_locator}//h4[@class="modal-title"]
${adm_user_detail_prompt_close_locator}            ${adm_user_detail_prompt_locator}//button[@class="close"]/span[@class="pficon pficon-close"]
${adm_user_detail_prompt_ok_locator}               ${adm_user_detail_prompt_locator}//button[text()="OK"]
${adm_user_detail_prompt_label_email_locator}      ${adm_user_detail_prompt_locator}//label[@for="textinput-users-email"]
${adm_user_detail_prompt_label_firstname_locator}  ${adm_user_detail_prompt_locator}//label[@for="textinput-users-firstname"]
${adm_user_detail_prompt_label_lastname_locator}   ${adm_user_detail_prompt_locator}//label[@for="textinput-users-lastname"]
${adm_user_detail_prompt_label_address_locator}    ${adm_user_detail_prompt_locator}//label[@for="textinput-users-address"]
${adm_user_detail_prompt_label_number_locator}     ${adm_user_detail_prompt_locator}//label[@for="textinput-users-number"]
${adm_user_detail_prompt_label_roles_locator}      ${adm_user_detail_prompt_locator}//label[@for="textinput-users-roles"]
${adm_user_detail_prompt_label_status_locator}     ${adm_user_detail_prompt_locator}//label[@for="textinput-users-status"]
${adm_user_detail_input_email_locator}             ${adm_user_detail_prompt_label_email_locator}/${adm_detail_input_text}
${adm_user_detail_input_firstname_locator}         ${adm_user_detail_prompt_label_firstname_locator}/${adm_detail_input_text}
${adm_user_detail_input_lastname_locator}          ${adm_user_detail_prompt_label_lastname_locator}/${adm_detail_input_text}
${adm_user_detail_input_address_locator}           ${adm_user_detail_prompt_label_address_locator}/${adm_detail_input_textarea}
${adm_user_detail_input_number_locator}            ${adm_user_detail_prompt_label_number_locator}/${adm_detail_input_text}
${adm_user_detail_input_roles_locator}             ${adm_user_detail_prompt_label_roles_locator}/${adm_detail_input_text}
${adm_user_detail_input_status_locator}            ${adm_user_detail_prompt_label_status_locator}/${adm_detail_input_text}

${adm_update_user_prompt_locator}                  xpath=//div[@id="users-update-user-modal"]
${adm_update_user_prompt_header_locator}           ${adm_update_user_prompt_locator}//h4[@class="modal-title"]
${adm_update_user_prompt_close_locator}            ${adm_update_user_prompt_locator}//button[@class="close"]/span[@class="pficon pficon-close"]
${adm_update_user_prompt_cancel_locator}           ${adm_update_user_prompt_locator}//button[text()="Cancel"]
${adm_update_user_prompt_save_locator}             ${adm_update_user_prompt_locator}//button[text()="Save"]
${adm_update_user_prompt_label_email_locator}      ${adm_update_user_prompt_locator}//label[@for="textedit-users-username"]
${adm_update_user_prompt_label_firstname_locator}  ${adm_update_user_prompt_locator}//label[@for="textedit-users-firstname"]
${adm_update_user_prompt_label_lastname_locator}   ${adm_update_user_prompt_locator}//label[@for="textedit-users-lastname"]
${adm_update_user_prompt_label_address_locator}    ${adm_update_user_prompt_locator}//label[@for="textedit-users-address"]
${adm_update_user_prompt_label_number_locator}     ${adm_update_user_prompt_locator}//label[@for="textedit-users-number"]
${adm_update_user_prompt_label_roles_locator}      ${adm_update_user_prompt_locator}//label[@for="textedit-users-roles"]
${adm_update_user_prompt_label_status_locator}     ${adm_update_user_prompt_locator}//label[@for="textedit-users-status"]
${adm_update_user_input_email_locator}             ${adm_update_user_prompt_label_email_locator}/${adm_detail_input_text}
${adm_update_user_input_firstname_locator}         ${adm_update_user_prompt_label_firstname_locator}/${adm_detail_input_text}
${adm_update_user_input_lastname_locator}          ${adm_update_user_prompt_label_lastname_locator}/${adm_detail_input_text}
${adm_update_user_input_address_locator}           ${adm_update_user_prompt_label_address_locator}/${adm_detail_input_textarea}
${adm_update_user_input_number_locator}            ${adm_update_user_prompt_label_number_locator}/${adm_detail_input_text}
${adm_update_user_input_roles_button_locator}      ${adm_update_user_prompt_label_roles_locator}/${adm_detail_input_button}
${adm_update_user_input_status_button_locator}     ${adm_update_user_prompt_label_status_locator}/${adm_detail_input_button}
# Placeholder constructed in "Construct Role Elements" keyword
${adm_update_user_role_name_locator}
${adm_update_user_role_desc_locator}

${adm_user_activation_prompt_locator}               xpath=//div[@id="users-user-activation-modal"]
${adm_user_activation_prompt_cancel_locator}        ${adm_user_activation_prompt_locator}//button[text()="Cancel"]
${adm_user_activation_prompt_ok_locator}            ${adm_user_activation_prompt_locator}//button[text()="OK"]
${adm_user_activation_prompt_alert_locator}         ${adm_user_activation_prompt_locator}//div[@class="alert alert-warning"]
${adm_user_activation_prompt_alert_icon_locator}    ${adm_user_activation_prompt_alert_locator}/span[@class="pficon pficon-warning-triangle-o"]
${adm_user_activation_prompt_alert_status_locator}  ${adm_user_activation_prompt_alert_locator}//span[@id="user-activation-operation"]
${adm_user_activation_prompt_alert_email_locator}   ${adm_user_activation_prompt_alert_locator}//span[@id="user-activation-username"]

${adm_active_filter_text_locator}                  xpath=//div[@id="filters-div"]//p[text()="Active filters:"]
${adm_active_filter_by_locator}                    xpath=//div[@id="filters-div"]//li[last()]//span[@class="label label-info"]
${adm_active_filter_x_locator}                     xpath=//div[@id="filters-div"]//li[last()]//span[@class="pficon pficon-close"]
${adm_active_filter_clear_locator}                 xpath=//div[@id="filters-div"]//a[text()="Clear All Filters"]

#*** Roles Page ***
${adm_caption_roles_locator}                       xpath=//div[@class="caption"]/h2[text()="Roles"]
${adm_create_role_locator}                         xpath=//button[text()="Create new role"]

${adm_role_filter_button_locator}                  xpath=//button[@id="filter-button-roles"]
${adm_role_filter_by_locator}                      xpath=//input[@id="filter-roles"]
${adm_role_filter_name_locator}                    xpath=//*[@id="filter-button-menu-roles"]//a[text()="Name"]
${adm_role_filter_desc_locator}                    xpath=//*[@id="filter-button-menu-roles"]//a[text()="Description"]
${adm_role_filter_date_locator}                    xpath=//*[@id="filter-button-menu-roles"]//a[text()="Date updated"]

${adm_role_active_filter_text_locator}             xpath=//div[@id="filters-div-roles"]//p[text()="Active filters:"]
${adm_role_active_filter_by_locator}               xpath=//div[@id="filters-div-roles"]//li[last()]//span[@class="label label-info"]
${adm_role_active_filter_x_locator}                xpath=//div[@id="filters-div-roles"]//li[last()]//span[@class="pficon pficon-close"]
${adm_role_active_filter_clear_locator}            xpath=//div[@id="filters-div-roles"]//a[text()="Clear All Filters"]

${adm_role_table_label_locator}                    xpath=//div[@id="datatable_roles_length"]/label
${adm_role_table_length_locator}                   xpath=//div[@id="datatable_roles_length"]//select[@name="datatable_roles_length"]

${adm_role_table_locator}                          xpath=//table[@id="datatable_roles"]
${adm_role_table_colhead_name_locator}             ${adm_role_table_locator}//th[@id="colhead-roles-name"]
${adm_role_table_colhead_desc_locator}             ${adm_role_table_locator}//th[@id="colhead-roles-description"]
${adm_role_table_colhead_date_locator}             ${adm_role_table_locator}//th[@id="colhead-roles-updated"]

${adm_role_table_row_xpath}                        //table[@id="datatable_roles"]/tbody/tr[@role="row"]
${adm_role_table_body_locator}                     xpath=//*[@id="datatable_roles"]/tbody
${adm_role_table_empty_locator}                    ${adm_role_table_body_locator}//td[@class="dataTables_empty"]
${adm_role_table_info_locator}                     id=datatable_roles_info
${adm_role_table_permissions}                      following-sibling::td[2]
${adm_role_table_details}                          following-sibling::td//button[text()="Details"]
${adm_role_table_action}                           following-sibling::td//button[@id="dropdownKebab_roles"]
${adm_role_table_action_users}                     following-sibling::td//a[text()="Users"]
${adm_role_table_action_permissions}               following-sibling::td//a[text()="Permissions"]
${adm_role_table_action_edit}                      following-sibling::td//a[text()="Edit"]
${adm_role_table_action_delete}                    following-sibling::td//a[text()="Delete"]
# Placeholder constructed in "Construct Role Elements" keyword
${adm_role_table_name_locator}
${adm_role_table_desc_locator}
${adm_role_table_permissions_locator}
${adm_role_table_date_locator}
${adm_role_table_details_locator}
${adm_role_table_action_locator}
${adm_role_table_action_users_locator}
${adm_role_table_action_permissions_locator}
${adm_role_table_action_edit_locator}
${adm_role_table_action_delete_locator}

${adm_role_table_paging_locator}                   xpath=//div[@id="datatable_roles_paginate"]
${adm_role_table_first_page_locator}               ${adm_role_table_paging_locator}//span[@class="i fa fa-angle-double-left"]
${adm_role_table_previous_page_locator}            ${adm_role_table_paging_locator}//span[@class="i fa fa-angle-left"]
${adm_role_table_next_page_locator}                ${adm_role_table_paging_locator}//span[@class="i fa fa-angle-right"]
${adm_role_table_last_page_locator}                ${adm_role_table_paging_locator}//span[@class="i fa fa-angle-double-right"]
${adm_role_table_current_page_locator}             ${adm_role_table_paging_locator}//input[@class="paginate_input"]
${adm_role_table_pages_locator}                    ${adm_role_table_paging_locator}//span[@class="paginate_of"]

${adm_create_role_prompt_locator}                  xpath=//div[@id="roleModal"]
${adm_create_role_prompt_header_locator}           ${adm_create_role_prompt_locator}//h4[@class="modal-title"]
${adm_create_role_prompt_close_locator}            ${adm_create_role_prompt_locator}//button[@class="close"]/span[@class="pficon pficon-close"]
${adm_create_role_prompt_cancel_locator}           ${adm_create_role_prompt_locator}//button[text()="Cancel"]
${adm_create_role_prompt_save_locator}             ${adm_create_role_prompt_locator}//button[text()="Save"]
${adm_create_role_prompt_ok_locator}               ${adm_create_role_prompt_locator}//button[text()="OK"]
${adm_create_role_prompt_label_name_locator}       ${adm_create_role_prompt_locator}//label[@for="textinput-roles-name"]
${adm_create_role_prompt_label_desc_locator}       ${adm_create_role_prompt_locator}//label[@for="textinput-roles-description"]
${adm_create_role_input_name_locator}              ${adm_create_role_prompt_label_name_locator}/${adm_detail_input_text}
${adm_create_role_input_description_locator}       ${adm_create_role_prompt_label_desc_locator}/${adm_detail_input_textarea}

${adm_role_delete_prompt_locator}                  xpath=//div[@id="deleteRoleModal"]
${adm_role_delete_prompt_cancel_locator}           ${adm_role_delete_prompt_locator}//button[text()="Cancel"]
${adm_role_delete_prompt_delete_locator}           ${adm_role_delete_prompt_locator}//button[text()="Delete"]
${adm_role_delete_prompt_alert_locator}            ${adm_role_delete_prompt_locator}//div[@class="alert alert-warning"]
${adm_role_delete_prompt_alert_icon_locator}       ${adm_role_delete_prompt_alert_locator}/span[@class="pficon pficon-warning-triangle-o"]
${adm_role_delete_prompt_alert_name_locator}       ${adm_role_delete_prompt_alert_locator}//label[@id="deleteRole-name"]

${adm_role_permission_prompt_locator}              xpath=//div[@id="permissionsRoleModal"]
${adm_role_permission_prompt_header_locator}       ${adm_role_permission_prompt_locator}//h4[@class="modal-title"]
${adm_role_permission_prompt_close_locator}        ${adm_role_permission_prompt_locator}//button[@class="close"]
${adm_role_permission_prompt_cancel_locator}       ${adm_role_permission_prompt_locator}//button[text()="Cancel"]
${adm_role_permission_prompt_save_locator}         ${adm_role_permission_prompt_locator}//button[text()="Save"]
${adm_role_permission_prompt_alert_locator}        ${adm_role_permission_prompt_locator}//div[@class="alert alert-info"]
${adm_role_permission_available}                   div[contains(@class,"panel-default")]
${adm_role_permission_selected}                    div[contains(@class,"panel-primary")]
${adm_role_permission_prompt_available_locator}    ${adm_role_permission_prompt_locator}//${adm_role_permission_available}
${adm_role_permission_prompt_selected_locator}     ${adm_role_permission_prompt_locator}//${adm_role_permission_selected}
# Roles prompt
${adm_role_administration_locator}                 xpath=//li[@id="rave_administration"]
${adm_role_analytics_locator}                      xpath=//li[@id="rave_analytics"]
${adm_role_content_management_locator}             xpath=//li[@id="rave_content_management"]
${adm_role_reporting_locator}                      xpath=//li[@id="rave_reporting"]
${adm_role_service_desk_locator}                   xpath=//li[@id="rave_servicedesk"]

${adm_role_user_prompt_locator}                    xpath=//div[@id="usersRoleModal"]
${adm_role_user_prompt_header_locator}             ${adm_role_user_prompt_locator}//h4[@class="modal-title"]
${adm_role_user_prompt_close_locator}              ${adm_role_user_prompt_locator}//button[@class="close"]
${adm_role_user_prompt_cancel_locator}             ${adm_role_user_prompt_locator}//button[text()="Cancel"]
${adm_role_user_prompt_save_locator}               ${adm_role_user_prompt_locator}//button[text()="Save"]
${adm_role_user_prompt_alert_locator}              ${adm_role_user_prompt_locator}//div[@class="alert alert-info"]
${adm_role_user_prompt_available_locator}          ${adm_role_user_prompt_locator}//div[contains(@class,"panel-default")]
${adm_role_user_prompt_assigned_locator}           ${adm_role_user_prompt_locator}//div[contains(@class,"panel-primary")]
${adm_role_user_prompt_filter_button_locator}      ${adm_role_user_prompt_locator}//button[contains(text(),"Email")]
${adm_role_user_prompt_filter_input_locator}       ${adm_role_user_prompt_locator}//input[@id="filter-roles-username"]
${adm_role_user_in_available_users}                parent::ul[@id="roles-available-users"]
${adm_role_user_in_assigned_users}                 parent::ul[@id="roles-selected-users"]

# Placeholder constructed in "Construct User Elements" keyword
${adm_role_user_prompt_user_locator}
${adm_role_user_prompt_user_available_locator}
${adm_role_user_prompt_user_assigned_locator}


#*************************** Service Desk Page Elements ***************************
${nav_bar_serviceDesk_locator}					xpath=//ul[@class="nav navbar-nav navbar-primary"]//li/a[@href="/tenantportal/helpdesk/"]
${home_breadcrumb_locator}						xpath=//ul[@class="breadcrumb"]//li/a[@href="/"]
${service_desk_breadcrumb_locator}				xpath=//ul[@class="breadcrumb"]//li/a[@href="/tenantportal/helpdesk/"]
${active_breadcrumb_locator}					xpath=//ul[@class="breadcrumb"]//li[@class="active"]
${sidemenu_knowledgebase_collapsed_locator}		xpath=//div[@id="accordion"]//h4/a[@class="collapsed" and contains(text(),"Knowledgebase")]
${sidemenu_ticket_collapsed_locator}			xpath=//div[@id="accordion"]//h4/a[@class="collapsed" and contains(text(),"Tickets")]
${sidemenu_ticket_expanded_locator}				xpath=//div[@id="collapseTicket"]/preceding-sibling::div[@class="panel-heading"]//h4/a[@href="#collapseTicket" and contains(text(),"Ticket")]
${sidemenu_knowledgebase_expanded_locator}		xpath=//div[@id="Knowledgebase"]/preceding-sibling::div[@class="panel-heading"]//h4/a[@href="#Knowledgebase" and contains(text(),"Knowledgebase")]
#*************************** Service Desk New Ticket Page Elements ***************************
${sidemenu_new_tickets_locator}					xpath=//li[@id="create_ticket"]/a[@href="/tenantportal/helpdesk/" and contains(text(),"New Ticket")]
${sidemenu_my_tickets_locator}					xpath=//li[@id="view_tickets"]/a[@href="/tenantportal/helpdesk/mytickets/" and contains(text(),"My Tickets")]
${sidemenu_categories_locator}					xpath=//li[@id="knowledgebase_nav"]/a[@href="/tenantportal/helpdesk/kb/" and contains(text(),"Categories")]
${new_ticket_page_title_locator}				xpath=//div[@class="portlet-title"]/h2
${new_ticket_panel_title_locator}				xpath=//div[@class="panel-heading"]/h3
${new_ticket_panel_body_locator}				xpath=//div[@class="panel-body"]/p		
${new_ticket_category_control_label_locator}				xpath=//label[@for="id_queue"] 
${new_ticket_category_drop_down_locator}					xpath=//select[@id="id_queue"]
${new_ticket_category_error_validation_locator}				xpath=//select[@id="id_queue"]/following-sibling::span
${new_ticket_issue_summary_control_label_locator}			xpath=//label[@for="id_title"] 
${new_ticket_issue_summary_input_box_locator}				xpath=//input[@id="id_title"]
${new_ticket_issue_summary_error_validation_locator}		xpath=//input[@id="id_title"]/following-sibling::span
${new_ticket_issue_description_control_label_locator}		xpath=//label[@for="id_body"]
${issue_description_input_box_locator}						xpath=//textarea[@id="id_body"]
${new_ticket_issue_description_help_locator}				xpath=//textarea[@id="id_body"]/following-sibling::p
${new_ticket_issue_description_error_validation_locator}		xpath=//textarea[@id="id_body"]/following-sibling::span
${new_ticket_priority_control_label_locator}					xpath=//label[@for="id_priority"]
${new_ticket_priority_drop_down_locator}						xpath=//select[@id="id_priority"]
${new_ticket_priority_help_locator}							xpath=//select[@id="id_priority"]/following-sibling::p
${new_ticket_attached_file_control_label_locator}				xpath=//label[@for="id_attachment"]
${new_ticket_attached_file_button_locator}					xpath=//input[@id="id_attachment"]
${new_ticket_attached_file_help_locator}						xpath=//input[@id="id_attachment"]/following-sibling::p
${new_ticket_submit_button_locator}							xpath=//input[@value="Submit Ticket"]
#*************************** Service Desk My Tickets ***************************
${my_ticket_Page_title_locator}						xpath=//div[@class="portlet-title"]/div[@class="caption"]/h2
${my_ticket_table_label_locator}					xpath=//div[@id="datatable_length"]/label
${my_tickets_filter_button_locator}	            	xpath=//div[@class="input-group-btn"]//button[@id="filter-button"]
${my_tickets_filter_by_locator}                 	xpath=//div[@class="input-group"]//input[@id="filter"]
${my_tickets_filter_button_menu_locator}			xpath=//ul[@id="filter-button-menu" and @class="dropdown-menu"]
${my_tickets_filter_by_title_locator}				xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Title")]
${my_tickets_filter_by_category_locator}			xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Category")]
${my_tickets_filter_by_priority_locator}			xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Priority")]
${my_tickets_filter_by_priority_button_locator}		xpath=//div[@id="priority-button"]/button[@class="btn btn-default dropdown-toggle"]
${my_tickets_filter_by_priority_critical_locator}	xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"Critical")]
${my_tickets_filter_by_priority_high_locator}		xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"High")]
${my_tickets_filter_by_priority_normal_locator}		xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"Normal")]
${my_tickets_filter_by_priority_low_locator}		xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"Low")]
${my_tickets_filter_by_status_locator}				xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Status")]
${my_tickets_filter_by_status_button_locator}		xpath=//div[@id="status-button"]/button[@class="btn btn-default dropdown-toggle"]
${my_tickets_filter_by_status_open_locator}			xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Open")]
${my_tickets_filter_by_status_reopen_locator}		xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Reopened")]
${my_tickets_filter_by_status_closed_locator}		xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Closed")]
${my_tickets_filter_by_status_duplicate_locator}	xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Duplicate")]
${my_tickets_filter_by_status_resolved_locator}		xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Resolved")]
${my_tickets_filter_by_created_date_locator}		xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Created Date")]
${my_tickets_filter_by_created_date_today_locator}	xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Today")]
${my_tickets_filter_by_created_date_yesterday_locator}    xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Yesterday")]
${my_tickets_filter_by_created_date_7days_locator}	xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last 7 Days")]
${my_tickets_filter_by_created_date_30days_locator} 	xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last 30 Days")]
${my_tickets_filter_by_created_date_this_month_locator}    xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"This Month")]
${my_tickets_filter_by_created_date_last_month_locator}    xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last Month")]
${my_tickets_filter_by_created_date_custom_locator}	       xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Custom Range")]
${my_tickets_filter_by_submitter_locator}			xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Submitter")]
${my_ticket_active_filter_locator}					xpath=//div[@id="filters-div"]//ul//span[@class="label label-info"]
${my_ticket_clear_all_filter_locator}				xpath=//p[@id="clear-filters"]
${my_tickets_table_length_locator}					xpath=//div[@id="datatable_length"]//select[@name="datatable_length"]
${my_tickets_table_locator}							xpath=//table[@id="datatable"]
${my_tickets_row_locator}							//table[@id="datatable"]/tbody/tr[@role="row"]
${my_tickets_ticket#_col_locator}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-ticket"]
${my_tickets_title_col_locator}						xpath=//table[@id="datatable"]//tr/th[@id="colhead-title"]
${my_tickets_category_col_locator}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-category"]
${my_tickets_priority_col_locator}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-priority"]
${my_tickets_status_col_locator}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-status"]
${my_tickets_created_col_locator}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-created"]
${my_tickets_submitter_col_locator}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-submitter"] 
${my_tickets_table_info_col_locator}				xpath=//div[@id="datatable_info"]
${my_tickets_table_current_page_locator}		    xpath=//div[@id="datatable_paginate"]//div[@class="pagination-input"]
${my_tickets_table_pages_locator}	                xpath=//div[@id="datatable_paginate"]//span[@class="paginate_of"] 
${my_tickets_first_page_locator}					xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-double-left"]	
${my_tickets_previous_page_locator}					xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-left"]	
${my_tickets_next_page_locator}						xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-right"]	
${my_tickets_last_page_locator}						xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-double-right"]
${my_tickets_page_number_input_locator}				xpath=//div[@id="datatable_paginate"]//input[@class="paginate_input"]

#*************************** Service Desk Tickets Details ***************************
${ticket_header_locator}							xpath=//div[@id="breadcrumb-row-id"]/following-sibling::div[@class="portlet light"]//h2
${ticket_body_frame_locator}						xpath=//iframe[@id="mce_2_ifr"]
${ticket_body_locator}								xpath=//body[@id="tinymce" and @contenteditable="false"]
${ticket_attachment_locator}						xpath=//div[@class="attachments"]/ul/li
${ticket_respond_header_locator}					xpath=//div[@id="add-followup"]/h3
${ticket_respond_to_email_label_locator}			xpath=//form[@id="followupForm"]//dt/label	
${ticket_respond_to_email_input_box_locator}		xpath=//form[@id="followupForm"]//div/input[@type="text"]
${ticket_comment_iframe_locator}					xpath=//iframe[@id="id_comment_ifr"]		
${ticket_comment_auto_body_locator}					xpath=//body[@id="tinymce" and @contenteditable="true"]
${ticket_comment_input_box_label_locator}			xpath=//form[@id="followupForm"]//dt/label[@for="commentBox"]
${ticket_comment_attached_file_locator}				xpath=//p[@id="ShowFileUploadPara"]/a[@id="ShowFileUpload"]
${ticket_add_follow_up_locator}						xpath=//input[@type="submit" and @value="Add Followup"]
${ticket_comments_accordion_locator}				xpath=//div[@id="followupsSection"]/div[@id="accordion"]				
${ticket_comments_count_locator}					//div[@id="followupsSection"]/div[@class="panel-group"]/div[@class="panel panel-default"]
${ticket_iframe_locator}							xpath=//iframe
${ticket_tinymce_locator}							//body[@id="tinymce"]				
	