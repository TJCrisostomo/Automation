*** Settings ***
Documentation    A resource file of Keywords related to testing of Rave Tenant Portal's Administration tab.

Resource        ../resource/resource_portal.robot

*** Keywords ***
Construct User Elements
    [Arguments]                       ${user}                                           ${status}
    ${adm_table}=                     Set Variable                                      ${adm_table_body_locator}//td[text()="${user}"]
    Set Suite Variable                ${adm_table_email_locator}                        ${adm_table}
    Update User Status Element        ${status}
    Set Suite Variable                ${adm_table_roles_locator}                        ${adm_table}/${adm_table_roles}
    ${today}=                         Get Current Date
    ${exp_date}=                      Convert Date                       ${today}       result_format=%m/%d/%Y
    Set Suite Variable                ${adm_table_lastlogin_locator}                    ${adm_table}/following-sibling::td[text()="${exp_date}"]
    Set Suite Variable                ${adm_table_details_locator}                      ${adm_table}/${adm_table_details}
    Set Suite Variable                ${adm_table_action_locator}                       ${adm_table}/${adm_table_action}
    Set Suite Variable                ${adm_table_action_edit_locator}                  ${adm_table}/${adm_table_action_edit}
    Set Suite Variable                ${adm_table_action_deactivate_locator}            ${adm_table}/${adm_table_action_deactivate}
    Set Suite Variable                ${adm_table_action_activate_locator}              ${adm_table}/${adm_table_action_activate}
    # Role Assign User Prompt
    Set Suite Variable                ${adm_role_user_prompt_user_locator}              xpath=//li[text()="${user}"]
    Set Suite Variable                ${adm_role_user_prompt_user_available_locator}    ${adm_role_user_prompt_user_locator}/${adm_role_user_in_available_users}
    Set Suite Variable                ${adm_role_user_prompt_user_assigned_locator}     ${adm_role_user_prompt_user_locator}/${adm_role_user_in_assigned_users}
    
    
Construct Role Elements
    [Arguments]                       ${role}                                           ${desc}
    ${adm_table}=                     Set Variable                                      ${adm_role_table_body_locator}//td[text()="${role}"]
    ${desc_length}=                   Get Length                                        ${desc}
    ${end_index}=                     Set Variable If
    ...                               ${desc_length} > 50                               50
    ...                               ${desc_length} <= 50                              ${desc_length}
    ${desc_substring}=                Get Substring                                     ${desc}          0     ${end_index}
    Set Suite Variable                ${adm_role_table_name_locator}                    ${adm_table}
    Set Suite Variable                ${adm_role_table_desc_locator}                    ${adm_table}/following-sibling::td[contains(text(),"${desc_substring}")]
    Set Suite Variable                ${adm_role_table_permissions_locator}             ${adm_table}/${adm_role_table_permissions}
    ${today}=                         Get Current Date
    ${exp_date}=                      Convert Date                       ${today}       result_format=%m/%d/%Y
    Set Suite Variable                ${adm_role_table_date_locator}                    ${adm_table}/following-sibling::td[text()="${exp_date}"]
    Set Suite Variable                ${adm_role_table_details_locator}                 ${adm_table}/${adm_role_table_details}
    Set Suite Variable                ${adm_role_table_action_locator}                  ${adm_table}/${adm_role_table_action}
    Set Suite Variable                ${adm_role_table_action_users_locator}            ${adm_table}/${adm_role_table_action_users}
    Set Suite Variable                ${adm_role_table_action_permissions_locator}      ${adm_table}/${adm_role_table_action_permissions}
    Set Suite Variable                ${adm_role_table_action_edit_locator}             ${adm_table}/${adm_role_table_action_edit}
    Set Suite Variable                ${adm_role_table_action_delete_locator}           ${adm_table}/${adm_role_table_action_delete}
    # Update User Prompt - Role list
    Set Suite Variable                ${adm_update_user_role_name_locator}              ${adm_update_user_input_roles_button_locator}/following-sibling::div//span[text()="${role}"]
    Set Suite Variable                ${adm_update_user_role_desc_locator}              ${adm_update_user_role_name_locator}/small[text()="(${desc})"]
    

Update User Status Element
    [Arguments]                       ${status}
    Set Suite Variable                ${adm_table_status_locator}                       ${adm_table_email_locator}/following-sibling::td[text()="${status}"]
    
    
Go To Administration Tab    
    Wait Until Element Is Enabled     ${nav_bar_administration_locator}
    Click Link                        ${nav_bar_administration_locator}
    Wait Until Element Is Enabled     ${adm_filter_button_locator}

#Click Paging Element
#    [Arguments]                       ${paging_locator}
#    ${element_visible}=               Run Keyword And Ignore Error          Element Should Be Visible    ${paging_locator}
#    Run Keyword And Return If         'PASS' in ${element_visible}          Click Element                ${paging_locator}
#    ${element_location}=              Get Location                          ${paging_locator}
#    Execute Javascript                window.scrollTo(${element_location[x]},${element_location[y]})
#    Click Element                     ${paging_locator}


Verify Newly Created User
    [Arguments]                       ${name}
    :FOR    ${i}    IN RANGE    999
    \  Sleep                          5 seconds
    \  ${email_visible}=              Run Keyword And Ignore Error          Element Should Be Visible    ${adm_table_email_locator}
    \  Run Keyword If                 'PASS' in ${email_visible}            Exit For Loop
    \  ${next_page_status}=           Get Element Attribute                 ${adm_table_next_page_locator}/..@class
    \  ${next_page_enabled}=          Run Keyword And Ignore Error          Should Not Contain           ${next_page_status}    disabled
    \  Run Keyword If                 'PASS' in ${next_page_enabled}        Click Element                ${adm_table_next_page_locator}
    \  ...  ELSE                      Run Keywords                          FAIL                         New user is not created
    \  ...  AND                       Capture Page Screenshot
    \  Scroll To Top
    Element Should Be Visible         ${adm_table_status_locator}
    Element Text Should Be            ${adm_table_roles_locator}            ${EMPTY}
    Element Should Not Be Visible     ${adm_table_lastlogin_locator}
    Element Should Be Visible         ${adm_table_details_locator}
    Element Should Be Visible         ${adm_table_action_locator}


Verify Newly Created Role
    [Arguments]                       ${name}
    :FOR    ${i}    IN RANGE    999
    \  Sleep                          5 seconds
    \  ${role_visible}=               Run Keyword And Ignore Error          Element Should Be Visible    ${adm_role_table_name_locator}
    \  Run Keyword If                 'PASS' in ${role_visible}             Exit For Loop
    \  ${next_page_status}=           Get Element Attribute                 ${adm_role_table_next_page_locator}/..@class
    \  ${next_page_enabled}=          Run Keyword And Ignore Error          Should Not Contain           ${next_page_status}    disabled
    \  Run Keyword If                 'PASS' in ${next_page_enabled}        Click Element                ${adm_role_table_next_page_locator}
    \  ...  ELSE                      Run Keywords                          FAIL                         New role is not created
    \  ...  AND                       Capture Page Screenshot
    \  Scroll To Top
    Element Should Be Visible        ${adm_role_table_date_locator}
    Element Text Should Be           ${adm_role_table_permissions_locator}          ${EMPTY}
    Element Should Be Visible        ${adm_role_table_details_locator}
    Element Should Be Visible        ${adm_role_table_action_locator}
    

Verify Users Filter By Elements
    [Arguments]                       ${filter_by_value}                    ${active_filter}
    Wait Until Element Is Visible     ${adm_active_filter_text_locator}
    Element Should Be Visible	      ${adm_active_filter_by_locator}
    ${filter_by_combine}=             Catenate                              ${active_filter}               ${filter_by_value}
    Element Should Contain            ${adm_active_filter_by_locator}       ${filter_by_combine}
    Element Should Be Visible         ${adm_active_filter_x_locator}
    Element Should Be Visible         ${adm_active_filter_clear_locator}
	
Verify Roles Filter By Elements
    [Arguments]                       ${filter_by_value}                    ${active_filter}                
    Wait Until Element Is Visible     ${adm_role_active_filter_text_locator}
    Element Should Be Visible	      ${adm_role_active_filter_by_locator}
    ${filter_by_combine}=             Catenate                              ${active_filter}               ${filter_by_value}
    Element Should Contain            ${adm_role_active_filter_by_locator}  ${filter_by_combine}
    Element Should Be Visible         ${adm_role_active_filter_x_locator}
    Element Should Be Visible         ${adm_role_active_filter_clear_locator}
	
	
Verify Users Empty Data Table
    Sleep                             5 seconds
    Element Should Contain            ${adm_table_empty_locator}            No users match your selection
    Element Should Contain            ${adm_table_info_locator}             Showing 0 Results
    Element Should Contain            ${adm_table_pages_locator}            of 0
	
Verify Roles Empty Data Table
    Sleep                             5 seconds
    Element Should Contain            ${adm_role_table_empty_locator}       No roles match your selection
    Element Should Contain            ${adm_role_table_info_locator}        Showing 0 Results
    Element Should Contain            ${adm_role_table_pages_locator}       of 0
	
Verify Users Data Table Result	
    [Arguments]                       ${filter_by_value}          ${col_number}
    ${total_items}=                   Get Number Of Items         ${adm_table_info_locator}
    ${last_page}=                     Get Last Page               ${total_items}          ${adm_table_length_locator}
    :FOR    ${page}    IN RANGE    1    ${last_page}+1
    \  ${row_count}=                  Get Matching Xpath Count    ${adm_table_row_xpath}
    \  ${show_entries}=               Get Selected List Value     ${adm_table_length_locator}
	\  Check Filtered Result          ${row_count}                ${filter_by_value}      ${adm_table_locator}          ${col_number}
    \  Check Page Infomation          ${page}                     ${last_page}            ${adm_table_pages_locator}    ${adm_table_current_page_locator}
    \  Check Table Information        ${page}                     ${show_entries}         ${total_items}                ${adm_table_row_xpath}        ${adm_table_info_locator}
    \  Check State of Page Navigation Buttons                     ${page}                 ${last_page}                  ${adm_table_pages_locator}    ${adm_table_first_page_locator}    ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
    \  Run Keyword If                 ${page} < ${last_page}      Click Element           ${adm_table_next_page_locator}
    \  Sleep                          2 Seconds
    \  Scroll To Top
	
Verify Roles Data Table Result	
    [Arguments]                       ${filter_by_value}          ${col_number}
    ${total_items}=                   Get Number Of Items         ${adm_role_table_info_locator}
    ${last_page}=                     Get Last Page               ${total_items}          ${adm_role_table_length_locator}
    :FOR    ${page}    IN RANGE    1    ${last_page}+1
    \  ${row_count}=                  Get Matching Xpath Count    ${adm_role_table_row_xpath}
    \  ${show_entries}=               Get Selected List Value     ${adm_role_table_length_locator}
	\  Check Filtered Result          ${row_count}                ${filter_by_value}      ${adm_role_table_locator}          ${col_number}
    \  Check Page Infomation          ${page}                     ${last_page}            ${adm_role_table_pages_locator}    ${adm_role_table_current_page_locator}
    \  Check Table Information        ${page}                     ${show_entries}         ${total_items}                     ${adm_role_table_row_xpath}        ${adm_role_table_info_locator}
    \  Check State of Page Navigation Buttons                     ${page}                 ${last_page}                       ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}    ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
    \  Run Keyword If                 ${page} < ${last_page}      Click Element           ${adm_role_table_next_page_locator}
    \  Sleep                          2 Seconds
    \  Scroll To Top

Verify Roles Date Range Result
    [Arguments]                       ${date_range_text}          ${col_number}
    ${date_start}=                    Get Substring               ${date_range_text}      0        10
    ${date_end}=                      Get Substring               ${date_range_text}      -10
    ${total_items}=                   Get Number Of Items         ${adm_role_table_info_locator}
    ${last_page}=                     Get Last Page               ${total_items}          ${adm_role_table_length_locator}
    :FOR    ${page}    IN RANGE    1    ${last_page}+1
    \  ${row_count}=                  Get Matching Xpath Count    ${adm_role_table_row_xpath}
    \  ${show_entries}=               Get Selected List Value     ${adm_role_table_length_locator}
    \  Check Filtered Result Date Range    ${row_count}           ${date_start}           ${date_end}                        ${adm_role_table_locator}          ${col_number}
    \  Check Page Infomation          ${page}                     ${last_page}            ${adm_role_table_pages_locator}    ${adm_role_table_current_page_locator}
    \  Check Table Information        ${page}                     ${show_entries}         ${total_items}                     ${adm_role_table_row_xpath}        ${adm_role_table_info_locator}
    \  Check State of Page Navigation Buttons                     ${page}                 ${last_page}                       ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}    ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
    \  Run Keyword If                 ${page} < ${last_page}      Click Element           ${adm_role_table_next_page_locator}
    \  Sleep                          2 Seconds
    \  Scroll To Top
    
	
Verify Users Table Sorting	
    [Arguments]                       ${order}                    ${col_number}           ${is_status_col}=False
    ${total_items}=                   Get Number Of Items         ${adm_table_info_locator}
    ${last_page}=                     Get Last Page               ${total_items}          ${adm_table_length_locator}
    ${show_entries}=                  Get Selected List Value     ${adm_table_length_locator}
    :FOR    ${page}    IN RANGE    1    ${last_page}+1
    \  ${table_list}=                 Get Table Column List       ${col_number}           ${adm_table_row_xpath}             ${adm_table_locator}
    \  ${list_count}=                 Get Length                  ${table_list}
    \  ${sorted_list}=                Run Keyword If              ${is_status_col}==True    Replace Status List As Bool      ${table_list}
    \  ...                            ELSE                                                  Copy List                        ${table_list}
    \  Check Sorting                  ${sorted_list}              ${list_count}           ${order}
    \  Check Page Infomation          ${page}                     ${last_page}            ${adm_table_pages_locator}         ${adm_table_current_page_locator}
    \  Check Table Information        ${page}                     ${show_entries}         ${total_items}                     ${adm_table_row_xpath}        ${adm_table_info_locator}
    \  Check State of Page Navigation Buttons                     ${page}                 ${last_page}                       ${adm_table_pages_locator}    ${adm_table_first_page_locator}    ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
    \  Run Keyword If                 ${page} < ${last_page}      Click Element           ${adm_table_next_page_locator}
    \  Sleep                          2 Seconds
    \  Scroll To Top
    
	
Verify Roles Table Sorting	
    [Arguments]                       ${order}                    ${col_number}           ${is_desc_col}=False
    ${total_items}=                   Get Number Of Items         ${adm_role_table_info_locator}
    ${last_page}=                     Get Last Page               ${total_items}          ${adm_role_table_length_locator}
    ${show_entries}=                  Get Selected List Value     ${adm_role_table_length_locator}
    :FOR    ${page}    IN RANGE    1    ${last_page}+1
    \  ${sorted_list}=                Get Table Column List       ${col_number}           ${adm_role_table_row_xpath}        ${adm_role_table_locator}
    \  ${list_count}=                 Get Length                  ${sorted_list}
    \  Check Sorting                  ${sorted_list}              ${list_count}           ${order}
    \  Check Page Infomation          ${page}                     ${last_page}            ${adm_role_table_pages_locator}    ${adm_role_table_current_page_locator}
    \  Check Table Information        ${page}                     ${show_entries}         ${total_items}                     ${adm_role_table_row_xpath}        ${adm_role_table_info_locator}
    \  Check State of Page Navigation Buttons                     ${page}                 ${last_page}                       ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}    ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
    \  Run Keyword If                 ${page} < ${last_page}      Click Element           ${adm_role_table_next_page_locator}
    \  Sleep                          2 Seconds
    \  Scroll To Top
    
    
Replace Status List As Bool
    [Arguments]                       ${status_list}
    ${count}=                         Get Length                  ${status_list}
    ${new_list}=                      Create List
    :FOR    ${i}    IN RANGE    ${count}
    \  Run Keyword If                 '${status_list[${i}]}'=='Active'      Append To List    ${new_list}    true
    \  ...    ELSE IF                 '${status_list[${i}]}'=='Inactive'    Append To List    ${new_list}    false
    \  ...    ELSE                    FAIL                                  Invalid status '${status_list[${i}]}'. Should be 'Active' or 'Inactive' only
    [Return]                          ${new_list}
    