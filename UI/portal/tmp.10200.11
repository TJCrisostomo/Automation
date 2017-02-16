*** Settings ***
Documentation    A test suite for testing the Administration Page of Rave Portal.

Resource          ../resource/resource_portal.robot
Resource          ../resource/keyword_portal_administration.robot

Suite Setup       Run Keywords          Open Rave Portal    Login Rave Portal    Prepare Data
Suite Teardown    Close All Browsers
Force Tags        In Progress


*** Variables ***
#************************ Administration Page Text Displays *************************
${adm_filter_by_placeholder_email}            Filter by Email...
${adm_filter_by_placeholder_status}           Select Status
${adm_filter_by_placeholder_email_prompt}     Filter by Email or Username...
${adm_filter_by_placeholder_rolename}         Filter by Name...
${adm_filter_by_placeholder_desc}             Filter by Description...
${adm_filter_by_placeholder_date}             Filter by Date updated...
${test_password}                              autotest

#**************************** Table Column Number ***********************************
# Users
${col_number_email}            1
${col_number_status}           2
${col_number_roles}            3
${col_number_lastlogin}        4
# Roles
${col_number_rolename}         1
${col_number_description}      2
${col_number_permission}       3
${col_number_lastupdated}      4

#**************************** Permission List ***************************************
# Update this list everytime a new tab is added. Also update the following test cases to include the new tab:
# * Action Role Permission Page Elements
# * Action Permission To Role
# * Login of New User Created
@{permission_list}             ${adm_role_administration_locator}    ${adm_role_analytics_locator}    ${adm_role_content_management_locator}
...                            ${adm_role_service_desk_locator}      ${adm_role_reporting_locator}         

# Number of Default Tabs: 2 is Home Tab and Settings Tab
${default_tab_count}           2


#******************** Creation Date Custom Range Interval **********************
${date_interval_start}    0
${date_interval_end}     90


*** Keywords ***
Prepare Data
    # Users
    ${random_username}=              Generate Random String    10    [LETTERS][NUMBERS]
    ${random_firstname}=             Generate Random String    20    [LETTERS][NUMBERS]-()
    ${random_lastname}=              Generate Random String    20    [LETTERS][NUMBERS]-()
    ${valid_email}=                  Set Variable                    auto_${random_username}@autotest.com
    ${valid_firstname}=              Set Variable                    Robot ${random_firstname}
    ${valid_lastname}=               Set Variable                    Framework ${random_lastname}
    ${valid_address}=                Generate Random String    200   [LETTERS][NUMBERS]-#.,;:'
    ${valid_number}=                 Generate Random String    20    [NUMBERS]-()+
    Set Suite Variable               ${valid_email}
    Set Suite Variable               ${valid_firstname}
    Set Suite Variable               ${valid_lastname}
    Set Suite Variable               ${valid_address}
    Set Suite Variable               ${valid_number}
    # Edit Users
    ${random_firstname}=             Generate Random String    10    [LETTERS][NUMBERS]-()
    ${random_lastname}=              Generate Random String    10    [LETTERS][NUMBERS]-()
    ${edited_firstname}=             Set Variable                    Robot ${random_firstname} edited
    ${edited_lastname}=              Set Variable                    Framework ${random_lastname} edited
    ${edited_address}=               Generate Random String    200   [LETTERS][NUMBERS]-#.,;:'
    ${edited_number}=                Generate Random String    20    [NUMBERS]-()+
    Set Suite Variable               ${edited_firstname}
    Set Suite Variable               ${edited_lastname}
    Set Suite Variable               ${edited_address}
    Set Suite Variable               ${edited_number}
    # Roles
    ${random_name}=                  Generate Random String    30    [LETTERS][NUMBERS]-_
    ${random_desc}=                  Generate Random String    180   [LETTERS][NUMBERS]-_#.,;:'
    ${role_name}=                    Set Variable                    autotest_role ${random_name}
    ${role_desc}=                    Set Variable                    autotest role ${random_desc}
    Set Suite Variable               ${role_name}
    Set Suite Variable               ${role_desc}
    # Edit Roles
    ${random_name}=                  Generate Random String    30    [LETTERS][NUMBERS] -_
    ${random_desc}=                  Generate Random String    180   [LETTERS][NUMBERS] -_#.,;:'
    ${role_name_new}=                Set Variable                    autotest_${random_name} edited
    ${role_desc_new}=                Set Variable                    autotest_${random_desc} edited
    Set Suite Variable               ${role_name_new}
    Set Suite Variable               ${role_desc_new}
    # Page Size
    ${length}=                       Get Length                ${PAGE_SIZE_LIST}
    ${index}=                        Evaluate                  random.randint(0, ${length}-1)    modules=random
    ${page_size}=                    Get From List             ${PAGE_SIZE_LIST}                 ${index}
    Set Suite Variable               ${page_size}


*** Test Cases ***
Administration Users Page Elements
    [Tags]                           Users    Roles    Filtering    Pagination    Sorting
    [Documentation]                  CADR-2891: Administration Users Page Elements
    Wait Until Element Is Enabled    ${nav_bar_administration_locator}
    Click Link                       ${nav_bar_administration_locator}
    Wait Until Element Is Enabled    ${breadcrumb_home_locator}
    Element Should Be Visible        ${breadcrumb_admin_locator}
    Element Should Be Visible        ${adm_admin_locator}
    Element Should Be Visible        ${adm_users_text_locator}
    Element Should Be Visible        ${adm_users_icon_locator}
    Element Should Be Visible        ${adm_roles_text_locator}
    Element Should Be Visible        ${adm_roles_icon_locator}
    Element Should Be Visible        ${adm_caption_users_locator}
    Wait Until Element Is Enabled    ${adm_filter_button_locator}
    Element Text Should Be           ${adm_filter_button_locator}       Email
    Wait Until Element Is Visible    ${adm_filter_by_locator}
    ${filter_by_value}=              Get Element Attribute              ${adm_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                 ${adm_filter_by_placeholder_email}
    Element Should Be Visible        ${adm_create_user_locator}
    Wait Until Element Is Visible    ${adm_table_label_locator}
    Element Should Contain           ${adm_table_label_locator}         Show
    Element Should Contain           ${adm_table_label_locator}         entries
    Wait Until Element Is Visible    ${adm_table_length_locator}
    List Selection Should Be         ${adm_table_length_locator}        ${SHOW_10_ENTRIES}
    Table Header Should Contain      ${adm_table_locator}               Email
    Table Header Should Contain      ${adm_table_locator}               Status
    Table Header Should Contain      ${adm_table_locator}               Roles
    Table Header Should Contain      ${adm_table_locator}               Last login
    Table Header Should Contain      ${adm_table_locator}               Actions
    Element Should Be Visible        ${adm_table_info_locator}
    Element Should Be Visible        ${adm_table_first_page_locator}
    Element Should Be Visible        ${adm_table_previous_page_locator}
    Element Should Be Visible        ${adm_table_next_page_locator}
    Element Should Be Visible        ${adm_table_last_page_locator}
    Element Should Be Visible        ${adm_table_current_page_locator}
    Element Should Be Visible        ${adm_table_pages_locator}
    ${total_items}=                  Get Number Of Items                ${adm_table_info_locator}
    ${last_page}=                    Get Last Page                      ${total_items}                        ${adm_table_length_locator}
    Check Table Information          1        ${SHOW_10_ENTRIES}        ${total_items}                        ${adm_table_row_xpath}            ${adm_table_info_locator}
    Check State of Page Navigation Buttons    1                         ${last_page}                          ${adm_table_pages_locator}
    ...                              ${adm_table_first_page_locator}    ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
    Check Page Infomation            1        ${last_page}              ${adm_table_pages_locator}            ${adm_table_current_page_locator}
	
	
Create User Page Elements
    [Tags]                           Users
    [Documentation]                  CADR-2892: Create User Page Elements
    Click Element                    ${adm_create_user_locator}
    Wait Until Element Is Visible    ${adm_create_user_prompt_locator}
    Element Text Should Be           ${adm_create_user_prompt_header_locator}             Create New User
    Element Should Be Visible        ${adm_create_user_prompt_close_locator}
    Element Should Be Visible        ${adm_create_user_prompt_cancel_locator}
    Element Should Be Visible        ${adm_create_user_prompt_save_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_email_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_password_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_firstname_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_lastname_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_address_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_number_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_roles_locator}
    Element Should Be Visible        ${adm_create_user_prompt_label_status_locator}
    Element Text Should Be           ${adm_create_user_prompt_label_email_locator}        Email *
    Element Text Should Be           ${adm_create_user_prompt_label_password_locator}     Password *
    Element Text Should Be           ${adm_create_user_prompt_label_firstname_locator}    First name
    Element Text Should Be           ${adm_create_user_prompt_label_lastname_locator}     Last name
    Element Text Should Be           ${adm_create_user_prompt_label_address_locator}      Mailing Address
    Element Text Should Be           ${adm_create_user_prompt_label_number_locator}       Contact Number
    Element Text Should Be           ${adm_create_user_prompt_label_roles_locator}        Roles
    Element Text Should Be           ${adm_create_user_prompt_label_status_locator}       Status
    ${icon_email}=                   Get Element Attribute                                ${adm_create_user_prompt_label_email_locator}//span@class
    ${icon_password}=                Get Element Attribute                                ${adm_create_user_prompt_label_password_locator}//span@class
    Should Be Equal                  ${icon_email}                                        fa fa-info-circle
    Should Be Equal                  ${icon_password}                                     fa fa-info-circle
    Element Should Be Enabled        ${adm_create_user_input_email_locator}
    Element Should Be Enabled        ${adm_create_user_input_password_locator}
    Element Should Be Enabled        ${adm_create_user_input_firstname_locator}
    Element Should Be Enabled        ${adm_create_user_input_lastname_locator}
    Element Should Be Enabled        ${adm_create_user_input_address_locator}
    Element Should Be Enabled        ${adm_create_user_input_number_locator}
    Element Should Be Enabled        ${adm_create_user_input_roles_button_locator}
    Element Should Be Enabled        ${adm_create_user_input_status_button_locator}
    Click Button                     ${adm_create_user_input_status_button_locator}
    Element Should Be Visible        ${adm_create_user_input_status_button_active_locator}
    Element Should Be Visible        ${adm_create_user_input_status_button_inactive_locator}
    Click Button                     ${adm_create_user_input_status_button_locator}
	
	
Cancel Create User
    [Tags]                           Users
    [Documentation]                  CADR-2893: Cancel Create User
    ${random}=                       Generate Random String             8        [LETTERS][NUMBERS]
    ${random_email}=                 Set Variable                                ${random}@test.com
    Input Text                       ${adm_create_user_input_email_locator}      ${random_email}
    Input Text                       ${adm_create_user_input_password_locator}   ${test_password}
    Click Button                     ${adm_create_user_prompt_cancel_locator}
    Wait Until Element Is Not Visible    ${adm_create_user_prompt_locator}


Create New User with Invalid Inputs
    [Tags]                           Users
    [Documentation]                  CADR-2894: Create New User with Invalid Inputs
    ${invalid_email}=                Generate Random String             10       _!@$% ^&*()+=[]{},;:'
    ${invalid_password}=             Generate Random String             4        [LETTERS][NUMBERS]_!@$% ^&*()+=[]{}#.,;:'
    ${invalid_firstname}=            Generate Random String             10       _!@$% ^&*+=[]{}#.,;:'
    ${invalid_lastname}=             Generate Random String             10       _!@$% ^&*+=[]{}#.,;:'
    ${invalid_addrress}=             Generate Random String             10       _!@$% ^&*()+=[]{}
    ${invalid_number}=               Generate Random String             10       _!@$% ^&*+=[]{}.,;:'
    Wait Until Element Is Visible    ${adm_create_user_locator}
    Click Button                     ${adm_create_user_locator}
    Wait Until Element Is Visible    ${adm_create_user_prompt_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_email_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_password_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_firstname_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_lastname_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_address_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_number_locator}
    Input Text                       ${adm_create_user_input_email_locator}      ${invalid_email}
    Input Text                       ${adm_create_user_input_password_locator}   ${invalid_password}
    Input Text                       ${adm_create_user_input_firstname_locator}  ${invalid_firstname}
    Input Text                       ${adm_create_user_input_lastname_locator}   ${invalid_lastname}
    Input Text                       ${adm_create_user_input_address_locator}    ${invalid_addrress}
    Input Text                       ${adm_create_user_input_number_locator}     ${invalid_number}
    Click Button                     ${adm_create_user_prompt_save_locator}
    Element Text Should Be           ${adm_create_user_input_email_locator}/following-sibling::span       email format: name@example.com
    Element Text Should Be           ${adm_create_user_input_password_locator}/following-sibling::span    minimum of 5 characters
    Element Text Should Be           ${adm_create_user_input_firstname_locator}/following-sibling::span   alphanumeric characters, spaces, and special characters: -() are allowed
    Element Text Should Be           ${adm_create_user_input_lastname_locator}/following-sibling::span    alphanumeric characters, spaces, and special characters: -() are allowed
    Element Text Should Be           ${adm_create_user_input_address_locator}/following-sibling::span     alphanumeric characters, spaces, and special characters: -#.,;:' are allowed
    Element Text Should Be           ${adm_create_user_input_number_locator}/following-sibling::span      alphanumeric characters, spaces, and special characters: -()+ are allowed
    Click Button                     ${adm_create_user_prompt_cancel_locator}
    Wait Until Element Is Not Visible    ${adm_create_user_prompt_locator}
    

Create New User with Required Inputs Only
    [Tags]                           Users
    [Documentation]                  CADR-2895: Create New User with Required Inputs Only
    ${random_username}=              Generate Random String        10            [LETTERS][NUMBERS]-_
    ${random_email}=                 Set Variable                                auto_${random_username}@autotest.com
    Construct User Elements          ${random_email}                             Inactive
    Wait Until Element Is Visible    ${adm_create_user_locator}
    Click Button                     ${adm_create_user_locator}
    Wait Until Element Is Visible    ${adm_create_user_prompt_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_email_locator}
    Input Text                       ${adm_create_user_input_email_locator}      ${random_email}
    Input Text                       ${adm_create_user_input_password_locator}   ${test_password}
    Click Button                     ${adm_create_user_input_status_button_locator}
    Element Should Be Visible        ${adm_create_user_input_status_button_active_locator}
    Element Should Be Visible        ${adm_create_user_input_status_button_inactive_locator}
    Click Element                    ${adm_create_user_input_status_button_inactive_locator}
    Click Button                     ${adm_create_user_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_create_user_prompt_locator}
    Select From List By Value        ${adm_table_length_locator}                 ${SHOW_100_ENTRIES}
    Verify Newly Created User        ${random_email}
    

Create New User
    [Tags]                           Users
    [Documentation]                  CADR-2896: Create New User
    Construct User Elements          ${valid_email}                              Active
    Scroll To Top
    Wait Until Element Is Visible    ${adm_create_user_locator}
    Click Button                     ${adm_create_user_locator}
    Wait Until Element Is Visible    ${adm_create_user_prompt_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_email_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_password_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_firstname_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_lastname_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_address_locator}
    Wait Until Element Is Enabled    ${adm_create_user_input_number_locator}
    Input Text                       ${adm_create_user_input_email_locator}      ${valid_email}
    Input Text                       ${adm_create_user_input_password_locator}   ${test_password}
    Input Text                       ${adm_create_user_input_firstname_locator}  ${valid_firstname}
    Input Text                       ${adm_create_user_input_lastname_locator}   ${valid_lastname}
    Input Text                       ${adm_create_user_input_address_locator}    ${valid_address}
    Input Text                       ${adm_create_user_input_number_locator}     ${valid_number}
    Click Button                     ${adm_create_user_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_create_user_prompt_locator}
    Select From List By Value        ${adm_table_length_locator}                 ${SHOW_100_ENTRIES}
    Verify Newly Created User        ${valid_email}
    

Filter Users by Email with No Match
    [Tags]                           Users    Filtering
    [Documentation]                  CADR-2897: Filter Users by Email with No Match
    [Setup]                          Select From List By Value            ${adm_table_length_locator}    ${SHOW_10_ENTRIES}
    Sleep                            2 seconds
    Scroll To Top
    Wait Until Element Is Enabled    ${adm_filter_by_locator}
    ${random}=                       Generate Random String               20           [LETTERS][NUMBERS]
    Input Text                       ${adm_filter_by_locator}             ${random}
    Press Key                        ${adm_filter_by_locator}             \\13 
    Verify Users Filter By Elements  ${random}                            Email:
    Verify Users Empty Data Table
    Click Element                    ${adm_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_active_filter_x_locator}


Filter Users by Email
    [Tags]                           Users    Filtering
    [Documentation]                  CADR-2898: Filter Users by Email
    Scroll To Top
    Wait Until Element Is Enabled    ${adm_filter_button_locator}
    Click Button                     ${adm_filter_button_locator}
    Sleep                            2 seconds
    Element Should Be Visible        ${adm_filter_email_locator}
    Element Should Be Visible        ${adm_filter_status_locator}
    Click Element                    ${adm_filter_email_locator}
    Sleep                            2 seconds
    ${filter_by_value}=              Get Element Attribute                ${adm_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                   ${adm_filter_by_placeholder_email}
    Input Text                       ${adm_filter_by_locator}             ${valid_email}
    Press Key                        ${adm_filter_by_locator}             \\13
    Verify Users Filter By Elements  ${valid_email}                       Email:
    Verify Users Data Table Result   ${valid_email}                       ${col_number_email}
    Element Should Be Visible        ${adm_table_email_locator}
    Element Should Be Visible        ${adm_table_status_locator}
    Element Should Be Visible        ${adm_table_details_locator}
    Element Should Be Visible        ${adm_table_action_locator}
    Sleep                            2 seconds
    

User Details Page Elements
    [Tags]                           Users    Filtering
    [Documentation]                  CADR-2899: User Details Page Elements
    Click Button                     ${adm_table_details_locator}
    Wait Until Element Is Visible    ${adm_user_detail_prompt_locator}
    Element Text Should Be           ${adm_user_detail_prompt_header_locator}             User Details
    Element Should Be Visible        ${adm_user_detail_prompt_label_email_locator}
    Element Should Be Visible        ${adm_user_detail_prompt_label_firstname_locator}
    Element Should Be Visible        ${adm_user_detail_prompt_label_lastname_locator}
    Element Should Be Visible        ${adm_user_detail_prompt_label_address_locator}
    Element Should Be Visible        ${adm_user_detail_prompt_label_number_locator}
    Element Should Be Visible        ${adm_user_detail_prompt_label_roles_locator}
    Element Should Be Visible        ${adm_user_detail_prompt_label_status_locator}
    Element Text Should Be           ${adm_user_detail_prompt_label_email_locator}        Email
    Element Text Should Be           ${adm_user_detail_prompt_label_firstname_locator}    First name
    Element Text Should Be           ${adm_user_detail_prompt_label_lastname_locator}     Last name
    Element Text Should Be           ${adm_user_detail_prompt_label_address_locator}      Mailing Address
    Element Text Should Be           ${adm_user_detail_prompt_label_number_locator}       Contact Number
    Element Text Should Be           ${adm_user_detail_prompt_label_roles_locator}        Roles
    Element Text Should Be           ${adm_user_detail_prompt_label_status_locator}       Status
    Element Should Be Disabled       ${adm_user_detail_input_email_locator}
    Element Should Be Disabled       ${adm_user_detail_input_firstname_locator}
    Element Should Be Disabled       ${adm_user_detail_input_lastname_locator}
    Element Should Be Disabled       ${adm_user_detail_input_address_locator}
    Element Should Be Disabled       ${adm_user_detail_input_number_locator}
    Element Should Be Disabled       ${adm_user_detail_input_roles_locator}
    Element Should Be Disabled       ${adm_user_detail_input_status_locator}
    Textfield Value Should Be        ${adm_user_detail_input_email_locator}               ${valid_email}
    Textfield Value Should Be        ${adm_user_detail_input_firstname_locator}           ${valid_firstname}
    Textfield Value Should Be        ${adm_user_detail_input_lastname_locator}            ${valid_lastname}
    Textarea Value Should Be         ${adm_user_detail_input_address_locator}             ${valid_address}
    Textfield Value Should Be        ${adm_user_detail_input_number_locator}              ${valid_number}
    Textfield Value Should Be        ${adm_user_detail_input_roles_locator}               ${EMPTY}
    Textfield Value Should Be        ${adm_user_detail_input_status_locator}              Active
    Element Should Be Visible        ${adm_user_detail_prompt_close_locator}
    Element Should Be Visible        ${adm_user_detail_prompt_ok_locator}
    Click Button                     ${adm_user_detail_prompt_ok_locator}
    Wait Until Element Is Not Visible    ${adm_user_detail_prompt_locator}
    Sleep                            2 seconds
    	
	
Administration Roles Page Elements
    [Tags]                           Roles    Filtering    Pagination    Sorting
    [Documentation]                  CADR-2900: Administration Roles Page Elements
    Click Element                    ${adm_roles_text_locator}
    Wait Until Element Is Visible    ${adm_caption_roles_locator}
    Element Should Not Be Visible    ${adm_caption_users_locator}
    Element Should Be Visible	     ${breadcrumb_home_locator}
    Element Should Be Visible        ${breadcrumb_admin_locator}
    Element Should Be Visible        ${adm_admin_locator}
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Element Text Should Be           ${adm_role_filter_button_locator}        Name
    Wait Until Element Is Visible    ${adm_role_filter_by_locator}
    ${filter_by_value}=              Get Element Attribute                    ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                       ${adm_filter_by_placeholder_rolename}
    Element Should Be Visible        ${adm_create_role_locator}
    Wait Until Element is Visible    ${adm_role_table_label_locator}
    Element Should Contain           ${adm_role_table_label_locator}          Show
    Element Should Contain           ${adm_role_table_label_locator}          entries
    Wait Until Element is Visible    ${adm_role_table_length_locator}
    List Selection Should Be         ${adm_role_table_length_locator}         ${SHOW_10_ENTRIES}
    Table Header Should Contain      ${adm_role_table_locator}                Name
    Table Header Should Contain      ${adm_role_table_locator}                Description
    Table Header Should Contain      ${adm_role_table_locator}                Permissions
    Table Header Should Contain      ${adm_role_table_locator}                Last updated
    Table Header Should Contain      ${adm_role_table_locator}                Actions
    Element Should Be Visible        ${adm_role_table_info_locator}
    Element Should Be Visible        ${adm_role_table_first_page_locator}
    Element Should Be Visible        ${adm_role_table_previous_page_locator}
    Element Should Be Visible        ${adm_role_table_next_page_locator}
    Element Should Be Visible        ${adm_role_table_last_page_locator}
    Element Should Be Visible        ${adm_role_table_current_page_locator}
    Element Should Be Visible        ${adm_role_table_pages_locator}
    ${total_items}=                  Get Number Of Items                      ${adm_role_table_info_locator}
    ${last_page}=                    Get Last Page                            ${total_items}                             ${adm_role_table_length_locator}
    Check Table Information          1        ${SHOW_10_ENTRIES}              ${total_items}                             ${adm_role_table_row_xpath}            ${adm_role_table_info_locator}
    Check State of Page Navigation Buttons    1                               ${last_page}                               ${adm_role_table_pages_locator}
    ...                              ${adm_role_table_first_page_locator}     ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
    Check Page Infomation            1        ${last_page}                    ${adm_roletable_pages_locator}             ${adm_role_table_current_page_locator}
	
	
Create Role Page Elements
    [Tags]                           Roles
    [Documentation]                  CADR-2901: Create Role Page Elements
    Click Button                     ${adm_create_role_locator}
    Wait Until Element Is Visible    ${adm_create_role_prompt_locator}
    Element Text Should Be           ${adm_create_role_prompt_header_locator}        Create New Role
    Element Should Be Visible        ${adm_create_role_prompt_close_locator}
    Element Should Be Visible        ${adm_create_role_prompt_cancel_locator}
    Element Should Be Visible        ${adm_create_role_prompt_save_locator}
    Element Should Be Visible        ${adm_create_role_prompt_label_name_locator}
    Element Should Be Visible        ${adm_create_role_prompt_label_desc_locator}
    Element Text Should Be           ${adm_create_role_prompt_label_name_locator}    Name *
    Element Text Should Be           ${adm_create_role_prompt_label_desc_locator}    Description
    ${icon_name}=                    Get Element Attribute                           ${adm_create_role_prompt_label_name_locator}//a/span@class
    Should Be Equal                  ${icon_name}                                    fa fa-info-circle
    Element Should Be Enabled        ${adm_create_role_input_name_locator}
    Element Should Be Enabled        ${adm_create_role_input_description_locator}
	
	
Cancel Create Role
    [Tags]                           Roles
    [Documentation]                  CADR-2902: Cancel Create Role
    ${random}=                       Generate Random String             8            [LETTERS][NUMBERS]
    ${random_desc}=                  Generate Random String             20           [LETTERS][NUMBERS]
    ${random_username}=              Set Variable                                    autotest_role_${random}
    Input Text                       ${adm_create_role_input_name_locator}           ${random_username}
    Input Text                       ${adm_create_role_input_description_locator}    ${random_desc}
    Click Button                     ${adm_create_role_prompt_cancel_locator}
    Wait Until Element Is Not Visible    ${adm_create_role_prompt_locator}
    Sleep                            2 seconds


Create New Role with Invalid Inputs
    [Tags]                           Roles
    [Documentation]                  CADR-2903: Create New Role with Invalid Inputs
    ${invalid_role_name}=            Generate Random String             20           !@$% ^&*()+=[]{}.,;:'
    ${invalid_role_desc}=            Generate Random String             50           !@$% ^&*()+=[]{}
    Wait Until Element Is Visible    ${adm_create_role_locator}
    Click Button                     ${adm_create_role_locator}
    Wait Until Element Is Enabled    ${adm_create_role_input_name_locator}
    Wait Until Element Is Enabled    ${adm_create_role_input_description_locator}
    Input Text                       ${adm_create_role_input_name_locator}           ${invalid_role_name}
    Input Text                       ${adm_create_role_input_description_locator}    ${invalid_role_desc}
    Click Button                     ${adm_create_role_prompt_save_locator}
    Element Text Should Be           ${adm_create_role_input_name_locator}/following-sibling::span           alphanumeric characters, spaces, and special characters: -_ are allowed
    Element Text Should Be           ${adm_create_role_input_description_locator}/following-sibling::span    alphanumeric characters, spaces, and special characters: -_#.,;:' are allowed
    Click Button                     ${adm_create_role_prompt_cancel_locator}
    Wait Until Element Is Not Visible    ${adm_create_role_prompt_locator}
    Sleep                            2 seconds
    
    
Create New Role with Required Inputs Only
    [Tags]                           Roles
    [Documentation]                  CADR-2904: Create New Role with Required Inputs Only
    ${random}=                       Generate Random String             30          [LETTERS][NUMBERS]-_
    ${random_role_name}=             Set Variable                                   autotest_${random}
    Set Suite Variable               ${delete_role_name}                            ${random_role_name}
    Construct Role Elements          ${random_role_name}                            ${EMPTY}
    Wait Until Element Is Enabled    ${adm_create_role_locator}
    Click Button                     ${adm_create_role_locator}
    Wait Until Element Is Enabled    ${adm_create_role_input_name_locator}
    Input Text                       ${adm_create_role_input_name_locator}          ${random_role_name}
    Click Button                     ${adm_create_role_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_create_role_prompt_locator}
    Select From List By Value        ${adm_role_table_length_locator}               ${SHOW_100_ENTRIES}
    Verify Newly Created Role        ${random_role_name}
    
    
Action Delete Role Prompt Elements
    [Tags]                           Roles    Users
    [Documentation]                  CADR-2906: Action Delete Role Prompt Elements
    Click Button                     ${adm_role_table_action_locator}
    Element Should Be Visible        ${adm_role_table_action_users_locator}
    Element Should Be Visible        ${adm_role_table_action_permissions_locator}
    Element Should Be Visible        ${adm_role_table_action_edit_locator}
    Element Should Be Visible        ${adm_role_table_action_delete_locator}
    Click Element                    ${adm_role_table_action_delete_locator}
    Wait Until Element Is Visible    ${adm_role_delete_prompt_locator}
    Element Should Be Visible        ${adm_role_delete_prompt_cancel_locator}
    Element Should Be Visible        ${adm_role_delete_prompt_delete_locator}
    Element Should Be Visible        ${adm_role_delete_prompt_alert_locator}
    Element Should Be Visible        ${adm_role_delete_prompt_alert_icon_locator}
    Element Should Contain           ${adm_role_delete_prompt_alert_locator}        Are you sure you want to delete
    Element Should Contain           ${adm_role_delete_prompt_alert_locator}        role?
    Element Text Should Be           ${adm_role_delete_prompt_alert_name_locator}   ${delete_role_name}
    Element Should Contain           ${adm_role_delete_prompt_alert_locator}        Permissions assigned to this role will be revoked from users who have this role.
    
    
Action Delete Role
    [Tags]                           Roles    Users
    [Documentation]                  CADR-2907: Action Delete Role
    Click Button                     ${adm_role_delete_prompt_delete_locator}
    Wait Until Element Is Not Visible    ${adm_role_delete_prompt_locator}
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Sleep                            2 seconds
    Element Should Not Be Visible    ${adm_role_table_name_locator}



Create New Role
    [Tags]                           Roles
    [Documentation]                  CADR-2905: Create New Role
    Construct Role Elements          ${role_name}                                   ${role_desc}
    Scroll To Top
    Click Button                     ${adm_create_role_locator}
    Wait Until Element Is Enabled    ${adm_create_role_input_name_locator}
    Wait Until Element Is Enabled    ${adm_create_role_input_description_locator}
    Input Text                       ${adm_create_role_input_name_locator}          ${role_name}
    Input Text                       ${adm_create_role_input_description_locator}   ${role_desc}
    Click Button                     ${adm_create_role_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_create_role_prompt_locator}
    Select From List By Value        ${adm_role_table_length_locator}               ${SHOW_100_ENTRIES}
    Verify Newly Created Role        ${role_name}
    Element Should Be Visible        ${adm_role_table_desc_locator}


Filter Roles by Name with No Match
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2908: Filter Roles by Name with No Match
    [Setup]                          Select From List By Value          ${adm_role_table_length_locator}    ${SHOW_10_ENTRIES}
    Sleep                            2 seconds
    Scroll To Top
    ${random}=                       Generate Random String             20          [LETTERS][NUMBERS]
    Input Text						 ${adm_role_filter_by_locator}      ${random}
    Press Key                        ${adm_role_filter_by_locator}      \\13 
    Verify Roles Filter By Elements  ${random}                          Name:
    Verify Roles Empty Data Table
    Click Element                    ${adm_role_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_x_locator}


Filter Roles by Name
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2909: Filter Roles by Name
    Scroll To Top
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_name_locator}
    Sleep                            2 seconds
    ${filter_by_value}=              Get Element Attribute                         ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                            ${adm_filter_by_placeholder_rolename}
    Input Text                       ${adm_role_filter_by_locator}                 ${role_name}
    Press Key                        ${adm_role_filter_by_locator}                 \\13 
    Verify Roles Filter By Elements  ${role_name}                                  Name:
    Verify Roles Data Table Result   ${role_name}                                  ${col_number_rolename}
    Element Should Be Visible        ${adm_role_table_name_locator}
    Element Should Be Visible        ${adm_role_table_desc_locator}
    Element Should Be Visible        ${adm_role_table_permissions_locator}
    Element Should Be Visible        ${adm_role_table_date_locator}
    Element Should Be Visible        ${adm_role_table_details_locator}
    Element Should Be Visible        ${adm_role_table_action_locator}


Role Details Page Elements
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2910: Role Details Page Elements
    Wait Until Element Is Enabled    ${adm_role_table_details_locator}
    Click Button                     ${adm_role_table_details_locator}
    Wait Until Element Is Visible    ${adm_create_role_prompt_locator}
    Element Text Should Be           ${adm_create_role_prompt_header_locator}        Role details
    Element Should Be Visible        ${adm_create_role_prompt_label_name_locator}
    Element Should Be Visible        ${adm_create_role_prompt_label_desc_locator}
    Element Text Should Be           ${adm_create_role_prompt_label_name_locator}    Name
    Element Text Should Be           ${adm_create_role_prompt_label_desc_locator}    Description
    Element Should Be Disabled       ${adm_create_role_input_name_locator}
    Element Should Be Disabled       ${adm_create_role_input_description_locator}
    Textfield Value Should Be        ${adm_create_role_input_name_locator}           ${role_name}
    Textarea Value Should Be         ${adm_create_role_input_description_locator}    ${role_desc}
    Element Should Be Visible        ${adm_create_role_prompt_close_locator}
    Element Should Be Visible        ${adm_create_role_prompt_ok_locator}
    Element Should Not Be Visible    ${adm_create_role_prompt_cancel_locator}
    Element Should Not Be Visible    ${adm_create_role_prompt_save_locator}
    Click Button                     ${adm_create_role_prompt_ok_locator}
    Wait Until Element Is Not Visible    ${adm_create_role_prompt_locator}
    Wait Until Element Is Visible    ${adm_role_table_name_locator}
	

Action Role Permission Page Elements
    [Tags]                           Roles
    [Documentation]                  CADR-2911: Action Role Permission Page Elements
    Wait Until Element Is Visible    ${adm_role_table_action_locator}
    Wait Until Element Is Enabled    ${adm_role_table_action_locator}
    Click Button                     ${adm_role_table_action_locator}
    Element Should Be Visible        ${adm_role_table_action_users_locator}
    Element Should Be Visible        ${adm_role_table_action_permissions_locator}
    Element Should Be Visible        ${adm_role_table_action_edit_locator}
    Element Should Be Visible        ${adm_role_table_action_delete_locator}
    Click Element                    ${adm_role_table_action_permissions_locator}
    Wait Until Element Is Visible    ${adm_role_permission_prompt_locator}
    Element Text Should Be           ${adm_role_permission_prompt_header_locator}    Choose Permissions
    Element Should Be Visible        ${adm_role_permission_prompt_close_locator}
    Element Should Be Visible        ${adm_role_permission_prompt_cancel_locator}
    Element Should Be Visible        ${adm_role_permission_prompt_save_locator}
    Element Should Be Visible        ${adm_role_permission_prompt_alert_locator}
    Element Should Contain           ${adm_role_permission_prompt_alert_locator}     Click an item to add or remove that permission.
    Element Should Contain           ${adm_role_permission_prompt_alert_locator}     Mouse-over an item to see a short description of that permission.
    ${info_icon}=                    Get Element Attribute                           ${adm_role_permission_prompt_alert_locator}/span@class
    Should Be Equal                  ${info_icon}                                    pficon pficon-info
    Element Should Be Visible        ${adm_role_permission_prompt_available_locator}
    Element Should Contain           ${adm_role_permission_prompt_available_locator}//h4    Available Permissions
    Element Should Be Visible        ${adm_role_permission_prompt_selected_locator}
    Element Should Contain           ${adm_role_permission_prompt_selected_locator}//h4     Selected Permissions
    Element Should Be Visible        ${adm_role_administration_locator}
    # Administration
    Element Text Should Be           ${adm_role_administration_locator}              Administration
    ${admin_title}=                  Get Element Attribute                           ${adm_role_administration_locator}@title
    Should Be Equal                  ${admin_title}                                  Allows access to the Administration tab
    # Analytics
    Element Should Be Visible        ${adm_role_analytics_locator}
    Element Text Should Be           ${adm_role_analytics_locator}                   Analytics
    ${analytics_title}=              Get Element Attribute                           ${adm_role_analytics_locator}@title
    Should Be Equal                  ${analytics_title}                              Allows access to the Analytics tab
    # Content Management
    Element Should Be Visible        ${adm_role_content_management_locator}
    Element Text Should Be           ${adm_role_content_management_locator}          Content Management
    ${cont_mgmt_title}=              Get Element Attribute                           ${adm_role_content_management_locator}@title
    Should Be Equal                  ${cont_mgmt_title}                              Allows access to the Content Management tab
    # Reporting
    Element Should Be Visible        ${adm_role_reporting_locator}
    Element Text Should Be           ${adm_role_reporting_locator}                   Reporting
    ${reporting_title}=              Get Element Attribute                           ${adm_role_reporting_locator}@title
    Should Be Equal                  ${reporting_title}                              Allows access to the Reports tab
    # Service Desk
    Element Should Be Visible        ${adm_role_service_desk_locator}
    Element Text Should Be           ${adm_role_service_desk_locator}                Service Desk
    ${service_desk_title}=           Get Element Attribute                           ${adm_role_service_desk_locator}@title
    Should Be Equal                  ${service_desk_title}                           Allows access to the Service Desk tab
	

Action Add Permissions to Role
    [Tags]                           Roles
    [Documentation]                  CADR-2912: Action Add Permissions to Role
    ${count}=                        Get Length                         ${permission_list}
    ${num_roles}=                    Evaluate                           random.randint(1,${count}-2)                      modules=random
    ${selected_permission_list}=     Evaluate                           random.sample(${permission_list},${num_roles})    modules=random
    Set Suite Variable               ${selected_permission_list}
    :FOR    ${i}    IN RANGE    ${num_roles}
    \  Element Should Be Visible     @{selected_permission_list}[${i}]/ancestor::${adm_role_permission_available}
    \  Click Element                 @{selected_permission_list}[${i}]
    \  Wait Until Page Does Not Contain     @{selected_permission_list}[${i}]/ancestor::${adm_role_permission_available}
    \  Element Should Be Visible     @{selected_permission_list}[${i}]/ancestor::${adm_role_permission_selected}
    Click Button                     ${adm_role_permission_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_role_permission_prompt_locator}
    :FOR    ${i}    IN RANGE    ${num_roles}
    \  Run Keyword If                '${adm_role_administration_locator}' == '${selected_permission_list[${i}]}'        Element Should Contain    ${adm_role_table_permissions_locator}    Administration
    \  ...  ELSE IF                  '${adm_role_analytics_locator}' == '${selected_permission_list[${i}]}'             Element Should Contain    ${adm_role_table_permissions_locator}    Analytics
    \  ...  ELSE IF                  '${adm_role_content_management_locator}' == '${selected_permission_list[${i}]}'    Element Should Contain    ${adm_role_table_permissions_locator}    Content Management
    \  ...  ELSE IF                  '${adm_role_reporting_locator}' == '${selected_permission_list[${i}]}'             Element Should Contain    ${adm_role_table_permissions_locator}    Reporting
    \  ...  ELSE IF                  '${adm_role_service_desk_locator}' == '${selected_permission_list[${i}]}'          Element Should Contain    ${adm_role_table_permissions_locator}    Service Desk
    \  ...  ELSE                     Fail    An unexpected permission is present for rolename '${role_name}'
	

Action Assign Users to Role Page Elements
    [Tags]                           Roles
    [Documentation]                  CADR-2913: Action Assign Users to Role Page Elements
    Click Button                     ${adm_role_table_action_locator}
    Element Should Be Visible        ${adm_role_table_action_users_locator}
    Element Should Be Visible        ${adm_role_table_action_permissions_locator}
    Element Should Be Visible        ${adm_role_table_action_edit_locator}
    Element Should Be Visible        ${adm_role_table_action_delete_locator}
    Click Element                    ${adm_role_table_action_users_locator}
    Wait Until Element Is Visible    ${adm_role_user_prompt_locator}
    Element Should Be Visible        ${adm_role_user_prompt_header_locator}
    Element Text Should Be           ${adm_role_user_prompt_header_locator}          Assign Users to Role
    Element Should Be Visible        ${adm_role_user_prompt_close_locator}
    Element Should Be Visible        ${adm_role_user_prompt_cancel_locator}
    Element Should Be Visible        ${adm_role_user_prompt_save_locator}
    Element Should Be Visible        ${adm_role_user_prompt_alert_locator}
    Element Should Contain           ${adm_role_user_prompt_alert_locator}           Click an item to add or remove that user
    ${info_icon}=                    Get Element Attribute                           ${adm_role_user_prompt_alert_locator}/span@class
    Should Be Equal                  ${info_icon}                                    pficon pficon-info
    Element Should Be Visible        ${adm_role_user_prompt_available_locator}
    Element Should Contain           ${adm_role_user_prompt_available_locator}//h4   Available Users
    Element Should Be Visible        ${adm_role_user_prompt_assigned_locator}
    Element Should Contain           ${adm_role_user_prompt_assigned_locator}//h4    Assigned Users
    Element Should Be Visible        ${adm_role_user_prompt_filter_button_locator}
    Element Should Be Visible        ${adm_role_user_prompt_filter_input_locator}
    ${filter_by_value}=              Get Element Attribute                           ${adm_role_user_prompt_filter_input_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                              ${adm_filter_by_placeholder_email_prompt}
    Input Text                       ${adm_role_user_prompt_filter_input_locator}    ${valid_email}
    Sleep                            2 seconds
    Element Should Be Visible        ${adm_role_user_prompt_user_locator}
    

Action Assign User to Role
    [Tags]                           Roles
    [Documentation]                  CADR-2914: Action Assign User to Role
    Element Should Be Visible        ${adm_role_user_prompt_user_available_locator}
    Page Should Not Contain Element  ${adm_role_user_prompt_user_assigned_locator}
    Click Element                    ${adm_role_user_prompt_user_locator}
    Wait Until Element Is Visible    ${adm_role_user_prompt_user_assigned_locator}
    Page Should Not Contain Element  ${adm_role_user_prompt_user_available_locator}
    Sleep                            2 seconds
    Click Element                    ${adm_role_user_prompt_user_locator}
    Wait Until Element Is Visible    ${adm_role_user_prompt_user_available_locator}
    Click Element                    ${adm_role_user_prompt_user_locator}
    Wait Until Element Is Visible    ${adm_role_user_prompt_user_assigned_locator}
    Click Button                     ${adm_role_user_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_role_user_prompt_locator}
    Wait Until Element Is Visible    ${adm_roles_text_locator}
    
    
Verify Users Page for the Newly Assigned Role
    [Tags]                           Roles
    [Documentation]                  CADR-2915: Verify Users Page for the Newly Assigned Role
    Click Element                    ${adm_users_text_locator}
    Wait Until Element Is Enabled    ${adm_filter_by_locator}
    Input Text                       ${adm_filter_by_locator}                        ${valid_email}
    Press Key                        ${adm_filter_by_locator}                        \\13
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Wait Until Element Is Visible    ${adm_table_locator}
    Element Should Be Visible        ${adm_table_email_locator}
    Element Text Should Be           ${adm_table_roles_locator}                      ${role_name}
    Click Button                     ${adm_table_details_locator}
    Wait Until Element Is Visible    ${adm_user_detail_prompt_locator}
    Textfield Value Should Be        ${adm_user_detail_input_roles_locator}          ${role_name}
    Click Button                     ${adm_user_detail_prompt_ok_locator}
    Wait Until Element Is Not Visible    ${adm_user_detail_prompt_locator}
    
    
Login of New User Created
    [Tags]                           Roles
    [Documentation]                  CADR-2916: Login of New User Created
    [Setup]                          Logout Rave Portal
    Login Rave Portal                ${valid_email}      ${test_password}
    ${permission_count}=             Get Length          ${selected_permission_list}
    :FOR    ${i}    IN RANGE    ${permission_count}
    \  Run Keyword If                '${adm_role_administration_locator}' == '${selected_permission_list[${i}]}'        Element Should Be Visible    ${nav_bar_administration_locator}
    \  ...  ELSE IF                  '${adm_role_analytics_locator}' == '${selected_permission_list[${i}]}'             Element Should Be Visible    ${nav_bar_analytics_locator}
    \  ...  ELSE IF                  '${adm_role_content_management_locator}' == '${selected_permission_list[${i}]}'    Element Should Be Visible    ${nav_bar_content_management_locator}
    \  ...  ELSE IF                  '${adm_role_reporting_locator}' == '${selected_permission_list[${i}]}'             Element Should Be Visible    ${nav_bar_reporting_locator}
    \  ...  ELSE IF                  '${adm_role_service_desk_locator}' == '${selected_permission_list[${i}]}'          Element Should Be Visible    ${nav_bar_service_desk_locator}
    \  ...  ELSE                     FAIL                An unexpected permission Tab is present for user '${valid_email}'
    ${expected_count}=               Evaluate            ${permission_count} + ${default_tab_count}
    Xpath Should Match X Times       ${nav_bar_xpath}    ${expected_count}
    
    
Action Edit of Role Details Page Elements
    [Tags]                           Roles
    [Documentation]                  CADR-2917: Action Edit of Role Details Page Elements
    [Setup]                          Logout Rave Portal
    Login Rave Portal
    Go To Administration Tab
    Wait Until Element Is Visible    ${adm_roles_text_locator}
    Click Element                    ${adm_roles_text_locator}
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Input Text                       ${adm_role_filter_by_locator}                   ${role_name}
    Press Key                        ${adm_role_filter_by_locator}                   \\13
    Wait Until Element Is Visible    ${adm_role_active_filter_text_locator}
    Wait Until Element Is Visible    ${adm_role_table_action_locator}
    Click Button                     ${adm_role_table_action_locator}
    Element Should Be Visible        ${adm_role_table_action_users_locator}
    Element Should Be Visible        ${adm_role_table_action_permissions_locator}
    Element Should Be Visible        ${adm_role_table_action_edit_locator}
    Element Should Be Visible        ${adm_role_table_action_delete_locator}
    Click Element                    ${adm_role_table_action_edit_locator}
    Wait Until Element Is Visible    ${adm_create_role_prompt_locator}
    Element Text Should Be           ${adm_create_role_prompt_header_locator}        Edit role
    Element Should Be Visible        ${adm_create_role_prompt_label_name_locator}
    Element Should Be Visible        ${adm_create_role_prompt_label_desc_locator}
    Element Should Be Enabled        ${adm_create_role_input_name_locator}
    Element Should Be Enabled        ${adm_create_role_input_description_locator}
    Textfield Value Should Be        ${adm_create_role_input_name_locator}           ${role_name}
    Textarea Value Should Be         ${adm_create_role_input_description_locator}    ${role_desc}
    Element Should Be Visible        ${adm_create_role_prompt_close_locator}
    Element Should Be Visible        ${adm_create_role_prompt_cancel_locator}
    Element Should Be Visible        ${adm_create_role_prompt_save_locator}
    Element Should Not Be Visible    ${adm_create_role_prompt_ok_locator}
    
    
Action Edit of Role Details
    [Tags]                           Roles
    [Documentation]                  CADR-2918: Action Edit of Role Details
    Clear Element Text               ${adm_create_role_input_name_locator}
    Clear Element Text               ${adm_create_role_input_description_locator}
    Input Text                       ${adm_create_role_input_name_locator}           ${role_name_new}
    Input Text                       ${adm_create_role_input_description_locator}    ${role_desc_new}
    Construct Role Elements          ${role_name_new}                                ${role_desc_new}
    Click Button                     ${adm_create_role_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_create_role_prompt_locator}
    Wait Until Element Is Visible    ${adm_role_active_filter_text_locator}
    Click Element                    ${adm_role_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_text_locator}
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Input Text                       ${adm_role_filter_by_locator}                   ${role_name_new}
    Press Key                        ${adm_role_filter_by_locator}                   \\13
    Wait Until Element Is Visible    ${adm_role_active_filter_text_locator}
    Wait Until Element Is Visible    ${adm_role_table_action_locator}
    Element Should Be Visible        ${adm_role_table_name_locator}
    Element Should Be Visible        ${adm_role_table_desc_locator}
    Element Should Be Visible        ${adm_role_table_date_locator}
    Element Should Be Visible        ${adm_role_table_permissions_locator}
    Element Should Be Visible        ${adm_role_table_details_locator}
    Element Should Be Visible        ${adm_role_table_action_locator}
    Click Element                    ${adm_role_active_filter_clear_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_clear_locator}
    
    
Action Edit of User Details Page Elements
    [Tags]                           Roles    Users
    [Documentation]                  CADR-2919: Action Edit of User Details Page Elements
    Click Element                    ${adm_users_text_locator}
    Wait Until Element Is Visible    ${adm_caption_users_locator}
    Input Text                       ${adm_filter_by_locator}                             ${valid_email}
    Press Key                        ${adm_filter_by_locator}                             \\13
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Click Button                     ${adm_table_action_locator}
    Element Should Be Visible        ${adm_table_action_edit_locator}
    Element Should Be Visible        ${adm_table_action_deactivate_locator}
    Click Element                    ${adm_table_action_edit_locator}
    Wait Until Element Is Visible    ${adm_update_user_prompt_locator}
    Element Text Should Be           ${adm_update_user_prompt_header_locator}             Update User
    Element Should Be Visible        ${adm_update_user_prompt_label_email_locator}
    Element Should Be Visible        ${adm_update_user_prompt_label_firstname_locator}
    Element Should Be Visible        ${adm_update_user_prompt_label_lastname_locator}
    Element Should Be Visible        ${adm_update_user_prompt_label_address_locator}
    Element Should Be Visible        ${adm_update_user_prompt_label_number_locator}
    Element Should Be Visible        ${adm_update_user_prompt_label_roles_locator}
    Element Should Be Visible        ${adm_update_user_prompt_label_status_locator}
    Element Text Should Be           ${adm_update_user_prompt_label_email_locator}        Email
    Element Text Should Be           ${adm_update_user_prompt_label_firstname_locator}    First name
    Element Text Should Be           ${adm_update_user_prompt_label_lastname_locator}     Last name
    Element Text Should Be           ${adm_update_user_prompt_label_address_locator}      Mailing Address
    Element Text Should Be           ${adm_update_user_prompt_label_number_locator}       Contact Number
    Element Text Should Be           ${adm_update_user_prompt_label_roles_locator}        Roles
    Element Text Should Be           ${adm_update_user_prompt_label_status_locator}       Status
    Element Should Be Disabled       ${adm_update_user_input_email_locator}
    Element Should Be Enabled        ${adm_update_user_input_firstname_locator}
    Element Should Be Enabled        ${adm_update_user_input_lastname_locator}
    Element Should Be Enabled        ${adm_update_user_input_address_locator}
    Element Should Be Enabled        ${adm_update_user_input_number_locator}
    Element Should Be Enabled        ${adm_update_user_input_roles_button_locator}
    Element Should Be Enabled        ${adm_update_user_input_status_button_locator}
    Textfield Value Should Be        ${adm_update_user_input_email_locator}               ${valid_email}
    Textfield Value Should Be        ${adm_update_user_input_firstname_locator}           ${valid_firstname}
    Textfield Value Should Be        ${adm_update_user_input_lastname_locator}            ${valid_lastname}
    Textarea Value Should Be         ${adm_update_user_input_address_locator}             ${valid_address}
    Textfield Value Should Be        ${adm_update_user_input_number_locator}              ${valid_number}
    Element Should Be Visible        ${adm_update_user_prompt_close_locator}
    Element Should Be Visible        ${adm_update_user_prompt_cancel_locator}
    Element Should Be Visible        ${adm_update_user_prompt_save_locator}
    
    
Action Edit of User Details
    [Tags]                           Roles    Users
    [Documentation]                  CADR-2920: Action Edit of User Details
    Clear Element Text               ${adm_update_user_input_firstname_locator}
    Clear Element Text               ${adm_update_user_input_lastname_locator}
    Clear Element Text               ${adm_update_user_input_address_locator}
    Clear Element Text               ${adm_update_user_input_number_locator}
    Input Text                       ${adm_update_user_input_firstname_locator}    ${edited_firstname}
    Input Text                       ${adm_update_user_input_lastname_locator}     ${edited_lastname}
    Input Text                       ${adm_update_user_input_address_locator}      ${edited_address}
    Input Text                       ${adm_update_user_input_number_locator}       ${edited_number}
    Click Button                     ${adm_update_user_input_roles_button_locator}
    Element Should Be Visible        ${adm_update_user_role_name_locator}
    Element Should Be Visible        ${adm_update_user_role_desc_locator}
    Click Element                    ${adm_update_user_role_name_locator}
    Click Element                    ${adm_update_user_prompt_header_locator}
    Click Button                     ${adm_update_user_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_create_user_prompt_locator}
    Wait Until Element Is Enabled    ${adm_filter_button_locator}
    Sleep                            2 seconds
    Element Text Should Be           ${adm_table_roles_locator}                    ${EMPTY}
    Element Should Be Visible        ${adm_table_lastlogin_locator}
    Click Button                     ${adm_table_details_locator}
    Wait Until Element Is Visible    ${adm_user_detail_prompt_locator}
    Textfield Value Should Be        ${adm_user_detail_input_email_locator}        ${valid_email}
    Textfield Value Should Be        ${adm_user_detail_input_firstname_locator}    ${edited_firstname}
    Textfield Value Should Be        ${adm_user_detail_input_lastname_locator}     ${edited_lastname}
    Textarea Value Should Be         ${adm_user_detail_input_address_locator}      ${edited_address}
    Textfield Value Should Be        ${adm_user_detail_input_number_locator}       ${edited_number}
    Textfield Value Should Be        ${adm_user_detail_input_roles_locator}        ${EMPTY}
    Textfield Value Should Be        ${adm_user_detail_input_status_locator}       Active
    Click Element                    ${adm_user_detail_prompt_ok_locator}
    Wait Until Element Is Not Visible    ${adm_user_detail_prompt_locator}
    Wait Until Element Is Visible    ${adm_users_text_locator}
    
    
Login of User Without Role Permission
    [Tags]                           Roles
    [Documentation]                  CADR-2921: Login of User Without Role Permission
    [Setup]                          Logout Rave Portal
    Login Rave Portal                ${valid_email}             ${test_password}
    Xpath Should Match X Times       ${nav_bar_xpath}           ${default_tab_count}
    

Add Role to User
    [Tags]                           Users
    [Documentation]                  CADR-2922: Add Role to User
    [Setup]                          Logout Rave Portal
    Login Rave Portal
    Go To Administration Tab
    Input Text                       ${adm_filter_by_locator}                   ${valid_email}
    Press Key                        ${adm_filter_by_locator}                   \\13
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Wait Until Element Is Enabled    ${adm_table_action_locator}
    Click Button                     ${adm_table_action_locator}
    Element Should Be Visible        ${adm_table_action_edit_locator}
    Element Should Be Visible        ${adm_table_action_deactivate_locator}
    Click Element                    ${adm_table_action_edit_locator}
    Wait Until Element Is Visible    ${adm_update_user_prompt_locator}
    Click Button                     ${adm_update_user_input_roles_button_locator}
    Element Should Be Visible        ${adm_update_user_role_name_locator}
    Element Should Be Visible        ${adm_update_user_role_desc_locator}
    Click Element                    ${adm_update_user_role_name_locator}
    Click Element                    ${adm_update_user_prompt_header_locator}
    Click Button                     ${adm_update_user_prompt_save_locator}
    Wait Until Element Is Not Visible    ${adm_update_user_prompt_locator}
    Wait Until Element Is Visible    ${adm_table_details_locator}
    Click Button                     ${adm_table_details_locator}
    Wait Until Element Is Visible    ${adm_user_detail_prompt_locator}
    Textfield Value Should Be        ${adm_user_detail_input_email_locator}        ${valid_email}
    Textfield Value Should Be        ${adm_user_detail_input_firstname_locator}    ${edited_firstname}
    Textfield Value Should Be        ${adm_user_detail_input_lastname_locator}     ${edited_lastname}
    Textarea Value Should Be         ${adm_user_detail_input_address_locator}      ${edited_address}
    Textfield Value Should Be        ${adm_user_detail_input_number_locator}       ${edited_number}
    Textfield Value Should Be        ${adm_user_detail_input_roles_locator}        ${role_name_new}
    Textfield Value Should Be        ${adm_user_detail_input_status_locator}       Active
    Click Element                    ${adm_user_detail_prompt_ok_locator}
    Wait Until Element Is Not Visible    ${adm_user_detail_prompt_locator}
    Wait Until Element Is Visible    ${adm_users_text_locator}
    
Login of User with Added Role
    [Tags]                           Roles
    [Documentation]                  CADR-2923: Login of User with Added Role
    [Setup]                          Logout Rave Portal
    Login Rave Portal                ${valid_email}                          ${test_password}
    ${permission_count}=             Get Length                              ${selected_permission_list}
    :FOR    ${i}    IN RANGE    ${permission_count}
    \    Run Keyword If              '${adm_role_administration_locator}' == '${selected_permission_list[${i}]}'        Element Should Be Visible    ${nav_bar_administration_locator}
    \    ...    ELSE IF              '${adm_role_analytics_locator}' == '${selected_permission_list[${i}]}'             Element Should Be Visible    ${nav_bar_analytics_locator}
    \    ...    ELSE IF              '${adm_role_content_management_locator}' == '${selected_permission_list[${i}]}'    Element Should Be Visible    ${nav_bar_content_management_locator}
    \    ...    ELSE IF              '${adm_role_reporting_locator}' == '${selected_permission_list[${i}]}'             Element Should Be Visible    ${nav_bar_reporting_locator}
    \    ...    ELSE IF              '${adm_role_service_desk_locator}' == '${selected_permission_list[${i}]}'          Element Should Be Visible    ${nav_bar_service_desk_locator}
    \    ...    ELSE                 FAIL    An unexpected permission Tab is present for user '${valid_email}'
    ${expected_count}=               Evaluate                                ${permission_count} + ${default_tab_count}
    Xpath Should Match X Times       ${nav_bar_xpath}                        ${expected_count}
    

Action Deactivate User Page Elements
    [Tags]                           Users
    [Documentation]                  CADR-2924: Action Deactivate User Page Elements
    [Setup]                          Logout Rave Portal
    Login Rave Portal
    Go To Administration Tab
    Input Text                       ${adm_filter_by_locator}                   ${valid_email}
    Press Key                        ${adm_filter_by_locator}                   \\13
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Wait Until Element Is Visible    ${adm_table_action_locator}
    Click Button                     ${adm_table_action_locator}
    Element Should Be Visible        ${adm_table_action_edit_locator}
    Element Should Be Visible        ${adm_table_action_deactivate_locator}
    Click Element                    ${adm_table_action_deactivate_locator}
    Wait Until Element Is Visible    ${adm_user_activation_prompt_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_cancel_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_ok_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_alert_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_alert_icon_locator}
    Element Should Contain           ${adm_user_activation_prompt_alert_locator}           Are you sure you want to 
    Element Should Contain           ${adm_user_activation_prompt_alert_status_locator}    deactivate
    Element Should Contain           ${adm_user_activation_prompt_alert_locator}           user
    Element Should Contain           ${adm_user_activation_prompt_alert_email_locator}     ${valid_email}
    Element Should Contain           ${adm_user_activation_prompt_alert_locator}           ?
    

Action Cancel Deactivate User
    [Tags]                           Users
    [Documentation]                  CADR-2925: Action Cancel Deactivate User
    Click Button                     ${adm_user_activation_prompt_cancel_locator}
    Wait Until Element Is Not Visible    ${adm_user_activation_prompt_locator}
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Element Should Be Visible        ${adm_table_status_locator}
    

Action Deactivate User
    [Tags]                           Users
    [Documentation]                  CADR-2926: Action Deactivate User
    Click Button                     ${adm_table_action_locator}
    Element Should Be Visible        ${adm_table_action_edit_locator}
    Element Should Be Visible        ${adm_table_action_deactivate_locator}
    Click Element                    ${adm_table_action_deactivate_locator}
    Wait Until Element Is Visible    ${adm_user_activation_prompt_locator}
    Element Should Contain           ${adm_user_activation_prompt_alert_status_locator}    deactivate
    Element Should Contain           ${adm_user_activation_prompt_alert_email_locator}     ${valid_email}
    Update User Status Element       Inactive
    Click Button                     ${adm_user_activation_prompt_ok_locator}
    Wait Until Element Is Not Visible    ${adm_user_activation_prompt_locator}
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Element Should Be Visible        ${adm_table_status_locator}


Login of Deactivated User
    [Tags]                           Roles
    [Documentation]                  CADR-2927: Login of Deactivated User
    [Setup]                          Logout Rave Portal
    Login Rave Portal                ${valid_email}    ${test_password}      fail
    Element Should Contain           ${login_error_toast_message_locator}    The username and/or password you specified are not correct. Please try again.
   

Action Activate User Page Elements
    [Tags]                           Users
    [Documentation]                  CADR-2928: Action Activate User Page Elements
    [Setup]                          Login Rave Portal
    Go To Administration Tab
    Input Text                       ${adm_filter_by_locator}                   ${valid_email}
    Press Key                        ${adm_filter_by_locator}                   \\13
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Wait Until Element Is Visible    ${adm_table_action_locator}
    Click Button                     ${adm_table_action_locator}
    Element Should Be Visible        ${adm_table_action_edit_locator}
    Element Should Be Visible        ${adm_table_action_activate_locator}
    Click Element                    ${adm_table_action_activate_locator}
    Wait Until Element Is Visible    ${adm_user_activation_prompt_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_cancel_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_ok_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_alert_locator}
    Element Should Be Visible        ${adm_user_activation_prompt_alert_icon_locator}
    Element Should Contain           ${adm_user_activation_prompt_alert_locator}           Are you sure you want to 
    Element Should Contain           ${adm_user_activation_prompt_alert_status_locator}    activate
    Element Should Contain           ${adm_user_activation_prompt_alert_locator}           user
    Element Should Contain           ${adm_user_activation_prompt_alert_email_locator}     ${valid_email}
    Element Should Contain           ${adm_user_activation_prompt_alert_locator}           ?
    

Action Activate User
    [Tags]                           Users
    [Documentation]                  CADR-2929: Action Activate User
    Update User Status Element       Active
    Click Button                     ${adm_user_activation_prompt_ok_locator}
    Wait Until Element Is Not Visible    ${adm_user_activation_prompt_locator}
    Wait Until Element Is Visible    ${adm_active_filter_text_locator}
    Element Should Be Visible        ${adm_table_status_locator}


Login of Activated User
    [Tags]                           Users
    [Documentation]                  CADR-2930: Login of Activated User
    [Setup]                          Logout Rave Portal
    Login Rave Portal                ${valid_email}     ${test_password}
    ${permission_count}=             Get Length         ${selected_permission_list}
    :FOR    ${i}    IN RANGE    ${permission_count}
    \  Run Keyword If                '${adm_role_administration_locator}' == '${selected_permission_list[${i}]}'        Element Should Be Visible    ${nav_bar_administration_locator}
    \  ...  ELSE IF                  '${adm_role_analytics_locator}' == '${selected_permission_list[${i}]}'             Element Should Be Visible    ${nav_bar_analytics_locator}
    \  ...  ELSE IF                  '${adm_role_content_management_locator}' == '${selected_permission_list[${i}]}'    Element Should Be Visible    ${nav_bar_content_management_locator}
    \  ...  ELSE IF                  '${adm_role_reporting_locator}' == '${selected_permission_list[${i}]}'             Element Should Be Visible    ${nav_bar_reporting_locator}
    \  ...  ELSE IF                  '${adm_role_service_desk_locator}' == '${selected_permission_list[${i}]}'          Element Should Be Visible    ${nav_bar_service_desk_locator}
    \  ...  ELSE                     FAIL                An unexpected permission Tab is present for user '${valid_email}'
    ${expected_count}=               Evaluate            ${permission_count} + ${default_tab_count}
    Xpath Should Match X Times       ${nav_bar_xpath}    ${expected_count}
    

Filter Users by Status Active
    [Tags]                           Users    Filtering
    [Documentation]                  CADR-2931: Filter Users by Status Active
    [Setup]                          Logout Rave Portal
    Login Rave Portal
    Go To Administration Tab
    Select From List By Value        ${adm_table_length_locator}                 ${SHOW_100_ENTRIES}
    Click Button                     ${adm_filter_button_locator}
    Element Should Be Visible        ${adm_filter_email_locator}
    Element Should Be Visible        ${adm_filter_status_locator}
    Click Element                    ${adm_filter_status_locator}
    Wait Until Element Contains      ${adm_filter_button_locator}                Status
    Element Should Be Visible        ${adm_filter_status_select_locator}
    Element Should Contain           ${adm_filter_status_select_locator}         ${adm_filter_by_placeholder_status}
    Click Button                     ${adm_filter_status_select_locator}
    Element Should Be Visible        ${adm_filter_status_select_active_locator}
    Element Should Be Visible        ${adm_filter_status_select_inactive_locator}
    Wait Until Element Is Enabled    ${adm_filter_status_select_active_locator}
    Click Element                    ${adm_filter_status_select_active_locator}
    Verify Users Filter By Elements  Active                                      Status:
    Verify Users Data Table Result   Active                                      ${col_number_status}
    Click Element                    ${adm_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_active_filter_x_locator}
    
    
Filter Users by Status Inactive
    [Tags]                           Users    Filtering
    [Documentation]                  CADR-2932: Filter Users by Status Inactive
    Wait Until Element Is Enabled    ${adm_filter_button_locator}
    Element Should Contain           ${adm_filter_button_locator}                Status
    Element Should Be Visible        ${adm_filter_status_select_locator}
    Element Should Contain           ${adm_filter_status_select_locator}         ${adm_filter_by_placeholder_status}
    Click Button                     ${adm_filter_status_select_locator}
    Element Should Be Visible        ${adm_filter_status_select_active_locator}
    Element Should Be Visible        ${adm_filter_status_select_inactive_locator}
    Wait Until Element Is Enabled    ${adm_filter_status_select_inactive_locator}
    Click Element                    ${adm_filter_status_select_inactive_locator}
    Verify Users Filter By Elements  Inactive                                    Status:
    Verify Users Data Table Result   Inactive                                    ${col_number_status}
    Click Element                    ${adm_active_filter_clear_locator}
    Wait Until Element Is Not Visible    ${adm_active_filter_clear_locator}
    
    
Sort Users by Email
    [Tags]                           Users    Sorting
    [Documentation]                  CADR-2933: Sort Users by Email
    Wait Until Element is Enabled    ${adm_table_length_locator}
    Select From List By Value        ${adm_table_length_locator}    ${SHOW_100_ENTRIES}
    Sleep                            3 seconds
    Wait Until Element Is Enabled    ${adm_table_colhead_email_locator}
    Click Element                    ${adm_table_colhead_email_locator}
    Sleep                            2 seconds
    ${order1}=                       Get Element Attribute          ${adm_table_colhead_email_locator}@aria-sort
    Verify Users Table Sorting       ${order1}                      ${col_number_email}
    # reverses order of sorting
    Click Element                    ${adm_table_colhead_email_locator}
    Sleep                            2 seconds
    ${order2}=                       Get Element Attribute          ${adm_table_colhead_email_locator}@aria-sort
    Run Keyword If                   '${order1}' == 'ascending'     Should Be Equal As Strings    ${order2}    descending
    ...  ELSE IF                     '${order1}' == 'descending'    Should Be Equal As Strings    ${order2}    ascending
    ...  ELSE                        FAIL                           Invalid order name '${order1}'. Should be 'ascending' or 'descending' only
    Verify Users Table Sorting       ${order2}                      ${col_number_email}
    
    
Sort Users by Status
    [Tags]                           Users    Sorting
    [Documentation]                  CADR-2934: Sort Users by Status
    Wait Until Element is Enabled    ${adm_table_length_locator}
    Select From List By Value        ${adm_table_length_locator}    ${SHOW_100_ENTRIES}
    Sleep                            3 seconds
    Wait Until Element Is Enabled    ${adm_table_colhead_status_locator}
    Click Element                    ${adm_table_colhead_status_locator}
    Sleep                            2 seconds
    ${order1}=                       Get Element Attribute          ${adm_table_colhead_status_locator}@aria-sort
    Verify Users Table Sorting       ${order1}                      ${col_number_status}          True
    # reverses order of sorting
    Click Element                    ${adm_table_colhead_status_locator}
    Sleep                            2 seconds
    ${order2}=                       Get Element Attribute          ${adm_table_colhead_status_locator}@aria-sort
    Run Keyword If                   '${order1}' == 'ascending'     Should Be Equal As Strings    ${order2}    descending
    ...  ELSE IF                     '${order1}' == 'descending'    Should Be Equal As Strings    ${order2}    ascending
    ...  ELSE                        FAIL                           Invalid order name '${order1}'. Should be 'ascending' or 'descending' only
    Verify Users Table Sorting       ${order2}                      ${col_number_status}          True
    
    
Sort Users by Last Login
    [Tags]                           Users    Sorting
    [Documentation]                  CADR-2935: Sort Users by Last Login
    Wait Until Element is Enabled    ${adm_table_length_locator}
    Select From List By Value        ${adm_table_length_locator}    ${SHOW_100_ENTRIES}
    Sleep                            3 seconds
    Wait Until Element Is Enabled    ${adm_table_colhead_lastlogin_locator}
    Click Element                    ${adm_table_colhead_lastlogin_locator}
    Sleep                            2 seconds
    ${order1}=                       Get Element Attribute          ${adm_table_colhead_lastlogin_locator}@aria-sort
    Verify Users Table Sorting       ${order1}                      ${col_number_lastlogin}
    # reverses order of sorting
    Click Element                    ${adm_table_colhead_lastlogin_locator}
    Sleep                            2 seconds
    ${order2}=                       Get Element Attribute          ${adm_table_colhead_lastlogin_locator}@aria-sort
    Run Keyword If                   '${order1}' == 'ascending'     Should Be Equal As Strings    ${order2}    descending
    ...  ELSE IF                     '${order1}' == 'descending'    Should Be Equal As Strings    ${order2}    ascending
    ...  ELSE                        FAIL                           Invalid order name '${order1}'. Should be 'ascending' or 'descending' only
    Verify Users Table Sorting       ${order2}                      ${col_number_lastlogin}
    

Users Show Specified Number of Table Entries
    [Tags]                                       Users    Pagination
    [Documentation]                              CADR-2936: Users Show Specified Number of Table Entries
    :FOR    ${size}    IN    @{PAGE_SIZE_LIST}
    \  Wait Until Element is Enabled             ${adm_table_length_locator}
    \  Select From List By Value                 ${adm_table_length_locator}           ${size}
    \  Sleep                                     3 seconds
    \  ${number_items}=                          Get Number of Items                   ${adm_table_info_locator}
    \  ${current_page}=                          Get Value                             ${adm_table_current_page_locator}
    \  Check Show Entries Value	                 ${size}                               ${adm_table_length_locator}       ${adm_table_row_xpath}        ${adm_table_info_locator}
    \  Check Table Information                   ${current_page}                       ${size}                           ${number_items}               ${adm_table_row_xpath}    ${adm_table_info_locator}


Users Forward Navigation of Table Pages
    [Tags]                                       Users    Pagination
    [Documentation]                              CADR-2937: Users Forward Navigation of Table Pages
    Wait Until Element is Enabled                ${adm_table_length_locator}
    Select From List By Value                    ${adm_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                   ${adm_table_info_locator}
    ${last_page}=                                Get Last Page                         ${number_items}                   ${adm_table_length_locator}
	:FOR    ${i}    IN RANGE    1    ${last_page}+1
	\  ${current_page}=                          Get Value                             ${adm_table_current_page_locator}
	\  Check State of Page Navigation Buttons    ${current_page}                       ${last_page}                      ${adm_table_pages_locator}    ${adm_table_first_page_locator}
	\  ...                                       ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
	\  Check Table Information                   ${current_page}                       ${page_size}                      ${number_items}               ${adm_table_row_xpath}    ${adm_table_info_locator}
	\  Click Element                             ${adm_table_next_page_locator}
	\  Sleep                                     2 seconds
	\  Scroll To Top


Users Backward Navigation of Table Pages
    [Tags]                                       Users    Pagination
    [Documentation]                              CADR-2938: Users Backward of Table Pages
    Wait Until Element is Enabled                ${adm_table_length_locator}
    Select From List By Value                    ${adm_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                   ${adm_table_info_locator}
    ${last_page}=                                Get Last Page                         ${number_items}                   ${adm_table_length_locator}
    :FOR    ${i}    IN RANGE    ${last_page}     0    -1
    \  ${current_page}=                          Get Value                             ${adm_table_current_page_locator}
    \  Check State of Page Navigation Buttons    ${current_page}                       ${last_page}                      ${adm_table_pages_locator}    ${adm_table_first_page_locator}
    \  ...                                       ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
    \  Check Table Information                   ${current_page}                       ${page_size}                      ${number_items}               ${adm_table_row_xpath}    ${adm_table_info_locator}
    \  Click Element                             ${adm_table_previous_page_locator}
    \  Sleep                                     2 seconds
    \  Scroll To Top


Users Navigate to Last Page
    [Tags]                                       Users    Pagination
    [Documentation]                              CADR-2939: Users Navigate to Last Page
    Wait Until Element is Enabled                ${adm_table_length_locator}
    Select From List By Value                    ${adm_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                   ${adm_table_info_locator}
    ${last_page}=                                Get Last Page                         ${number_items}                   ${adm_table_length_locator}
    Click Element                                ${adm_table_last_page_locator}
    Sleep                                        2 seconds
    ${current_page}=                             Get Value                             ${adm_table_current_page_locator}
    Check State of Page Navigation Buttons       ${current_page}                       ${last_page}                      ${adm_table_pages_locator}    ${adm_table_first_page_locator}
    ...                                          ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
    Check Table Information                      ${current_page}                       ${page_size}                      ${number_items}               ${adm_table_row_xpath}    ${adm_table_info_locator}
    Scroll To Top


Users Navigate to First Page
    [Tags]                                       Users    Pagination
    [Documentation]                              CADR-2940: Users Navigate to First Page
    Wait Until Element is Enabled                ${adm_table_length_locator}
    Select From List By Value                    ${adm_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                   ${adm_table_info_locator}
    ${last_page}=                                Get Last Page                         ${number_items}                   ${adm_table_length_locator}
    Click Element                                ${adm_table_first_page_locator}
    Sleep                                        2 seconds
    ${current_page}=                             Get Value                             ${adm_table_current_page_locator}
    Check State of Page Navigation Buttons       ${current_page}                       ${last_page}                      ${adm_table_pages_locator}    ${adm_table_first_page_locator}
    ...                                          ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
    Check Table Information                      ${current_page}                       ${page_size}                      ${number_items}               ${adm_table_row_xpath}    ${adm_table_info_locator}
    Scroll To Top


Users Navigate to Specified Page
    [Tags]                                       Users    Pagination
    [Documentation]                              CADR-2941: Users Navigate to Specified Page
    Wait Until Element is Enabled                ${adm_table_length_locator}
    Select From List By Value                    ${adm_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                   ${adm_table_info_locator}
    ${last_page}=                                Get Last Page                         ${number_items}                   ${adm_table_length_locator}
    ${random_page}=                              Evaluate                              random.randint(1, ${last_page})   modules=random
    Input Text                                   ${adm_table_current_page_locator}     ${random_page}
	Sleep                                        2 seconds
    ${current_page}=                             Get Value                             ${adm_table_current_page_locator}
    Check State of Page Navigation Buttons       ${current_page}		               ${last_page}		                 ${adm_table_pages_locator}    ${adm_table_first_page_locator}
    ...                                          ${adm_table_previous_page_locator}    ${adm_table_next_page_locator}    ${adm_table_last_page_locator}
    Check Table Information                      ${current_page}                       ${page_size}                      ${number_items}               ${adm_table_row_xpath}    ${adm_table_info_locator}
    Scroll To Top


Filter Roles by Description with No Match
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2942: Filter Roles by Description with No Match
    Click Element                    ${adm_roles_text_locator}
    Wait Until Element Is Visible    ${adm_caption_roles_locator}
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_desc_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Description
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_desc}
    ${random}=                       Generate Random String        10       !@$%^&*()+=[]{}
    Input Text						 ${adm_role_filter_by_locator}          ${random}
    Press Key                        ${adm_role_filter_by_locator}          \\13 
    Verify Roles Filter By Elements  ${random}                              Description:
    Verify Roles Empty Data Table
    Click Element                    ${adm_role_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_x_locator}
    
    
Filter Roles by Description
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2943: Filter Roles by Description
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_desc_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Description
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_desc}
    ${search_string}=                Random Filter Entry Value              ${adm_role_table_row_xpath}    ${col_number_description}    ${adm_role_table_length_locator}    ${adm_role_table_locator}
    Enter Filter By Value            ${adm_role_filter_by_locator}          ${search_string}               ${adm_role_table_length_locator}
    Verify Roles Filter By Elements  ${search_string}                       Description:
    Verify Roles Data Table Result   ${search_string}                       ${col_number_description}
    Click Element                    ${adm_role_active_filter_clear_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_clear_locator}
    
    
Filter Roles by Date Updated Today
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2944: Filter Roles by Date Updated Today
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_date_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Date updated
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_date}
    Click Element                    ${adm_role_filter_by_locator}
	Wait Until Element Is Visible    ${rpt_filter_date_today_locator}
	Click Element                    ${rpt_filter_date_today_locator}
	${today}=                        Get Current Date                       result_format=%m/%d/%Y
	${expected_string}=              Set Variable                           ${today} - ${today}
    Verify Roles Filter By Elements  ${expected_string}                     Updated:
    Sleep                            2 seconds
    Verify Roles Data Table Result   ${today}                               ${col_number_lastupdated}
    Click Element                    ${adm_role_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_x_locator}
    
    
Filter Roles by Date Updated Yesterday
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2945: Filter Roles by Date Updated Yesterday
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_date_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Date updated
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_date}
    Click Element                    ${adm_role_filter_by_locator}
	Wait Until Element Is Visible    ${rpt_filter_date_yesterday_locator}
	Click Element                    ${rpt_filter_date_yesterday_locator}
	${today}=                        Get Current Date
	${yesterday}=                    Subtract Time From Date                ${today}           1 day    result_format=%m/%d/%Y
	${expected_string}=              Set Variable                           ${yesterday} - ${yesterday}
    Verify Roles Filter By Elements  ${expected_string}                     Updated:
    Sleep                            2 seconds
	${table_info}=                   Get Text                               ${adm_role_table_info_locator}
	Run Keyword If                   '${table_info}'=='Showing 0 Results'
	...                              Verify Roles Empty Data Table
	...  ELSE                        Verify Roles Data Table Result         ${yesterday}                ${col_number_lastupdated}
    Click Element                    ${adm_role_active_filter_clear_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_clear_locator}
    
    
Filter Roles by Date Updated Last 7 Days
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2946: Filter Roles by Date Updated Last 7 Days
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_date_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Date updated
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_date}
    Click Element                    ${adm_role_filter_by_locator}
	Wait Until Element Is Visible    ${rpt_filter_date_last7days_locator}
	Click Element                    ${rpt_filter_date_last7days_locator}
	${date_range_value}=             Get Text                               ${adm_role_active_filter_by_locator}
	${date_range_value}=             Get Substring                          ${date_range_value}         9
    Verify Roles Filter By Elements  ${date_range_value}                    Updated:
	${table_info}=                   Get Text                               ${adm_role_table_info_locator}
	Run Keyword If                   '${table_info}'=='Showing 0 Results'
	...                              Verify Roles Empty Data Table
	...  ELSE                        Verify Roles Date Range Result         ${date_range_value}         ${col_number_lastupdated}
    Click Element                    ${adm_role_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_x_locator}
    
    
Filter Roles by Date Updated Last 30 Days
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2947: Filter Roles by Date Updated Last 30 Days
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_date_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Date updated
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_date}
    Click Element                    ${adm_role_filter_by_locator}
	Wait Until Element Is Visible    ${rpt_filter_date_last30days_locator}
	Click Element                    ${rpt_filter_date_last30days_locator}
	${date_range_value}=             Get Text                               ${adm_role_active_filter_by_locator}
	${date_range_value}=             Get Substring                          ${date_range_value}         9
    Verify Roles Filter By Elements  ${date_range_value}                    Updated:
	${table_info}=                   Get Text                               ${adm_role_table_info_locator}
	Run Keyword If                   '${table_info}'=='Showing 0 Results'
	...                              Verify Roles Empty Data Table
	...  ELSE                        Verify Roles Date Range Result         ${date_range_value}         ${col_number_lastupdated}
    Click Element                    ${adm_role_active_filter_clear_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_clear_locator}
    
    
Filter Roles by Date Updated This Month
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2948: Filter Roles by Date Updated This Month
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_date_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Date updated
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_date}
    Click Element                    ${adm_role_filter_by_locator}
	Wait Until Element Is Visible    ${rpt_filter_date_thismonth_locator}
	Click Element                    ${rpt_filter_date_thismonth_locator}
	${date_range_value}=             Get Text                               ${adm_role_active_filter_by_locator}
	${date_range_value}=             Get Substring                          ${date_range_value}         9
    Verify Roles Filter By Elements  ${date_range_value}                    Updated:
	${table_info}=                   Get Text                               ${adm_role_table_info_locator}
	Run Keyword If                   '${table_info}'=='Showing 0 Results'
	...                              Verify Roles Empty Data Table
	...  ELSE                        Verify Roles Date Range Result         ${date_range_value}         ${col_number_lastupdated}
    Click Element                    ${adm_role_active_filter_x_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_x_locator}
    
    
Filter Roles by Date Updated Last Month
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2949: Filter Roles by Date Updated Last Month
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_date_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Date updated
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_date}
    Click Element                    ${adm_role_filter_by_locator}
	Wait Until Element Is Visible    ${rpt_filter_date_lastmonth_locator}
	Click Element                    ${rpt_filter_date_lastmonth_locator}
	${date_range_value}=             Get Text                               ${adm_role_active_filter_by_locator}
	${date_range_value}=             Get Substring                          ${date_range_value}         9
    Verify Roles Filter By Elements  ${date_range_value}                    Updated:
	${table_info}=                   Get Text                               ${adm_role_table_info_locator}
	Run Keyword If                   '${table_info}'=='Showing 0 Results'
	...                              Verify Roles Empty Data Table
	...  ELSE                        Verify Roles Date Range Result         ${date_range_value}         ${col_number_lastupdated}
    Click Element                    ${adm_role_active_filter_clear_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_clear_locator}
    
    
Filter Roles by Date Updated Custom Range
    [Tags]                           Roles    Filtering
    [Documentation]                  CADR-2950: Filter Roles by Date Updated Custom Range
    Wait Until Element Is Enabled    ${adm_role_filter_button_locator}
    Click Button                     ${adm_role_filter_button_locator}
    Element Should Be Visible        ${adm_role_filter_name_locator}
    Element Should Be Visible        ${adm_role_filter_desc_locator}
    Element Should Be Visible        ${adm_role_filter_date_locator}
    Click Element                    ${adm_role_filter_date_locator}
    Wait Until Element Contains      ${adm_role_filter_button_locator}      Date updated
    ${filter_by_value}=              Get Element Attribute                  ${adm_role_filter_by_locator}@placeholder
    Should Be Equal                  ${filter_by_value}                     ${adm_filter_by_placeholder_date}
    Click Element                    ${adm_role_filter_by_locator}
	Wait Until Element Is Visible    ${rpt_filter_date_custom_locator}
	Click Element                    ${rpt_filter_date_custom_locator}
	Wait Until Element Is Visible    ${calendar_left_input_locator} 
	Wait Until Element Is Visible    ${calendar_right_input_locator}  
	${current_datetime}=             Get Current Date                       result_format=datetime
	${custom_range_start_datetime}=  Get Random Date Within Range           ${date_interval_start}      ${date_interval_end}              ${current_datetime}               subtract   
	${range_interval}=               Subtract Date From Date                ${current_datetime}         ${custom_range_start_datetime}    verbose
	${range_interval}=               Fetch From Left                        ${range_interval}           days
	${date_interval_end}=            Replace Variables                      ${range_interval}
	${custom_range_end_datetime}=    Get Random Date Within Range           ${date_interval_start}      ${date_interval_end}              ${custom_range_start_datetime}    add
	${custom_range_start}=           Convert Date                           ${custom_range_start_datetime}    result_format=%m/%d/%Y   
	${custom_range_end}=             Convert Date                           ${custom_range_end_datetime}      result_format=%m/%d/%Y
	Input Text                       ${calendar_left_input_locator}         ${custom_range_start}
	Press Key                        ${calendar_left_input_locator}         \\13
	Input Text                       ${calendar_right_input_locator}        ${custom_range_end}
	Press Key                        ${calendar_right_input_locator}        \\13  
	Click Element At Coordinates     ${calendar_outside_locator}            0    0
	${date_range_value}=             Get Text                               ${adm_role_active_filter_by_locator}
	${date_range_value}=             Get Substring                          ${date_range_value}         9
    Verify Roles Filter By Elements  ${date_range_value}                    Updated:
	${table_info}=                   Get Text                               ${adm_role_table_info_locator}
	Run Keyword If                   '${table_info}'=='Showing 0 Results'
	...                              Verify Roles Empty Data Table
	...  ELSE                        Verify Roles Date Range Result         ${date_range_value}         ${col_number_lastupdated}
    Click Element                    ${adm_role_active_filter_clear_locator}
    Wait Until Element Is Not Visible    ${adm_role_active_filter_clear_locator}
    
 
Sort Roles by Name
    [Tags]                           Roles    Sorting
    [Documentation]                  CADR-2951: Sort Roles by Name
    Wait Until Element is Enabled    ${adm_role_table_length_locator}
    Select From List By Value        ${adm_role_table_length_locator}    ${SHOW_100_ENTRIES}
    Sleep                            3 seconds
    Wait Until Element Is Enabled    ${adm_role_table_colhead_name_locator}
    Click Element                    ${adm_role_table_colhead_name_locator}
    Sleep                            2 seconds
    ${order1}=                       Get Element Attribute               ${adm_role_table_colhead_name_locator}@aria-sort
    Verify Roles Table Sorting       ${order1}                           ${col_number_rolename}
    # reverses order of sorting
    Click Element                    ${adm_role_table_colhead_name_locator}
    Sleep                            2 seconds
    ${order2}=                       Get Element Attribute               ${adm_role_table_colhead_name_locator}@aria-sort
    Run Keyword If                   '${order1}' == 'ascending'          Should Be Equal As Strings    ${order2}    descending
    ...  ELSE IF                     '${order1}' == 'descending'         Should Be Equal As Strings    ${order2}    ascending
    ...  ELSE                        FAIL                                Invalid order name '${order1}'. Should be 'ascending' or 'descending' only
    Verify Roles Table Sorting       ${order2}                           ${col_number_rolename}
    
    
Sort Roles by Description
    [Tags]                           Roles    Sorting
    [Documentation]                  CADR-2952: Sort Roles by Description
    Wait Until Element is Enabled    ${adm_role_table_length_locator}
    Select From List By Value        ${adm_role_table_length_locator}    ${SHOW_100_ENTRIES}
    Sleep                            3 seconds
    Wait Until Element Is Enabled    ${adm_role_table_colhead_desc_locator}
    Click Element                    ${adm_role_table_colhead_desc_locator}
    Sleep                            2 seconds
    ${order1}=                       Get Element Attribute               ${adm_role_table_colhead_desc_locator}@aria-sort
    Verify Roles Table Sorting       ${order1}                           ${col_number_description}     True
    # reverses order of sorting
    Click Element                    ${adm_role_table_colhead_desc_locator}
    Sleep                            2 seconds
    ${order2}=                       Get Element Attribute               ${adm_role_table_colhead_desc_locator}@aria-sort
    Run Keyword If                   '${order1}' == 'ascending'          Should Be Equal As Strings    ${order2}    descending
    ...  ELSE IF                     '${order1}' == 'descending'         Should Be Equal As Strings    ${order2}    ascending
    ...  ELSE                        FAIL                                Invalid order name '${order1}'. Should be 'ascending' or 'descending' only
    Verify Roles Table Sorting       ${order2}                           ${col_number_description}     True
    
    
Sort Roles by Last Updated
    [Tags]                           Roles    Sorting
    [Documentation]                  CADR-2953: Sort Roles by Last Updated
    Wait Until Element is Enabled    ${adm_role_table_length_locator}
    Select From List By Value        ${adm_role_table_length_locator}    ${SHOW_100_ENTRIES}
    Sleep                            3 seconds
    Wait Until Element Is Enabled    ${adm_role_table_colhead_date_locator}
    Click Element                    ${adm_role_table_colhead_date_locator}
    Sleep                            2 seconds
    ${order1}=                       Get Element Attribute               ${adm_role_table_colhead_date_locator}@aria-sort
    Verify Roles Table Sorting       ${order1}                           ${col_number_lastupdated}
    # reverses order of sorting
    Click Element                    ${adm_role_table_colhead_date_locator}
    Sleep                            2 seconds
    ${order2}=                       Get Element Attribute               ${adm_role_table_colhead_date_locator}@aria-sort
    Run Keyword If                   '${order1}' == 'ascending'          Should Be Equal As Strings    ${order2}    descending
    ...  ELSE IF                     '${order1}' == 'descending'         Should Be Equal As Strings    ${order2}    ascending
    ...  ELSE                        FAIL                                Invalid order name '${order1}'. Should be 'ascending' or 'descending' only
    Verify Roles Table Sorting       ${order2}                           ${col_number_lastupdated}
    
    

Roles Show Specified Number of Table Entries
    [Tags]                                       Roles    Pagination
    [Documentation]                              CADR-2954: Roles Show Specified Number of Table Entries
    :FOR    ${size}    IN    @{PAGE_SIZE_LIST}
    \  Wait Until Element is Enabled             ${adm_role_table_length_locator}
    \  Select From List By Value                 ${adm_role_table_length_locator}           ${size}
    \  Sleep                                     3 seconds
    \  ${number_items}=                          Get Number of Items                        ${adm_role_table_info_locator}
	\  ${current_page}=                          Get Value                                  ${adm_role_table_current_page_locator}
    \  Check Show Entries Value	                 ${size}                                    ${adm_role_table_length_locator}       ${adm_role_table_row_xpath}        ${adm_role_table_info_locator}
	\  Check Table Information                   ${current_page}                            ${size}                                ${number_items}                    ${adm_role_table_row_xpath}    ${adm_role_table_info_locator}
	\  Scroll To Top


Roles Forward Navigation of Table Pages
	[Tags]                                       Roles    Pagination
	[Documentation]                              CADR-2955: Roles Forward Navigation of Table Pages
	Wait Until Element is Enabled                ${adm_role_table_length_locator}
    Select From List By Value                    ${adm_role_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                        ${adm_role_table_info_locator}
    ${last_page}=                                Get Last Page                              ${number_items}                        ${adm_role_table_length_locator}
	:FOR    ${i}    IN RANGE    1    ${last_page}+1
	\  ${current_page}=                          Get Value                                  ${adm_role_table_current_page_locator}
	\  Check State of Page Navigation Buttons    ${current_page}                            ${last_page}                           ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}
	\  ...                                       ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
	\  Check Table Information                   ${current_page}                            ${page_size}                           ${number_items}                    ${adm_role_table_row_xpath}    ${adm_role_table_info_locator}
	\  Click Element                             ${adm_role_table_next_page_locator}
	\  Sleep                                     2 seconds
	\  Scroll To Top


Roles Backward Navigation of Table Pages
	[Tags]                                       Roles    Pagination
	[Documentation]                              CADR-2956: Roles Backward of Table Pages
	Wait Until Element is Enabled                ${adm_role_table_length_locator}
    Select From List By Value                    ${adm_role_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                        ${adm_role_table_info_locator}
    ${last_page}=                                Get Last Page                              ${number_items}                        ${adm_role_table_length_locator}
	:FOR    ${i}    IN RANGE    ${last_page}     0    -1
	\  ${current_page}=                          Get Value                                  ${adm_role_table_current_page_locator}
	\  Check State of Page Navigation Buttons    ${current_page}                            ${last_page}                           ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}
	\  ...                                       ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
	\  Check Table Information                   ${current_page}                            ${page_size}                           ${number_items}                    ${adm_role_table_row_xpath}    ${adm_role_table_info_locator}
	\  Click Element                             ${adm_role_table_previous_page_locator}
	\  Sleep                                     2 seconds
	\  Scroll To Top


Roles Navigate to Last Page
	[Tags]                                       Roles    Pagination
	[Documentation]                              CADR-2957: Roles Navigate to Last Page
	Wait Until Element is Enabled                ${adm_role_table_length_locator}
    Select From List By Value                    ${adm_role_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                        ${adm_role_table_info_locator}
    ${last_page}=                                Get Last Page                              ${number_items}                        ${adm_role_table_length_locator}
	Click Element                                ${adm_role_table_last_page_locator}
	Sleep                                        2 seconds
	${current_page}=                             Get Value                                  ${adm_role_table_current_page_locator}
	Check State of Page Navigation Buttons       ${current_page}                            ${last_page}                           ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}
	...                                          ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
	Check Table Information                      ${current_page}                            ${page_size}                           ${number_items}                    ${adm_role_table_row_xpath}    ${adm_role_table_info_locator}
	Scroll To Top


Roles Navigate to First Page
	[Tags]                                       Roles    Pagination
	[Documentation]                              CADR-2958: Roles Navigate to First Page
	Wait Until Element is Enabled                ${adm_role_table_length_locator}
    Select From List By Value                    ${adm_role_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                        ${adm_role_table_info_locator}
    ${last_page}=                                Get Last Page                              ${number_items}                        ${adm_role_table_length_locator}
	Click Element                                ${adm_role_table_first_page_locator}
	Sleep                                        2 seconds
	${current_page}=                             Get Value                                  ${adm_role_table_current_page_locator}
	Check State of Page Navigation Buttons       ${current_page}                            ${last_page}                           ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}
	...                                          ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
	Check Table Information                      ${current_page}                            ${page_size}                           ${number_items}                    ${adm_role_table_row_xpath}    ${adm_role_table_info_locator}
	Scroll To Top


Roles Navigate to Specified Page
	[Tags]                                       Roles    Pagination
	[Documentation]                              CADR-2959: Users Navigate to Specified Page
	Wait Until Element is Enabled                ${adm_role_table_length_locator}
    Select From List By Value                    ${adm_role_table_length_locator}           ${page_size}
    Sleep                                        3 seconds
    ${number_items}=                             Get Number of Items                        ${adm_role_table_info_locator}
    ${last_page}=                                Get Last Page                              ${number_items}                        ${adm_role_table_length_locator}
    ${random_page}=                              Evaluate                                   random.randint(1, ${last_page})        modules=random
    Input Text                                   ${adm_role_table_current_page_locator}     ${random_page}
	Sleep                                        2 seconds
	${current_page}=                             Get Value                                  ${adm_role_table_current_page_locator}
	Check State of Page Navigation Buttons       ${current_page}                            ${last_page}                           ${adm_role_table_pages_locator}    ${adm_role_table_first_page_locator}
	...                                          ${adm_role_table_previous_page_locator}    ${adm_role_table_next_page_locator}    ${adm_role_table_last_page_locator}
	Check Table Information                      ${current_page}                            ${page_size}                           ${number_items}                    ${adm_role_table_row_xpath}    ${adm_role_table_info_locator}
