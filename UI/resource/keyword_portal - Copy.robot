*** Settings ***
Documentation    A resource file of Keywords related to testing of Rave Portal.

Resource    ../resource/resource_portal.robot

*** Keywords ***
Random Filter Entry Value
	[Arguments]                          ${table_rows_xpath}           ${col_number}    ${table_length_loc}    ${table_loc}
    Select From List By Value            ${table_length_loc}           ${show_25_entries}
    Wait Until Element Is Not Visible    ${loading_spinner_locator}
    ${row_count}=                        Get Matching Xpath Count      ${table_rows_xpath}
    ${row_random}=                       Evaluate                      random.randint(2, ${row_count}+1)        modules=random
    ${cell_random}=                      Get Table Cell                ${table_loc}                             ${row_random}     ${col_number}
	${cell_length}=                      Get Length                    ${cell_random}
	${char_start}=                       Evaluate                      random.randint(0, (${cell_length}-5))    modules=random
	${char_end}=                         Evaluate                      ${char_start} + 4
	${filter_by}=                        Get Substring                 ${cell_random}                           ${char_start}     ${char_end}
	${filter_by}=                        Strip String                  ${filter_by}
	[Return]                             ${filter_by}

Enter Filter By Value
	[Arguments]                          ${filter_by_loc}              ${filter_by_value}    ${table_length_loc}
    Select From List By Value            ${table_length_loc}           ${show_10_entries}
    Wait Until Element Is Not Visible    ${loading_spinner_locator}
	Wait Until Element Is Enabled        ${filter_by_loc}
	Input Text						     ${filter_by_loc}              ${filter_by_value}
	Press Key                            ${filter_by_loc}              \\13                  #ENTER key

	
Check State of Page Navigation Button
	[Arguments]       ${current_page}       ${last_page}	${table_pages_locator}		${table_first_page_locator}		${table_previous_page_locator}		${table_next_page_locator}		${table_last_page_locator}	
	Element Should Contain     ${table_pages_locator}       ${last_page}
	${first_page_state}=       Get Element Attribute            ${table_first_page_locator}/..@class
	${previous_page_state}=    Get Element Attribute            ${table_previous_page_locator}/..@class
	${next_page_state}=        Get Element Attribute            ${table_next_page_locator}/..@class
	${last_page_state}=        Get Element Attribute            ${table_last_page_locator}/..@class
	Run Keyword If             ${current_page}==1               Run Keywords
	...                        Should Be Equal As Strings       ${first_page_state}                        first disabled
	...  AND                   Should Be Equal As Strings       ${previous_page_state}                     prev disabled
	...  ELSE                  Run Keywords
	...                        Should Be Equal As Strings       ${first_page_state}                        first
	...  AND                   Should Be Equal As Strings       ${previous_page_state}                     prev
	Run Keyword If             ${last_page}==${current_page}    Run Keywords
	...                        Should Be Equal As Strings       ${next_page_state}                         next disabled
	...  AND                   Should Be Equal As Strings       ${last_page_state}                         last disabled
	...  ELSE                  Run Keywords
	...                        Should Be Equal As Strings       ${next_page_state}                         next
	...  AND                   Should Be Equal As Strings       ${last_page_state}                         last	

Get Number of Items	
	[Arguments] 		${table_info_locator}
    ${number_items}=    Get Text             ${table_info_locator}
	${number_items}=    Fetch From Right     ${number_items}          of 
	${number_items}=    Fetch From Left      ${number_items}          Items
	${number_items}=    Strip String         ${number_items}
	[Return]            ${number_items}	

Get Last Page
	[Arguments]             ${number_items}			${table_length_locator}  
	${show_entries_value}=    Get Selected List Value    ${table_length_locator}
	${remainder}=             Evaluate                   ${number_items}%${show_entries_value}
	${last_page}=             Run Keyword If             ${remainder}==0                          Evaluate    ${number_items}/${show_entries_value}
	...  ELSE                 Evaluate                   (${number_items}/${show_entries_value})+1
	${last_page}=             Convert To String          ${last_page}
	[Return]                  ${last_page}


#Check Filtered Result
#	[Arguments]			${TableCount}			${FilterValue}		${TableName}	${TableData}					 
#	:FOR 	${Count}	IN RANGE            1               ${TableCount}+1
#	\	${CellText}					Get Text						${TableName}//tbody/tr[${Count}]/${TableData}		#xpath=//table[@id="datatable"]/tbody/tr[${Count}]/td[2]/a
#	\	Should Contain					${CellText}					${FilterValue}
#	\	sleep							1s

Check Filtered Result
	[Arguments]			${TableCount}	${FilterValue}				${TableName}	${TableColumn}					 
	:FOR 		${Row}	IN RANGE            2               ${TableCount}+2
	\	${CellText}						Get Table Cell			${TableName}			${Row}			${TableColumn}
	\	${CellText}						Convert To String                                 ${CellText}	 						
	\	Should Contain					${CellText}					${FilterValue}
	\	sleep							1s

	
Check Filtered Result Date Range
	[Arguments]			${TableCount}			${FilterRangeStart}		${FilterRangeEnd}		${TableName}	${TableColumn}					 
	:FOR 		${Row}	IN RANGE            2               ${TableCount}+2
	\	${CellText}						Get Table Cell			${TableName}			${Row}			${TableColumn}
	\	${CellText}						Convert To String                                 ${CellText}	 						
	\	Should Be True               "${FilterRangeStart}" <= "${CellText}" <= "${FilterRangeEnd}"
	\	sleep							1s	
	
Get Random Date Within Range
	[Arguments]        ${range_start}    ${range_end}                                    ${date_point}              ${add_subtract}
	${random_days}=    Evaluate          random.randint(${range_start}, ${range_end})    modules=random
	${random_days}=    Catenate          ${random_days} days
	${random_date}=    Run Keyword If    '${add_subtract}'=='subtract'                   Subtract Time From Date    ${date_point}    ${random_days}    result_format=datetime
	...  ELSE IF                         '${add_subtract}'=='add'                        Add Time To Date           ${date_point}    ${random_days}    result_format=datetime
	[Return]           ${random_date}	

	
	
Check Sorting	
	[Arguments]           ${list}                    ${list_count}      ${order}
	:FOR                  ${i}                       IN RANGE           0              ${list_count}-1
	\  ${x}=              Evaluate                   ${list}[${i}]
	\  ${y}=              Evaluate                   ${list}[${i}+1]
	\  Run Keyword If    '${order}'=='ascending'     Evaluate           '${x}' < '${y}'
	\  ...  ELSE IF      '${order}'=='descending'    Evaluate           '${x}' > '${y}'


Get Table Column List
	[Arguments]            ${ColNumber}				${TableRows}			${TableName} 
	${column_list}=        Create List    
	${table_row_count}=    Get Matching Xpath Count    ${TableRows}
	:FOR                   ${row_number}               IN RANGE                2                 ${table_row_count}+2
	\  ${cell_value}=      Get Table Cell              ${TableName}    	${row_number}          ${ColNumber}
	\  Append To List      ${column_list}             	${cell_value}
	[Return]               ${column_list}		

Check Show Entries Value	
	[Arguments]                      ${show_entries}		${Table_length_locator}		${Table_rows}	${Table_info_locator} 	
	${show_entries_value}=           Get Selected List Value                      ${Table_length_locator}
	Should Be Equal As Strings       ${show_entries}                              ${show_entries_value}
	#Wait Until Element is Visible    ${rpt_table_locator}
	${table_row_count}=              Get Matching Xpath Count                     ${Table_rows}
	Run Keyword If                   ${show_entries_value}==${table_row_count}    Element Should Contain       ${Table_info_locator}    ${show_entries_value}
	...  ELSE                        Element Should Contain                       ${Table_info_locator}    ${table_row_count}   

Check Table Information
	[Arguments]             ${current_page}             ${show_entries}    ${number_items}		${Table_rows}		 ${Table_info_locator}
	${table_row_count}=     Get Matching Xpath Count    ${Table_rows}
	${table_info_start}=    Run Keyword If    ${current_page}==1                   Replace Variables    1
	...  ELSE               Evaluate          ${show_entries}*(${current_page}-1)+1
	${table_info_end}=      Run Keyword If              
	...                     ${current_page}==1 and (${show_entries} < ${number_items})       Replace Variables    ${show_entries}
	...  ELSE IF            ${current_page}==1 and (${show_entries} >= ${number_items})      Replace Variables    ${number_items}
	...  ELSE IF            ${current_page}!=1 and (${table_row_count}==${show_entries})     Evaluate             ${show_entries}*${current_page}
	...  ELSE IF            ${current_page}!=1 and (${table_row_count} < ${show_entries})    Evaluate             (${show_entries}*${current_page})-(${show_entries}-${table_row_count})
	${table_info}=                Catenate         Showing ${table_info_start} to ${table_info_end} of ${number_items} Items
	${shown_info}=                Get Text         ${Table_info_locator}
	Should Be Equal As Strings    ${table_info}    ${shown_info}
	