*** Settings ***
Documentation    A resource file of Keywords related to testing of Rave Tenant Portal's Reporting tab.

Resource    ../resource/resource_portal.robot

*** Variables ***
${month_list_31}    ['01', '03', '05', '07', '08', '10', '12']
${month_list_30}    ['04', '06', '09', '11']
${month_list_28}    ['02']


*** Keywords ***
Verify Filter By Results
	[Arguments]                       ${filter_by_value}                    ${col_number}                  ${filter_by_value_2}                      ${active_filter}                
	Wait Until Element Is Visible     ${rpt_active_filter_text_locator}
	Wait Until Element Is Visible	  ${rpt_active_filter_by_locator}
	${filter_by_combine}=             Catenate                              ${active_filter}               ${filter_by_value_2}
	Element Should Contain            ${rpt_active_filter_by_locator}       ${filter_by_combine}
	Wait Until Element Is Visible     ${rpt_active_filter_x_locator}
	Wait Until Element Is Visible     ${rpt_active_filter_clear_locator}    
	Element Should Contain            ${rpt_active_filter_clear_locator}    Clear All Filters
	${filtered_row_count}=            Get Matching Xpath Count              ${rpt_table_rows}
	${table_entries_value}=           Get Selected List Value               ${rpt_table_length_locator}
	Run Keyword If                    ${filtered_row_count} == 0            Empty Data Table
	...	ELSE                          Data Table Result                     ${filter_by_value}             ${col_number}    ${filtered_row_count}    ${table_entries_value} 

Verify Filter By Date Range Results
	[Arguments]                       ${filter_by_value}                    ${col_number}                  ${filter_option}    
	Wait Until Element Is Visible     ${rpt_active_filter_text_locator}
	Wait Until Element Is Visible	  ${rpt_active_filter_by_locator}
	Wait Until Element Is Visible     ${rpt_active_filter_x_locator}
	Wait Until Element Is Visible     ${rpt_active_filter_clear_locator}    
	Element Should Contain            ${rpt_active_filter_clear_locator}    Clear All Filters
	${filtered_row_count}=            Get Matching Xpath Count              ${rpt_table_rows}
	${table_entries_value}=           Get Selected List Value               ${rpt_table_length_locator}
	Run Keyword If                    ${filtered_row_count} == 0            Empty Data Table
	...	ELSE                          Date Range Result                     ${filter_by_value}             ${col_number}       ${filtered_row_count}    ${table_entries_value}
	...                                                                     ${filter_option}

Empty Data Table
	Element Should Contain           ${rpt_table_empty_locator}        No data available in table
	Wait Until Element is Visible    ${rpt_table_info_locator}
	Element Should Contain           ${rpt_table_info_locator}         Showing 0 Results
	Element Should Contain           ${rpt_table_pages_locator}        of 0
	
Data Table Result	
	[Arguments]                       ${filter_by_value}                                ${col_number}                  ${filtered_row_count}        ${table_entries_value}
	:FOR                              ${row_number}                                     IN RANGE			           2                            ${filtered_row_count}+2
	\    Table Cell Should Contain    ${rpt_table_locator}                              ${row_number}                  ${col_number}                ${filter_by_value}
	Wait Until Element is Visible     ${rpt_table_info_locator}
	Element Should Contain            ${rpt_table_info_locator}                         Showing
	Element Should Contain            ${rpt_table_info_locator}                         1
	Element Should Contain            ${rpt_table_info_locator}                         to
	Run Keyword If                    ${filtered_row_count} < ${table_entries_value}    Element Should Contain         ${rpt_table_info_locator}    ${filtered_row_count}
	...	ELSE                          Element Should Contain                            ${rpt_table_info_locator}      ${table_entries_value}
	Element Should Contain            ${rpt_table_info_locator}                         of
	Element Should Contain            ${rpt_table_info_locator}                         ${filtered_row_count}
	Element Should Contain            ${rpt_table_info_locator}                         Items
	${pages}=                         Compute Number Of Pages                           ${filtered_row_count}          ${table_entries_value}
	${pages_text}=                    Catenate                                          of                             ${pages}
	Wait Until Element is Visible     ${rpt_table_current_page_locator}
	Textfield Value Should Be         ${rpt_table_current_page_locator}/input           1
	Wait Until Element is Visible     ${rpt_table_pages_locator}
	Run Keyword If                    ${filtered_row_count} < ${table_entries_value}    Element Should Contain         ${rpt_table_pages_locator}   ${pages_text}                 
	
Date Range Result	
	[Arguments]                      ${filter_by_value}                                ${col_number}                  ${filtered_row_count}         ${table_entries_value}    
	...                              ${filter_option}
	${date_range_start}=             Get Substring                                     ${filter_by_value}             0                             10
	${date_range_end}=               Get Substring                                     ${filter_by_value}             -10
	${datetime_current}=             Get Current Date                                  result_format=datetime
	${date_end}=                     Run Keyword If                                    
	...                              '${filter_option}'=='yesterday'                   Subtract Time From Date        ${datetime_current}           1 day        result_format=%m/%d/%Y
	...  ELSE IF                     '${filter_option}'=='month'                       Get Dates In Month             ${datetime_current}           last         thismonth
	...  ELSE IF                     '${filter_option}'=='lastmonth'                   Get Dates In Month             ${datetime_current}           last         lastmonth
	...  ELSE IF                     '${filter_option}'=='custom'                      Replace Variables              ${date_range_end}
	...  ELSE                        Get Current Date                                  result_format=%m/%d/%Y
	${date_start}=                   Run Keyword If    
	...                              '${filter_option}'=='yesterday'                   Subtract Time From Date        ${datetime_current}           1 day        result_format=%m/%d/%Y     
	...  ELSE IF                     '${filter_option}'=='last7'                       Subtract Time From Date        ${datetime_current}           6 days       result_format=%m/%d/%Y
	...  ELSE IF                     '${filter_option}'=='last30'                      Subtract Time From Date        ${datetime_current}           29 days      result_format=%m/%d/%Y   
	...  ELSE IF                     '${filter_option}'=='month'                       Get Dates In Month             ${datetime_current}           first        thismonth
	...  ELSE IF                     '${filter_option}'=='lastmonth'                   Get Dates In Month             ${datetime_current}           first        lastmonth
	...  ELSE IF                     '${filter_option}'=='custom'                      Replace Variables              ${date_range_start}
	...  ELSE                        Get Current Date                                  result_format=%m/%d/%Y
	Should Be Equal As Strings       ${date_range_start}                               ${date_start}
	Should Be Equal As Strings       ${date_range_end}                                 ${date_end}
	:FOR                             ${row_number}                                     IN RANGE			              2                             ${filtered_row_count}+2
	\  ${row_date}=                  Get Table Cell                                    ${rpt_table_locator}           ${row_number}                 ${col_number}    
	\  ${row_date}=                  Convert To String                                 ${row_date}         
	\  ${row_date_status}=           Evaluate                                          "${date_range_start}" <= "${row_date}" <= "${date_range_end}"    
	Wait Until Element is Visible    ${rpt_table_info_locator}
	Element Should Contain           ${rpt_table_info_locator}                         Showing
	Element Should Contain           ${rpt_table_info_locator}                         1
	Element Should Contain           ${rpt_table_info_locator}                         to
	Run Keyword If                   ${filtered_row_count} < ${table_entries_value}    Element Should Contain         ${rpt_table_info_locator}     ${filtered_row_count}
	...	ELSE                         Element Should Contain                            ${rpt_table_info_locator}      ${table_entries_value}
	Element Should Contain           ${rpt_table_info_locator}                         of
	Element Should Contain           ${rpt_table_info_locator}                         ${filtered_row_count}
	Element Should Contain           ${rpt_table_info_locator}                         Items
	${pages}=                        Compute Number Of Pages                           ${filtered_row_count}          ${table_entries_value}
	${pages_text}=                   Catenate                                          of                             ${pages}
	Wait Until Element is Visible    ${rpt_table_current_page_locator}
	${current_page}=                 Get Element Attribute                             ${rpt_table_current_page_locator}/input@value
	Should Be Equal As Strings       ${current_page}                                   1
	Wait Until Element is Visible    ${rpt_table_pages_locator}
	Run Keyword If                   ${filtered_row_count} < ${table_entries_value}    Element Should Contain         ${rpt_table_pages_locator}    ${pages_text}                 

Compute Number Of Pages
	[Arguments]        ${number_entries}    ${show_entries}
	${page_number}=    Run Keyword If       ${number_entries} > ${show_entries}    Evaluate    ${number_entries}/${show_entries}
	...	ELSE           Evaluate             1
	[Return]           ${page_number}

Get Dates In Month
	[Arguments]      ${datetime_current}              ${which_day}                     ${which_month}
	${year}=         Get Time                         return year
	${month}=        Get Time                         return month
	${month}=        Run Keyword If                   '${which_month}'=='lastmonth'    Evaluate             ${month} - 1
	...  ELSE IF                                      '${which_month}'=='thismonth'    Evaluate             '${month}'
	${month}=        Run Keyword If                   len('${month}')==1               Catenate             0${month}
	...  ELSE                                         Evaluate                         '${month}'         
	${last_31}=      Run Keyword And Return Status    List Should Contain Value        ${month_list_31}     ${month}
	${last_30}=      Run Keyword And Return Status    List Should Contain Value        ${month_list_30}     ${month}
	${last_28}=      Run Keyword And Return Status    List Should Contain Value        ${month_list_28}     ${month}
	${day_last}=     Run Keyword If                   ${last_31}                       Replace Variables    31 
	...  ELSE IF                                      ${last_30}                       Replace Variables    30
	...  ELSE IF                                      ${last_28}                       Replace Variables    28
	${day}=          Run Keyword If                   '${which_day}'=='first'          Replace Variables    01
	...  ELSE IF                                      '${which_day}'=='last'           Replace Variables    ${day_last}
	${date}=         Catenate                         ${month}/${day}/${year} 
	[Return]         ${date}            
	
# Transfered to Keywords_portal.robot
#Get Random Date Within Range
#	[Arguments]        ${range_start}    ${range_end}                                    ${date_point}              ${add_subtract}
#	${random_days}=    Evaluate          random.randint(${range_start}, ${range_end})    modules=random
#	${random_days}=    Catenate          ${random_days} days
#	${random_date}=    Run Keyword If    '${add_subtract}'=='subtract'                   Subtract Time From Date    ${date_point}    ${random_days}    result_format=datetime
#	...  ELSE IF                         '${add_subtract}'=='add'                        Add Time To Date           ${date_point}    ${random_days}    result_format=datetime
#	[Return]           ${random_date}
	
#Get Table Column List
#	[Arguments]            ${col_number}
#	${column_list}=        Create List    
#	${table_row_count}=    Get Matching Xpath Count    ${rpt_table_rows}
#	:FOR                   ${row_number}               IN RANGE                2                  ${table_row_count}+2
#	\  ${cell_value}=      Get Table Cell              ${rpt_table_locator}    ${row_number}      ${col_number}
#	\  Append To List      ${column_list}              ${cell_value}
#	[Return]               ${column_list}

#Check Show Entries Value	
#	[Arguments]                      ${show_entries}
#	${show_entries_value}=           Get Selected List Value                      ${rpt_table_length_locator}
#	Should Be Equal As Strings       ${show_entries}                              ${show_entries_value}
#	Wait Until Element is Visible    ${rpt_table_locator}
#	${table_row_count}=              Get Matching Xpath Count                     ${rpt_table_rows}
#	Run Keyword If                   ${show_entries_value}==${table_row_count}    Element Should Contain       ${rpt_table_info_locator}    ${show_entries_value}
#	...  ELSE                        Element Should Contain                       ${rpt_table_info_locator}    ${table_row_count}   

# Transfered to Keywords_portal.robot	
#Get Number of Items
#    ${number_items}=    Get Text             ${rpt_table_info_locator}
#	${number_items}=    Fetch From Right     ${number_items}          of 
#	${number_items}=    Fetch From Left      ${number_items}          Items
#	${number_items}=    Strip String         ${number_items}
#	[Return]            ${number_items}

#Get Last Page
#	[Arguments]             ${number_items}
#	${show_entries_value}=    Get Selected List Value    ${rpt_table_length_locator}
#	${remainder}=             Evaluate                   ${number_items}%${show_entries_value}
#	${last_page}=             Run Keyword If             ${remainder}==0                          Evaluate    ${number_items}/${show_entries_value}
#	...  ELSE                 Evaluate                   (${number_items}/${show_entries_value})+1
#	${last_page}=             Convert To String          ${last_page}
#	[Return]                  ${last_page}

#Check State of Page Navigation Buttons
#	[Arguments]                ${current_page}                  ${last_page}
#	Element Should Contain     ${rpt_table_pages_locator}       ${last_page}
#	${first_page_state}=       Get Element Attribute            ${rpt_table_first_page_locator}/..@class
#	${previous_page_state}=    Get Element Attribute            ${rpt_table_previous_page_locator}/..@class
#	${next_page_state}=        Get Element Attribute            ${rpt_table_next_page_locator}/..@class
#	${last_page_state}=        Get Element Attribute            ${rpt_table_last_page_locator}/..@class
#	Run Keyword If             ${current_page}==1               Run Keywords
#	...                        Should Be Equal As Strings       ${first_page_state}                        first disabled
#	...  AND                   Should Be Equal As Strings       ${previous_page_state}                     prev disabled
#	...  ELSE                  Run Keywords
#	...                        Should Be Equal As Strings       ${first_page_state}                        first
#	...  AND                   Should Be Equal As Strings       ${previous_page_state}                     prev
#	Run Keyword If             ${last_page}==${current_page}    Run Keywords
#	...                        Should Be Equal As Strings       ${next_page_state}                         next disabled
#	...  AND                   Should Be Equal As Strings       ${last_page_state}                         last disabled
#	...  ELSE                  Run Keywords
#	...                        Should Be Equal As Strings       ${next_page_state}                         next
#	...  AND                   Should Be Equal As Strings       ${last_page_state}                         last

#Check Table Information
#	[Arguments]             ${current_page}             ${show_entries}    ${number_items}
#	${table_row_count}=     Get Matching Xpath Count    ${rpt_table_rows}
#	
#	${table_info_start}=    Run Keyword If    ${current_page}==1                   Replace Variables    1
#	...  ELSE               Evaluate          ${show_entries}*(${current_page}-1)+1
#	
#	${table_info_end}=      Run Keyword If              
#	...                     ${current_page}==1 and (${show_entries} < ${number_items})       Replace Variables    ${show_entries}
#	...  ELSE IF            ${current_page}==1 and (${show_entries} >= ${number_items})      Replace Variables    ${number_items}
#	...  ELSE IF            ${current_page}!=1 and (${table_row_count}==${show_entries})     Evaluate             ${show_entries}*${current_page}
#	...  ELSE IF            ${current_page}!=1 and (${table_row_count} < ${show_entries})    Evaluate             (${show_entries}*${current_page})-(${show_entries}-${table_row_count})
#	
#	${table_info}=                Catenate         Showing ${table_info_start} to ${table_info_end} of ${number_items} Items
#	${shown_info}=                Get Text         ${rpt_table_info_locator}
#	Should Be Equal As Strings    ${table_info}    ${shown_info}
	
	
	
	





	
	








	