*** Settings ***
Documentation    A resource file of locators (xpaths) related to the Rave Portal.


*** Variables ***
#***************************** Login Page Elements *****************************
${login_logo_locator}	  	             xpath=//img[@src="/static/img/SC-Logo-Login.png"]
${login_brand_locator}                   xpath=//div[@id="brand"]//h1

${login_input_username_locator}          xpath=//input[@id="inputUsername"]
${login_input_password_locator}          xpath=//input[@id="inputPassword"]
${login_button_locator}		             xpath=//button[@id="login_submit"]


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
${adm_role_filter_username_locator}                xpath=//*[@id="filter-button-menu-roles"]//a[text()="Name"]
${adm_role_filter_email_locator}                   xpath=//*[@id="filter-button-menu-roles"]//a[text()="Description"]
${adm_role_filter_status_locator}                  xpath=//*[@id="filter-button-menu-roles"]//a[text()="Date updated"]

${adm_role_active_filter_text_locator}             xpath=//div[@id="filters-div-roles"]//p[text()="Active filters:"]
${adm_role_active_filter_by_locator}               xpath=//div[@id="filters-div-roles"]//li[last()]//span[@class="label label-info"]
${adm_role_active_filter_x_locator}                xpath=//div[@id="filters-div-roles"]//li[last()]//span[@class="pficon pficon-close"]
${adm_role_active_filter_clear_locator}            xpath=//div[@id="filters-div-roles"]//a[text()="Clear All Filters"]

${adm_role_table_label_locator}                    xpath=//div[@id="datatable_roles_length"]/label
${adm_role_table_length_locator}                   xpath=//div[@id="datatable_roles_length"]//select[@name="datatable_roles_length"]

${adm_role_table_locator}                          xpath=//table[@id="datatable_roles"]
${adm_role_table_colhead_username_locator}         xpath=//*[@id="colhead-username" and text()="User name"]
${adm_role_table_colhead_email_locator}            xpath=//*[@id="colhead-email" and text()="Email"]
${adm_role_table_colhead_status_locator}           xpath=//*[@id="colhead-status" and text()="Status"]

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
${adm_create_role_input_description_locator}       ${adm_create_role_prompt_label_desc_locator}/${adm_detail_input_text}

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
${nav_bar_serviceDesk_locator}			xpath=//ul[@class="nav navbar-nav navbar-primary"]//li/a[@href="/tenantportal/helpdesk/"]
${Home_Breadcrumb}						xpath=//ul[@class="breadcrumb"]//li/a[@href="/"]
${ServiceDesk_Breadcrumb}				xpath=//ul[@class="breadcrumb"]//li/a[@href="/tenantportal/helpdesk/"]
${ActiveBreadcrumb}						xpath=//ul[@class="breadcrumb"]//li[@class="active"]
${SideMenu_Knowledgebase_Collapsed}		xpath=//div[@id="accordion"]//h4/a[@class="collapsed" and contains(text(),"Knowledgebase")]
${SideMenu_Ticket_Collapsed}			xpath=//div[@id="accordion"]//h4/a[@class="collapsed" and contains(text(),"Tickets")]
${SideMenu_Ticket_Expanded}				xpath=//div[@id="collapseTicket"]/preceding-sibling::div[@class="panel-heading"]//h4/a[@href="#collapseTicket" and contains(text(),"Ticket")]
${SideMenu_Knowledgebase_Expanded}		xpath=//div[@id="Knowledgebase"]/preceding-sibling::div[@class="panel-heading"]//h4/a[@href="#Knowledgebase" and contains(text(),"Knowledgebase")]
#*************************** Service Desk New Ticket Page Elements ***************************
${SideMenu_NewTickets}					xpath=//li[@id="create_ticket"]/a[@href="/tenantportal/helpdesk/" and contains(text(),"New Ticket")]
${SideMenu_MyTickets}					xpath=//li[@id="view_tickets"]/a[@href="/tenantportal/helpdesk/mytickets/" and contains(text(),"My Tickets")]
${SideMenu_Categories}					xpath=//li[@id="knowledgebase_nav"]/a[@href="/tenantportal/helpdesk/kb/" and contains(text(),"Categories")]
${NewTicketPageTitle}					xpath=//div[@class="portlet-title"]/h2
${NewTicketPanelTitle}					xpath=//div[@class="panel-heading"]/h3
${NewTicketPanelBody}					xpath=//div[@class="panel-body"]/p		
${CategoryControlLabel}					xpath=//label[@for="id_queue"] 
${CategoryDropDown}						xpath=//select[@id="id_queue"]
${CategoryErrorValidation}				xpath=//select[@id="id_queue"]/following-sibling::span
${IssueSummaryControlLabel}				xpath=//label[@for="id_title"] 
${IssueSummaryInputBox}					xpath=//input[@id="id_title"]
${IssueSummaryErrorValidation}			xpath=//input[@id="id_title"]/following-sibling::span
${IssueDescriptionControlLabel}			xpath=//label[@for="id_body"]
${IssueDescriptionInputBox}				xpath=//textarea[@id="id_body"]
${IssueDescriptionHelp}					xpath=//textarea[@id="id_body"]/following-sibling::p
${IssueDescriptionErrorValidation}		xpath=//textarea[@id="id_body"]/following-sibling::span
${PriorityControlLabel}					xpath=//label[@for="id_priority"]
${PriorityDropDown}						xpath=//select[@id="id_priority"]
${PriorityHelp}							xpath=//select[@id="id_priority"]/following-sibling::p
${AttachedFileControlLabel}				xpath=//label[@for="id_attachment"]
${AttachedFileButton}					xpath=//input[@id="id_attachment"]
${AttachedFileHelp}						xpath=//input[@id="id_attachment"]/following-sibling::p
${SubmitButton}							xpath=//input[@value="Submit Ticket"]
#*************************** Service Desk My Tickets ***************************
${MyTicketPageTitle}					xpath=//div[@class="portlet-title"]/div[@class="caption"]/h2
${MyTicketTableLabel}					xpath=//div[@id="datatable_length"]/label
${MyTicketsFilterButton}	            xpath=//div[@class="input-group-btn"]//button[@id="filter-button"]
${MyTicketsFilterBy}                 	xpath=//div[@class="input-group"]//input[@id="filter"]
${MyTicketsFilterButtonMenu}			xpath=//ul[@id="filter-button-menu" and @class="dropdown-menu"]
${MyTicketsFilterByTitle}				xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Title")]
${MyTicketsFilterByCategory}			xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Category")]
${MyTicketsFilterByPriority}			xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Priority")]
${MyTicketsFilterByPriorityButton}		xpath=//div[@id="priority-button"]/button[@class="btn btn-default dropdown-toggle"]
${MyTicketsFilterByPriorityCritical}	xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"Critical")]
${MyTicketsFilterByPriorityHigh}		xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"High")]
${MyTicketsFilterByPriorityNormal}		xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"Normal")]
${MyTicketsFilterByPriorityLow}			xpath=//ul[@id="priority-button-menu"]/li/a[contains(text(),"Low")]
${MyTicketsFilterByStatus}				xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Status")]
${MyTicketsFilterByStatusButton}		xpath=//div[@id="status-button"]/button[@class="btn btn-default dropdown-toggle"]
${MyTicketsFilterByStatusOpen}			xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Open")]
${MyTicketsFilterByStatusReopened}		xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Reopened")]
${MyTicketsFilterByStatusClosed}		xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Closed")]
${MyTicketsFilterByStatusDuplicate}		xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Duplicate")]
${MyTicketsFilterByStatusResolved}		xpath=//ul[@id="status-button-menu"]/li/a[contains(text(),"Resolved")]
${MyTicketsFilterByCreatedDate}			xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Created Date")]
${MyTicketsFilterByCreatedDateToday}        xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Today")]
${MyTicketsFilterByCreatedDateYesterday}    xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Yesterday")]
${MyTicketsFilterByCreatedDate7days}		xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last 7 Days")]
${MyTicketsFilterByCreatedDatelast30days}   xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last 30 Days")]
${MyTicketsFilterByCreatedDateThisMonth}    xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"This Month")]
${MyTicketsFilterByCreatedDateLastMonth}    xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Last Month")]
${MyTicketsFilterByCreatedDateCustom}       xpath=//div[@class="daterangepicker dropdown-menu opensright"]//li[contains(text(),"Custom Range")]
${MyTicketsFilterBySubmitter}			xpath=//ul[@id="filter-button-menu"]/li/a[contains(text(),"Submitter")]
${MyTicketActiveFilter}					xpath=//div[@id="filters-div"]//ul//span[@class="label label-info"]
${MyTicketClearAllFilter}				xpath=//p[@id="clear-filters"]
${MyTicketsTableLength}					xpath=//div[@id="datatable_length"]//select[@name="datatable_length"]
${MyTicketsTable}						xpath=//table[@id="datatable"]
${MyTicketRows}							//table[@id="datatable"]/tbody/tr[@role="row"]
${MyTicketTicket#Col}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-ticket"]
${MyTicketTitleCol}						xpath=//table[@id="datatable"]//tr/th[@id="colhead-title"]
${MyTicketCategoryCol}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-category"]
${MyTicketPriorityCol}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-priority"]
${MyTicketStatusCol}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-status"]
${MyTicketCreatedCol}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-created"]
${MyTicketSubmitterCol}					xpath=//table[@id="datatable"]//tr/th[@id="colhead-submitter"] 
${MyTicketTableInfo}					xpath=//div[@id="datatable_info"]
${MyTicketTableCurrentPage}		        xpath=//div[@id="datatable_paginate"]//div[@class="pagination-input"]
${MyTicketTablePages}	                xpath=//div[@id="datatable_paginate"]//span[@class="paginate_of"] 
${MyTicketsFirstPage}					xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-double-left"]	
${MyTicketsPreviousPage}				xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-left"]	
${MyTicketsNextPage}					xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-right"]	
${MyTicketsLastPage}					xpath=//div[@id="datatable_paginate"]//span[@class="i fa fa-angle-double-right"]
${MyTicketsPageNumberInput}				xpath=//div[@id="datatable_paginate"]//input[@class="paginate_input"]

#*************************** Service Desk Tickets Details ***************************
${TicketHeader}							xpath=//div[@id="breadcrumb-row-id"]/following-sibling::div[@class="portlet light"]//h2
${TicketBodyFrame}						xpath=//iframe[@id="mce_2_ifr"]
${TicketBody}							xpath=//body[@id="tinymce" and @contenteditable="false"]
${Attachement}							xpath=//div[@class="attachments"]/ul/li
${TicketRespondHeader}					xpath=//div[@id="add-followup"]/h3
${TicketRespondToEmailLabel}			xpath=//form[@id="followupForm"]//dt/label	
${TicketRespondToEmailBox}				xpath=//form[@id="followupForm"]//div/input[@type="text"]
${CommentIframe}						xpath=//iframe[@id="id_comment_ifr"]		
${CommentAutoBody}						xpath=//body[@id="tinymce" and @contenteditable="true"]
${LabelCommentBox}						xpath=//form[@id="followupForm"]//dt/label[@for="commentBox"]
${CommentAttachedFile}					xpath=//p[@id="ShowFileUploadPara"]/a[@id="ShowFileUpload"]
${AddFollowupButton}					xpath=//input[@type="submit" and @value="Add Followup"]
${CommentAccordion}						xpath=//div[@id="followupsSection"]/div[@id="accordion"]				
${CommentCount}							//div[@id="followupsSection"]/div[@class="panel-group"]/div[@class="panel panel-default"]
${Iframe}								xpath=//iframe
${TicketTinymce}						//body[@id="tinymce"]				
	