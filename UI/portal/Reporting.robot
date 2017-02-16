*** Settings ***
Documentation    A test suite for testing the Reporting Page of Rave Portal.
...				     \n| * Reporting Page Elements * |
...                  \n| * Show Specified Number of Table Entries * |
...                  \n| * Click Report Name Link * |
...                  \n  *Filter Reports*
...				     \n| * Filter Reports by Name * | ------------------------------------- | _* Filter Reports by Type *_ | 
...				     \n| * Filter Reports by Creation Date (Today) * | ----------------- | _* Filter Reports by Creation Date (Yesterday) *_ | 
...				     \n| * Filter Reports by Creation Date (Last 7 Days) * | ---------- | _* Filter Reports by Creation Date (Last 30 Days) * _ |
...				     \n| * Filter Reports by Creation Date (This Month) * | ----------- | _* Filter Reports by Creation Date (Last Month) *_ |
...				     \n| * Filter Reports by Creation Date (Custom Range) * | 
...				     \n| * Filter Reports by Interval (Daily) * | ---------- | _* Filter Reports by Interval (Weekly) *_ | ---------- | * Filter Reports by Interval (Monthly) * |
...				     \n| * Filter Reports by Format (CSV) * | ----------- | _* Filter Reports by Format (Excel) *_ | ------------ | * Filter Reports by Format (PDF) * |
...				     \n| * Filter Reports More than Once and then Clear All Filters * |   
...                  \n  *Sort Reports*
...				     \n| * Sort Reports by Name * | ------------ | _* Sort Reports by Creation Date *_ | ---------- | * Sort Reports by Type * |
...				     \n| * Sort Reports by Interval * | ---------- | _* Sort Reports by Format *_ |
...                  \n  *Navigate Table Pages*
...				     \n| * Forward Navigation of Table Pages * | ---------- | _* Backward Navigation of Table Pages *_ |
...				     \n| * Navigate to Last Page * | -------------------------- | _* Navigate to First Page *_ | ----------------- | * Navigate to Specified Page * |

Resource          ../resource/resource_portal.robot
Resource          ../resource/keywords_reporting.robot

Suite Setup       Run Keywords          Open Rave Portal    Login Rave Portal    
Suite Teardown    Close All Browsers     


*** Variables ***
#************************ Reporting Page Text Displays *************************
${rpt_filter_by_placeholder_name}     Filter by Name...
${rpt_filter_by_placeholder_name}     Filter by Name...
${rpt_filter_by_placeholder_date}     Filter by Creation Date...
${rpt_filter_by_placeholder_type}     Filter by Type...

#******************** Creation Date Custom Range Interval **********************
${rpt_interval_start}    0
${rpt_interval_end}      90

#**************************** Table Column Number ******************************
${col_number_name}             1
${col_number_creation_date}    2
${col_number_type}             3
${col_number_interval}         4
${col_number_format}           5


*** Test Cases ***
Reporting Page Elements
	[Tags]                               In_Progress    Reporting    Filtering    Sorting    Show_Entries    Pagination    Name_Link
	[Documentation]                      CADR-2768:Reporting Page Elements 
	Wait Until Element Is Visible	     ${nav_bar_reporting_locator}   
	Wait Until Element Is Enabled	     ${nav_bar_reporting_locator}
	Click Link                           ${nav_bar_reporting_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator} 
	Wait Until Element Is Visible        ${rpt_caption_locator}
	Wait Until Element Is Visible        ${rpt_filter_button_locator}
	Element Should Contain               ${rpt_filter_button_locator}          Name
	Wait Until Element Is Visible        ${rpt_filter_by_locator}
	${rpt_filter_by}=                    Get Element Attribute                 ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings           ${rpt_filter_by_placeholder_name}     ${rpt_filter_by}
	Wait Until Element Is Visible        ${rpt_table_label_locator}
	Element Should Contain               ${rpt_table_label_locator}            Show
	Element Should Contain               ${rpt_table_label_locator}            entries
	Wait Until Element Is Visible        ${rpt_table_length_locator}
	List Selection Should Be             ${rpt_table_length_locator}           ${show_10_entries}
	Wait Until Element Is Visible        ${rpt_table_locator}
	Table Header Should Contain          ${rpt_table_locator}                  Name
	Table Header Should Contain          ${rpt_table_locator}                  Creation Date
	Table Header Should Contain          ${rpt_table_locator}                  Type
	Table Header Should Contain          ${rpt_table_locator}                  Interval
	Table Header Should Contain          ${rpt_table_locator}                  Format
	Wait Until Element Is Visible        ${rpt_table_info_locator}
	Element Should Contain               ${rpt_table_info_locator}             Showing
	Element Should Contain               ${rpt_table_info_locator}             to
	Element Should Contain               ${rpt_table_info_locator}             of
	Element Should Contain               ${rpt_table_info_locator}             Items
	Page Should Contain Element          ${rpt_table_first_page_locator}
	Page Should Contain Element          ${rpt_table_previous_page_locator}
	Page Should Contain Element          ${rpt_table_next_page_locator}
	Page Should Contain Element          ${rpt_table_last_page_locator}

Filter Reports by Name
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2769:Filter Reports by Name
	Wait Until Element Is Enabled        ${rpt_table_length_locator}
	${filter_by_name}=                   Random Filter Entry Value            ${rpt_table_rows}    ${col_number_name}    ${rpt_table_length_locator}    ${rpt_table_locator}
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_name_locator}
	Wait Until Element Is Enabled        ${rpt_filter_by_locator}
	${rpt_filter_by}=                    Get Element Attribute                ${rpt_filter_by_locator}@placeholder	
	Should Be Equal As Strings           ${rpt_filter_by_placeholder_name}    ${rpt_filter_by}
	Enter Filter By Value                ${rpt_filter_by_locator}             ${filter_by_name}     ${rpt_table_length_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	Verify Filter By Results             ${filter_by_name}                    ${col_number_name}    ${filter_by_name}    Name:    
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports by Type
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2770:Filter Reports by Type
	${filter_by_type}=                   Random Filter Entry Value            ${rpt_table_rows}     ${col_number_type}    ${rpt_table_length_locator}    ${rpt_table_locator}
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_type_locator}
	Wait Until Element Is Enabled        ${rpt_filter_by_locator}
	${rpt_filter_by}=                    Get Element Attribute                ${rpt_filter_by_locator}@placeholder	
	Should Be Equal As Strings           ${rpt_filter_by_placeholder_type}    ${rpt_filter_by}
	Enter Filter By Value                ${rpt_filter_by_locator}             ${filter_by_type}     ${rpt_table_length_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	Verify Filter By Results             ${filter_by_type}                    ${col_number_type}    ${filter_by_type}    Type:     
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports by Creation Date (Today)
	[Tags]                                 In_Progress    Reporting    Filtering
	[Documentation]                        CADR-2771:Filter Reports by Creation Date (Today)
	Wait Until Element Is Enabled          ${rpt_filter_button_locator}
	Click Button                           ${rpt_filter_button_locator}
	Sleep                                  2s
	Click Link                             ${rpt_filter_date_locator}
	Wait Until Element Is Enabled          ${rpt_filter_by_locator}
	${rpt_filter_by}=                      Get Element Attribute                ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings             ${rpt_filter_by_placeholder_date}    ${rpt_filter_by}
	Click Element                          ${rpt_filter_by_locator}
	Wait Until Element Is Visible          ${rpt_filter_date_today_locator}
	Click Element                          ${rpt_filter_date_today_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	${rpt_filter_by_value}=                Get Text                             ${rpt_active_filter_by_locator}
	${rpt_filter_by_value}=                Get Substring                        ${rpt_filter_by_value}              15
	Verify Filter By Date Range Results    ${rpt_filter_by_value}               ${col_number_creation_date}         today
	Click Element                          ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}

Filter Reports by Creation Date (Yesterday)
	[Tags]                                 In_Progress    Reporting    Filtering
	[Documentation]                        CADR-2772:Filter Reports by Creation Date (Yesterday)
	Wait Until Element Is Enabled          ${rpt_filter_button_locator}
	Click Button                           ${rpt_filter_button_locator}
	Sleep                                  2s
	Click Link                             ${rpt_filter_date_locator}
	Wait Until Element Is Enabled          ${rpt_filter_by_locator}
	${rpt_filter_by}=                      Get Element Attribute                ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings             ${rpt_filter_by_placeholder_date}    ${rpt_filter_by}
	Click Element                          ${rpt_filter_by_locator}
	Wait Until Element Is Visible          ${rpt_filter_date_yesterday_locator}
	Click Element                          ${rpt_filter_date_yesterday_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	${rpt_filter_by_value}=                Get Text                             ${rpt_active_filter_by_locator}
	${rpt_filter_by_value}=                Get Substring                        ${rpt_filter_by_value}              15
	Verify Filter By Date Range Results    ${rpt_filter_by_value}               ${col_number_creation_date}         yesterday  
	Click Element                          ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}

Filter Reports by Creation Date (Last 7 Days)
	[Tags]                                 In_Progress    Reporting    Filtering
	[Documentation]                        CADR-2773:Filter Reports by Creation Date (Last 7 Days)
	Wait Until Element Is Enabled          ${rpt_filter_button_locator}
	Click Button                           ${rpt_filter_button_locator}
	Sleep                                  2s
	Click Link                             ${rpt_filter_date_locator}
	Wait Until Element Is Enabled          ${rpt_filter_by_locator}
	${rpt_filter_by}=                      Get Element Attribute                   ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings             ${rpt_filter_by_placeholder_date}       ${rpt_filter_by}
	Click Element                          ${rpt_filter_by_locator}
	Wait Until Element Is Visible          ${rpt_filter_date_last7days_locator}    
	Click Element                          ${rpt_filter_date_last7days_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	${rpt_filter_by_value}=                Get Text                                ${rpt_active_filter_by_locator}
	${rpt_filter_by_value}=                Get Substring                           ${rpt_filter_by_value}              15
	Verify Filter By Date Range Results    ${rpt_filter_by_value}                  ${col_number_creation_date}         last7  
	Click Element                          ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}

Filter Reports by Creation Date (Last 30 Days)
	[Tags]                                 In_Progress    Reporting    Filtering
	[Documentation]                        CADR-2774:Filter Reports by Creation Date (Last 30 Days)
	Wait Until Element Is Enabled          ${rpt_filter_button_locator}
	Click Button                           ${rpt_filter_button_locator}
	Sleep                                  2s
	Click Link                             ${rpt_filter_date_locator}
	Wait Until Element Is Enabled          ${rpt_filter_by_locator}
	${rpt_filter_by}=                      Get Element Attribute                    ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings             ${rpt_filter_by_placeholder_date}        ${rpt_filter_by}
	Click Element                          ${rpt_filter_by_locator}
	Wait Until Element Is Visible          ${rpt_filter_date_last30days_locator}    
	Click Element                          ${rpt_filter_date_last30days_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	${rpt_filter_by_value}=                Get Text                                 ${rpt_active_filter_by_locator}
	${rpt_filter_by_value}=                Get Substring                            ${rpt_filter_by_value}              15
	Verify Filter By Date Range Results    ${rpt_filter_by_value}                   ${col_number_creation_date}         last30
	Click Element                          ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}

Filter Reports by Creation Date (This Month)
	[Tags]                                 In_Progress    Reporting    Filtering
	[Documentation]                        CADR-2775:Filter Reports by Creation Date (This Month)
	Wait Until Element Is Enabled          ${rpt_filter_button_locator}
	Click Button                           ${rpt_filter_button_locator}
	Sleep                                  2s
	Click Link                             ${rpt_filter_date_locator}
	Wait Until Element Is Enabled          ${rpt_filter_by_locator}
	${rpt_filter_by}=                      Get Element Attribute                   ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings             ${rpt_filter_by_placeholder_date}       ${rpt_filter_by}
	Click Element                          ${rpt_filter_by_locator}
	Wait Until Element Is Visible          ${rpt_filter_date_thismonth_locator}    
	Click Element                          ${rpt_filter_date_thismonth_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	${rpt_filter_by_value}=                Get Text                                ${rpt_active_filter_by_locator}
	${rpt_filter_by_value}=                Get Substring                           ${rpt_filter_by_value}              15
	Verify Filter By Date Range Results    ${rpt_filter_by_value}                  ${col_number_creation_date}         month
	Click Element                          ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}

Filter Reports by Creation Date (Last Month)
	[Tags]                                 In_Progress    Reporting    Filtering
	[Documentation]                        CADR-2776:Filter Reports by Creation Date (Last Month)
	Wait Until Element Is Enabled          ${rpt_filter_button_locator}
	Click Button                           ${rpt_filter_button_locator}
	Sleep                                  2s
	Click Link                             ${rpt_filter_date_locator}
	Wait Until Element Is Enabled          ${rpt_filter_by_locator}
	${rpt_filter_by}=                      Get Element Attribute                   ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings             ${rpt_filter_by_placeholder_date}       ${rpt_filter_by}
	Click Element                          ${rpt_filter_by_locator}
	Wait Until Element Is Visible          ${rpt_filter_date_lastmonth_locator}
	Click Element                          ${rpt_filter_date_lastmonth_locator}    
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	${rpt_filter_by_value}=                Get Text                                ${rpt_active_filter_by_locator}
	${rpt_filter_by_value}=                Get Substring                           ${rpt_filter_by_value}              15
	Verify Filter By Date Range Results    ${rpt_filter_by_value}                  ${col_number_creation_date}         lastmonth 
	Click Element                          ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}

Filter Reports by Creation Date (Custom Range)
	[Tags]                                 In_Progress    Reporting    Filtering
	[Documentation]                        CADR-2777:Filter Reports by Creation Date (Custom Range)
	Wait Until Element Is Enabled          ${rpt_filter_button_locator}
	Click Button                           ${rpt_filter_button_locator}
	Sleep                                  2s
	Click Link                             ${rpt_filter_date_locator}
	Wait Until Element Is Enabled          ${rpt_filter_by_locator}
	${rpt_filter_by}=                      Get Element Attribute                ${rpt_filter_by_locator}@placeholder
	Should Be Equal As Strings             ${rpt_filter_by_placeholder_date}    ${rpt_filter_by}
	Click Element                          ${rpt_filter_by_locator}
	Wait Until Element Is Visible          ${rpt_filter_date_custom_locator}
	Click Element                          ${rpt_filter_date_custom_locator}
	${rpt_filter_by_value}=                Get Element Attribute                ${rpt_filter_by_locator}@value
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	Wait Until Element Is Visible          ${Calendar_left_input_locator}
	Wait Until Element Is Visible          ${Calendar_right_input_locator}  
	Sleep                                  2s
	${current_datetime}=                   Get Current Date                     result_format=datetime
	${custom_range_start_datetime}=        Get Random Date Within Range         ${rpt_interval_start}               ${rpt_interval_end}               ${current_datetime}    subtract   
	${range_interval}=                     Subtract Date From Date              ${current_datetime}                 ${custom_range_start_datetime}    verbose
	${rpt_interval_end}=                   Remove String Using Regexp           ${range_interval}                   days                              day                    seconds    second
	${custom_range_end_datetime}=          Get Random Date Within Range         ${rpt_interval_start}               ${rpt_interval_end}               ${custom_range_start_datetime}
	...                                                                         add
	${custom_range_start}=                 Convert Date                         ${custom_range_start_datetime}      result_format=%m/%d/%Y   
	${custom_range_end}=                   Convert Date                         ${custom_range_end_datetime}        result_format=%m/%d/%Y
	Input Text                             ${Calendar_left_input_locator}       ${custom_range_start}
	Press Key                              ${Calendar_left_input_locator}       \\13                                #ENTER key
	Input Text                             ${Calendar_right_input_locator}      ${custom_range_end}
	Press Key                              ${Calendar_right_input_locator}      \\13                                #ENTER key
	Wait Until Element Is Not Visible      ${loading_spinner_locator}
	Click Element                          ${Calendar_outside_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator} 
	${rpt_filter_by_value}=                Get Text                             ${rpt_active_filter_by_locator}
	${rpt_filter_by_value}=                Get Substring                        ${rpt_filter_by_value}              15
	Verify Filter By Date Range Results    ${rpt_filter_by_value}               ${col_number_creation_date}         custom
	Click Element                          ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible      ${loading_spinner_locator}

Filter Reports by Interval (Daily)
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2781:Filter Reports by Interval (Daily)
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_interval_locator}
	Wait Until Element Is Enabled        ${rpt_interval_button_locator}
	Click Button                         ${rpt_interval_button_locator}
	Wait Until Element Is Enabled        ${rpt_interval_daily_locator}
	Click Link                           ${rpt_interval_daily_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	${rpt_filter_by_value}=              Replace Variables                 Daily
	Verify Filter By Results             ${rpt_filter_by_value}            ${col_number_interval}    ${rpt_filter_by_value}    Interval:   
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports by Interval (Weekly)
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2782:Filter Reports by Interval (Weekly)
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_interval_locator}
	Wait Until Element Is Enabled        ${rpt_interval_button_locator}
	Click Button                         ${rpt_interval_button_locator}
	Wait Until Element Is Enabled        ${rpt_interval_weekly_locator}
	Click Link                           ${rpt_interval_weekly_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	${rpt_filter_by_value}=              Replace Variables                 Weekly
	Verify Filter By Results             ${rpt_filter_by_value}            ${col_number_interval}    ${rpt_filter_by_value}    Interval:   
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports by Interval (Monthly)
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2783:Filter Reports by Interval (Monthly)
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_interval_locator}
	Wait Until Element Is Enabled        ${rpt_interval_button_locator}
	Click Button                         ${rpt_interval_button_locator}
	Wait Until Element Is Enabled        ${rpt_interval_monthly_locator}
	Click Link                           ${rpt_interval_monthly_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	${rpt_filter_by_value}=              Replace Variables                  Monthly
	Verify Filter By Results             ${rpt_filter_by_value}             ${col_number_interval}    ${rpt_filter_by_value}    Interval:   
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports by Format (CSV)
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2784:Filter Reports by Format (CSV)
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_format_locator}
	Wait Until Element Is Enabled        ${rpt_format_button_locator}
	Click Button                         ${rpt_format_button_locator}
	Wait Until Element Is Enabled        ${rpt_format_csv_locator}
	Click Link                           ${rpt_format_csv_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	${rpt_filter_by_value}=              Replace Variables                 CSV
	Verify Filter By Results             ${rpt_filter_by_value}            ${col_number_format}    ${rpt_filter_by_value}    Format:   
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports by Format (Excel)
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2785:Filter Reports by Format (Excel)
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_format_locator}
	Wait Until Element Is Enabled        ${rpt_format_button_locator}
	Click Button                         ${rpt_format_button_locator}
	Wait Until Element Is Enabled        ${rpt_format_excel_locator}
	Click Link                           ${rpt_format_excel_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	${rpt_filter_by_value}=              Replace Variables                 Excel
	Verify Filter By Results             ${rpt_filter_by_value}            ${col_number_format}    ${rpt_filter_by_value}    Format:   
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports by Format (PDF)
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2786:Filter Reports by Format (PDF)
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_format_locator}
	Wait Until Element Is Enabled        ${rpt_format_button_locator}
	Click Button                         ${rpt_format_button_locator}
	Wait Until Element Is Enabled        ${rpt_format_pdf_locator}
	Click Link                           ${rpt_format_pdf_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	${rpt_filter_by_value}=              Replace Variables                 PDF
	Verify Filter By Results             ${rpt_filter_by_value}            ${col_number_format}    ${rpt_filter_by_value}    Format:   
	Click Element                        ${rpt_active_filter_x_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}

Filter Reports More than Once and then Clear All Filters
	[Tags]                               In_Progress    Reporting    Filtering
	[Documentation]                      CADR-2797:Filter Reports More than Once and then Clear All Filters
	${filter_by_type}=                   Random Filter Entry Value            ${rpt_table_rows}    ${col_number_type}    ${rpt_table_length_locator}    ${rpt_table_locator}
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_type_locator}
	Wait Until Element Is Enabled        ${rpt_filter_by_locator}
	${rpt_filter_by}=                    Get Element Attribute                ${rpt_filter_by_locator}@placeholder	
	Should Be Equal As Strings           ${rpt_filter_by_placeholder_type}    ${rpt_filter_by}
	Enter Filter By Value                ${rpt_filter_by_locator}             ${filter_by_type}    ${rpt_table_length_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	Verify Filter By Results             ${filter_by_type}                    ${col_number_type}   ${filter_by_type}    Type:
	     
	${filter_by_name}=                   Random Filter Entry Value            ${rpt_table_rows}    ${col_number_name}    ${rpt_table_length_locator}    ${rpt_table_locator}
	Wait Until Element Is Enabled        ${rpt_filter_button_locator}
	Click Button                         ${rpt_filter_button_locator}
	Sleep                                2s
	Click Link                           ${rpt_filter_name_locator}
	Wait Until Element Is Enabled        ${rpt_filter_by_locator}
	${rpt_filter_by}=                    Get Element Attribute                ${rpt_filter_by_locator}@placeholder	
	Should Be Equal As Strings           ${rpt_filter_by_placeholder_name}    ${rpt_filter_by}
	Enter Filter By Value                ${rpt_filter_by_locator}             ${filter_by_name}    ${rpt_table_length_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	Verify Filter By Results             ${filter_by_name}                    ${col_number_name}   ${filter_by_name}    Name:     
	Click Element                        ${rpt_active_filter_clear_locator}
	Wait Until Element Is Not Visible    ${loading_spinner_locator}
	Element Should Not Be Visible        ${rpt_active_filter_x_locator}

Sort Reports by Name
	[Tags]                           In_Progress    Reporting    Sorting
	[Documentation]                  CADR-2798:Sort Reports by Name
	Wait Until Element Is Enabled    ${rpt_table_name_locator}
	Click Element                    ${rpt_table_name_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute        ${rpt_table_name_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		  ${col_number_name} 		         ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List        ${col_number_name}
	${list_count}=                   Get Length                   ${sorted_list}
	Check Sorting                    ${sorted_list}               ${list_count}                      ${order}
	# reverses order of sorting
	Click Element                    ${rpt_table_name_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute        ${rpt_table_name_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		  ${col_number_name} 		         ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List        ${col_number_name}
	${list_count}=                   Get Length                   ${sorted_list}
	Check Sorting                    ${sorted_list}               ${list_count}                      ${order}

Sort Reports by Creation Date
	[Tags]                           In_Progress    Reporting    Sorting
	[Documentation]                  CADR-2799:Sort Reports by Creation Date
	Wait Until Element Is Enabled    ${rpt_table_creation_date_locator}
	Click Element                    ${rpt_table_creation_date_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_creation_date_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_creation_date}		           ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_creation_date}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                               ${order}
	# reverses order of sorting
	Click Element                    ${rpt_table_creation_date_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_creation_date_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_creation_date}		           ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_creation_date}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                               ${order}

Sort Reports by Type
	[Tags]                           In_Progress    Reporting    Sorting
	[Documentation]                  CADR-2800:Sort Reports by Type
	Wait Until Element Is Enabled    ${rpt_table_type_locator}
	Click Element                    ${rpt_table_type_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_type_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_type}		          ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_type}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                      ${order}
	# reverses order of sorting
	Click Element                    ${rpt_table_type_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_type_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_type}		          ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_type}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                      ${order}

Sort Reports by Interval
	[Tags]                           In_Progress    Reporting    Sorting
	[Documentation]                  CADR-2801:Sort Reports by Interval
	Wait Until Element Is Enabled    ${rpt_table_interval_locator}
	Click Element                    ${rpt_table_interval_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_interval_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_interval} 		          ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_interval}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                          ${order}
	# reverses order of sorting
	Click Element                    ${rpt_table_interval_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_interval_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_interval} 		          ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_interval}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                          ${order}

Sort Reports by Format
	[Tags]                           In_Progress    Reporting    Sorting
	[Documentation]                  CADR-2802:Sort Reports by Format
	Wait Until Element Is Enabled    ${rpt_table_format_locator}
	Click Element                    ${rpt_table_format_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_format_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_format} 		        ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_format}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                        ${order}
	# reverses order of sorting
	Click Element                    ${rpt_table_format_locator}
	Sleep                            2s
	${order}=                        Get Element Attribute             ${rpt_table_format_locator}@aria-sort
	${sorted_list}=                  Get Table Column List		       ${col_number_format} 		        ${rpt_table_rows}    ${rpt_table_locator}
	#${sorted_list}=                  Get Table Column List             ${col_number_format}
	${list_count}=                   Get Length                        ${sorted_list}
	Check Sorting                    ${sorted_list}                    ${list_count}                        ${order}

Show Specified Number of Table Entries
	[Tags]                           In_Progress    Reporting    Show_Entries
	[Documentation]                  CADR-2803:Show Specified Number of Table Entries
	Wait Until Element is Enabled    ${rpt_table_length_locator}
    Select From List By Value        ${rpt_table_length_locator}    ${show_10_entries}
    Sleep                            3s
    Check Show Entries Value	     ${show_10_entries}		        ${rpt_table_length_locator}    ${rpt_table_rows}    ${rpt_table_info_locator}	
    #Check Show Entries Value         ${show_10_entries}
    Select From List By Value        ${rpt_table_length_locator}    ${show_25_entries}
    Sleep                            3s
    Check Show Entries Value	     ${show_25_entries}		        ${rpt_table_length_locator}    ${rpt_table_rows}	${rpt_table_info_locator}	
    #Check Show Entries Value         ${show_25_entries}
    Select From List By Value        ${rpt_table_length_locator}    ${show_50_entries}
    Sleep                            3s
    Check Show Entries Value	     ${show_50_entries}		        ${rpt_table_length_locator}    ${rpt_table_rows}	${rpt_table_info_locator}	
    #Check Show Entries Value         ${show_50_entries}
    Select From List By Value        ${rpt_table_length_locator}    ${show_100_entries}
    Sleep                            3s
    Check Show Entries Value	     ${show_100_entries}		    ${rpt_table_length_locator}    ${rpt_table_rows}	${rpt_table_info_locator}	
    #Check Show Entries Value         ${show_100_entries}

Forward Navigation of Table Pages
	[Tags]                                       In_Progress    Reporting    Pagination
	[Documentation]                              CADR-2805:Forward Navigation of Table Pages
	Wait Until Element is Enabled                ${rpt_table_length_locator}
    Select From List By Value                    ${rpt_table_length_locator}           ${show_10_entries}
    Sleep                                        3s
    ${number_items}=                             Get Number of Items		           ${rpt_table_info_locator}                    
    #                                            Get Number of Items
    ${last_page}=                                Get Last Page		                   ${number_items}		                        ${rpt_table_length_locator}   
    #                                            Get Last Page                         ${number_items}
	:FOR                                         ${i}                                  IN RANGE                                     1                             ${last_page}+1
	\  ${current_page}=                          Get Element Attribute                 ${rpt_table_current_page_locator}/input@value
	\  Check State of Page Navigation Buttons    ${current_page}		               ${last_page}		                            ${rpt_table_pages_locator}    ${rpt_table_first_page_locator}    
	\  ...                                       ${rpt_table_previous_page_locator}    ${rpt_table_next_page_locator}		        ${rpt_table_last_page_locator}   
	#  Check State of Page Navigation Buttons    ${current_page}                       ${last_page}
	\  Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}               ${rpt_table_rows}    ${rpt_table_info_locator}
	#\  Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}
	\  Click Element                             ${rpt_table_next_page_locator}
	\  Sleep                                     2s

Backward Navigation of Table Pages
	[Tags]                                       In_Progress    Reporting    Pagination
	[Documentation]                              CADR-2806:Backward Navigation of Table Pages
	Wait Until Element is Enabled                ${rpt_table_length_locator}
    Select From List By Value                    ${rpt_table_length_locator}           ${show_10_entries}
    Sleep                                        3s
    ${number_items}=                             Get Number of Items		           ${rpt_table_info_locator}	
    #                                            Get Number of Items
    ${last_page}=                                Get Last Page		                   ${number_items}		                        ${rpt_table_length_locator}   
    #                                            Get Last Page                         ${number_items}
	:FOR                                         ${j}                                  IN RANGE                                     ${last_page}                  0    -1
	\  ${current_page}=                          Get Element Attribute                 ${rpt_table_current_page_locator}/input@value
	\  Check State of Page Navigation Buttons    ${current_page}		               ${last_page}		                            ${rpt_table_pages_locator}    ${rpt_table_first_page_locator}    
	\  ...                                       ${rpt_table_previous_page_locator}    ${rpt_table_next_page_locator}		        ${rpt_table_last_page_locator}   
	#  Check State of Page Navigation Buttons    ${current_page}                       ${last_page}
	\  Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}		          ${rpt_table_rows}	   ${rpt_table_info_locator}
	#\  Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}
	\  Click Element                             ${rpt_table_previous_page_locator}
	\  Sleep                                     2s

Navigate to Last Page
	[Tags]                                    In_Progress    Reporting    Pagination
	[Documentation]                           CADR-2807:Navigate to Last Page
	Wait Until Element is Enabled             ${rpt_table_length_locator}
    Select From List By Value                 ${rpt_table_length_locator}           ${show_10_entries}
    Sleep                                     3s
    ${number_items}=                          Get Number of Items		            ${rpt_table_info_locator}	
    #                                         Get Number of Items
    ${last_page}=                             Get Last Page		                    ${number_items}		                         ${rpt_table_length_locator}   
    #                                         Get Last Page                         ${number_items}
    Click Element                             ${rpt_table_last_page_locator}
    Sleep                                     2s
    ${current_page}=                          Get Element Attribute                 ${rpt_table_current_page_locator}/input@value
	Check State of Page Navigation Buttons    ${current_page}		                ${last_page}		                         ${rpt_table_pages_locator}    ${rpt_table_first_page_locator}    
	...                                       ${rpt_table_previous_page_locator}    ${rpt_table_next_page_locator}		         ${rpt_table_last_page_locator}   
	#Check State of Page Navigation Buttons    ${current_page}                      ${last_page}
	Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}               ${rpt_table_rows}    ${rpt_table_info_locator}
	#Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}

Navigate to First Page
	[Tags]                                    In_Progress    Reporting    Pagination
	[Documentation]                           CADR-2808:Navigate to First Page
	Wait Until Element is Enabled             ${rpt_table_length_locator}
    Select From List By Value                 ${rpt_table_length_locator}           ${show_10_entries}
    Sleep                                     3s
    ${number_items}=                          Get Number of Items		            ${rpt_table_info_locator}	
    #                                         Get Number of Items
    ${last_page}=                             Get Last Page		                    ${number_items}		                         ${rpt_table_length_locator}   
    #                                         Get Last Page                         ${number_items}
    Click Element                             ${rpt_table_first_page_locator}
    Sleep                                     2s
    ${current_page}=                          Get Element Attribute                 ${rpt_table_current_page_locator}/input@value
	Check State of Page Navigation Buttons    ${current_page}		                ${last_page}		                         ${rpt_table_pages_locator}    ${rpt_table_first_page_locator}    
	...                                       ${rpt_table_previous_page_locator}    ${rpt_table_next_page_locator}		         ${rpt_table_last_page_locator}   
	#Check State of Page Navigation Buttons   ${current_page}                       ${last_page}
	Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}               ${rpt_table_rows}    ${rpt_table_info_locator}
	#Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}

Navigate to Specified Page
	[Tags]                                    In_Progress    Reporting    Pagination
	[Documentation]                           CADR-2809:Navigate to Specified Page
	Wait Until Element is Enabled             ${rpt_table_length_locator}
    Select From List By Value                 ${rpt_table_length_locator}           ${show_10_entries}
    Sleep                                     3s
    ${number_items}=                          Get Number of Items		            ${rpt_table_info_locator}	
    #                                         Get Number of Items
    ${last_page}=                             Get Last Page		                    ${number_items}		                         ${rpt_table_length_locator}   
    #                                         Get Last Page                         ${number_items}
    ${random_page}=                           Evaluate                              random.randint(1, ${last_page})              modules=random
    Input Text                                ${rpt_table_page_input_locator}       ${random_page}
    Sleep                                     2s
    ${current_page}=                          Get Element Attribute                 ${rpt_table_current_page_locator}/input@value  
	Check State of Page Navigation Buttons    ${current_page}		                ${last_page}		                         ${rpt_table_pages_locator}    ${rpt_table_first_page_locator}    
	...                                       ${rpt_table_previous_page_locator}    ${rpt_table_next_page_locator}		         ${rpt_table_last_page_locator}   
	#Check State of Page Navigation Buttons   ${current_page}                       ${last_page}
	Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}               ${rpt_table_rows}    ${rpt_table_info_locator}
	#Check Table Information                   ${current_page}                       ${show_10_entries}                           ${number_items}

Click Report Name Link
	[Tags]                           In_Progress    Reporting    Name_Link
	[Documentation]                  CADR-2810:Click Report Name Link
	Wait Until Element is Enabled    ${rpt_table_locator}
	${table_row_count}=              Get Matching Xpath Count                       ${rpt_table_rows}
    ${row_random}=                   Run Keyword If                                 ${table_row_count} > 1          Evaluate          random.randint(2, ${table_row_count})    modules=random
    ...	ELSE                         Evaluate                                       ${table_row_count}              2                 
	:FOR                             ${row_number}                                  IN RANGE                        2                 ${table_row_count}+2
	\    ${cell_random}=             Run Keyword If                                 ${row_number}==${row_random}    Get Table Cell    ${rpt_table_locator}
	\    ...                         ${row_number}                                  ${col_number_name}
	\    Run Keyword If              ${row_number}==${row_random}                   Exit For Loop
	Click Link                       ${rpt_table_name_row_locator}[${row_random}]//a
	Sleep                            2s
	# NOTE:  Selenium cannot recognize Windows dialog boxes. This script just tests if the link can be clicked or not.
	
	
                  	