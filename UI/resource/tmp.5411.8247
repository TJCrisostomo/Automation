*** Settings ***
Documentation    A resource file of Keywords related to testing of Rave Portal.

Resource    ../resource/resource_portal.robot

*** Keywords ***
Scroll To Top
    Execute Javascript                   window.scrollTo(0,0)
    
Random Filter Entry Value
	[Arguments]                          ${table_rows_xpath}           ${col_number}    ${table_length_loc}    ${table_loc}
    Select From List By Value            ${table_length_loc}           ${SHOW_50_ENTRIES}
    Wait Until Element Is Not Visible    ${loading_spinner_locator}
    Sleep                                2 seconds
    ${row_count}=                        Get Matching Xpath Count      ${table_rows_xpath}
    :FOR    ${i}    IN RANGE    99
    \  ${row_random}=                    Evaluate                      random.randint(2, ${row_count}+1)        modules=random
    \  ${cell_random}=                   Get Table Cell                ${table_loc}                             ${row_random}     ${col_number}
    \  ${cell_length}=                   Get Length                    ${cell_random}
    \  Exit For Loop If                  ${cell_length} > 5
    ${char_start}=                       Evaluate                      random.randint(0, (${cell_length}-5))    modules=random
    ${char_end}=                         Evaluate                      ${char_start} + 4
    ${filter_by}=                        Get Substring                 ${cell_random}                           ${char_start}     ${char_end}
    ${filter_by}=                        Strip String                  ${filter_by}
    [Return]                             ${filter_by}

Enter Filter By Value
    [Arguments]                          ${filter_by_loc}              ${filter_by_value}    ${table_length_loc}
    Select From List By Value            ${table_length_loc}           ${SHOW_10_ENTRIES}
    Wait Until Element Is Not Visible    ${loading_spinner_locator}
    Wait Until Element Is Enabled        ${filter_by_loc}
    Input Text						     ${filter_by_loc}              ${filter_by_value}
    Press Key                            ${filter_by_loc}              \\13                  #ENTER key

Check State of Page Navigation Buttons
    [Arguments]                ${current_page}    ${last_page}    ${table_pages_locator}    ${table_first_page_locator}    ${table_previous_page_locator}    ${table_next_page_locator}    ${table_last_page_locator}	
    Element Should Contain     ${table_pages_locator}           ${last_page}
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
    [Arguments] 		       ${table_info_loc}
    ${number_items}=           Get Text             ${table_info_loc}
    Return From Keyword If     '${number_items}'=='Showing 0 Results'        0
    ${number_items}=           Fetch From Right     ${number_items}          of
    ${number_items}=           Fetch From Left      ${number_items}          Items
    ${number_items}=           Strip String         ${number_items}
    [Return]                   ${number_items}	

Get Last Page
    [Arguments]                ${number_items}			  ${table_length_loc}  
    ${show_entries_value}=     Get Selected List Value    ${table_length_loc}
    ${remainder}=              Evaluate                   ${number_items}%${show_entries_value}
    ${last_page}=              Run Keyword If             ${remainder}==0                          Evaluate    ${number_items}/${show_entries_value}
    ...  ELSE                  Evaluate                   (${number_items}/${show_entries_value})+1
    ${last_page}=              Convert To String          ${last_page}
    [Return]                   ${last_page}

Check Filtered Result
    [Arguments]			       ${table_row_count}      ${filter_value}    ${table_loc}     ${col_number}
    :FOR    ${row_number}      IN RANGE    2    ${table_row_count}+2
	\  Table Cell Should Contain           ${table_loc}    ${row_number}    ${col_number}    ${filter_value}
#    :FOR                 ${row}               IN RANGE          2               ${table_row_count}+2
#    \  ${cell_text}       Get Table Cell       ${table_loc}      ${row}          ${col_number}
#    \  ${cell_text}       Convert To String    ${cell_text}	 						
#    \  Should Contain    ${cell_text}          ${filter_value}
#    \  Sleep             1s

Check Filtered Result Date Range
    [Arguments]                ${table_row_count}   ${range_start}         ${range_end}             ${table_loc}    ${col_number}					 
    :FOR    ${row_number}      IN RANGE             2                      ${table_row_count}+2
    \  ${cell_text}=           Get Table Cell       ${table_loc}           ${row_number}            ${col_number}
    \  ${cell_text}=           Convert To String    ${cell_text}	 						
    \  Should Be True          "${range_start}" <= "${cell_text}" <= "${range_end}"
	
Get Random Date Within Range
    [Arguments]                ${range_start}       ${range_end}                                    ${date_point}              ${add_subtract}
    ${random_days}=            Evaluate             random.randint(${range_start}, ${range_end})    modules=random
    ${random_days}=            Catenate             ${random_days} days
    ${random_date}=            Run Keyword If       '${add_subtract}'=='subtract'                   Subtract Time From Date    ${date_point}    ${random_days}    result_format=datetime
    ...  ELSE IF                                    '${add_subtract}'=='add'                        Add Time To Date           ${date_point}    ${random_days}    result_format=datetime
    [Return]                   ${random_date}	
	
Check Sorting	
    [Arguments]                ${list}                     ${list_count}       ${order}
    :FOR                       ${i}                        IN RANGE            0              ${list_count}-1
    \  ${x}=                   Evaluate                    ${list}[${i}]
    \  ${y}=                   Evaluate                    ${list}[${i}+1]
    \  ${x}=                   Convert To Lowercase        ${x}
    \  ${y}=                   Convert To Lowercase        ${y}
    \  Run Keyword If          "${order}"=="ascending"     Should Be True      "${x}" <= "${y}"
    \  ...  ELSE IF            "${order}"=="descending"    Should Be True      "${x}" >= "${y}"
    \  ...  ELSE               FAIL                        Invalid order name "${order}". Should be "ascending" or "descending" only

Get Table Column List
    [Arguments]                ${col_number}               ${table_rows_xpath}		${table_loc} 
    ${column_list}=            Create List    
    ${table_row_count}=        Get Matching Xpath Count    ${table_rows_xpath}
    :FOR                       ${row_number}               IN RANGE            2                ${table_row_count}+2
    \  ${cell_value}=          Get Table Cell              ${table_loc}    	   ${row_number}    ${col_number}
    \  Append To List          ${column_list}              ${cell_value}
    [Return]                   ${column_list}		

Check Show Entries Value	
    [Arguments]                   ${show_entries}                              ${table_length_loc}       ${table_rows_xpath}    ${table_info_loc} 	
    ${show_entries_value}=        Get Selected List Value                      ${table_length_loc}
    Should Be Equal As Strings    ${show_entries}                              ${show_entries_value}
    ${table_row_count}=           Get Matching Xpath Count                     ${table_rows_xpath}
    Run Keyword If                ${show_entries_value}==${table_row_count}    Element Should Contain    ${table_info_loc}      ${show_entries_value}
    ...  ELSE                     Element Should Contain                       ${table_info_loc}         ${table_row_count}

Check Table Information
    [Arguments]                   ${current_page}             ${show_entries}    ${number_items}         ${table_rows_xpath}    ${table_info_loc}
    ${table_row_count}=           Get Matching Xpath Count    ${table_rows_xpath}
    ${table_info_start}=          Run Keyword If              ${current_page}==1                         Replace Variables      1
    ...  ELSE                     Evaluate                    ${show_entries}*(${current_page}-1)+1
    ${table_info_end}=            Run Keyword If              
    ...                           ${current_page}==1 and (${show_entries} < ${number_items})             Replace Variables      ${show_entries}
    ...  ELSE IF                  ${current_page}==1 and (${show_entries} >= ${number_items})            Replace Variables      ${number_items}
    ...  ELSE IF                  ${current_page}!=1 and (${table_row_count}==${show_entries})           Evaluate               ${show_entries}*${current_page}
    ...  ELSE IF                  ${current_page}!=1 and (${table_row_count} < ${show_entries})          Evaluate               (${show_entries}*${current_page})-(${show_entries}-${table_row_count})
    ${table_info}=                Catenate                    Showing ${table_info_start} to ${table_info_end} of ${number_items} Items
    ${shown_info}=                Get Text                    ${table_info_loc}
    Should Be Equal As Strings    ${table_info}               ${shown_info}
    
Check Page Infomation
    [Arguments]                     ${exp_current_page}    ${exp_last_page}      ${page_info_loc}    ${current_page_loc}
    ${current_page}=                Get Value              ${current_page_loc}
    ${pagination_text}=             Get Text               ${page_info_loc}
    Should Be Equal As Integers     ${current_page}        ${exp_current_page}
    Should Be Equal As Strings      ${pagination_text}     of ${exp_last_page}
	
