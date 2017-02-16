*** Settings ***
Documentation    A resource file with reusable keywords and variables related to Rave Portal.

Resource    page_resource_portal.robot
Resource    keyword_portal.robot
Library     String
Library     DateTime
Library     Collections
Library     Selenium2Library                timeout=40


*** Variables ***
#******************************** IPs and URLs *********************************
${PORTAL_URL}    http://10.204.1.47:8000
${BROWSER}		 Firefox

#******************************* Default Inputs ********************************
${DEFAULT_USERNAME}    bridgel.santiago@schange.com
${DEFAULT_PASSWORD}    Admin@123

#****************************** Common Variables *******************************
${TITLE}    Login - Rave Portal
${BRAND}    RAVE PORTAL

#**************************** Show Entries Values ******************************
${SHOW_10_ENTRIES}     10
${SHOW_25_ENTRIES}     25
${SHOW_50_ENTRIES}     50
${SHOW_100_ENTRIES}    100
@{PAGE_SIZE_LIST}      ${SHOW_10_ENTRIES}    ${SHOW_25_ENTRIES}    ${SHOW_50_ENTRIES}    ${SHOW_100_ENTRIES}


*** Keywords ***
Open Rave Portal
    Open Browser                     ${PORTAL_URL}            ${BROWSER}
    Maximize Browser Window
    #Wait Until Element Is Visible    ${login_logo_locator}
    #Title Should Be                  ${TITLE}
    #${brand_text}=                   Get Text                 ${login_brand_locator}
    #Should Be Equal As Strings       ${brand_text}            ${BRAND}
	
Login Rave Portal
	[Arguments]					     ${username}=${DEFAULT_USERNAME}    ${password}=${DEFAULT_PASSWORD}    ${expected}=pass
    Wait Until Element Is Enabled    ${login_input_username_locator}  
    Input Text						 ${login_input_username_locator}    ${username}
    Wait Until Element Is Enabled	 ${login_input_password_locator}
    Input Text						 ${login_input_password_locator}    ${password}
    Wait Until Element Is Enabled	 ${login_button_locator}
    Click Element					 ${login_button_locator}
    Run Keyword If                   '${expected}' == 'pass'            Wait Until Element Is Enabled	 ${nav_bar_home_locator}
    ...  ELSE                        Wait Until Element Is Visible      ${login_error_toast_locator}
    [Return]				         ${username}
	
Logout Rave Portal
    Wait Until Element Is Enabled    ${logout_locator}
    Click Element                    ${logout_locator}
    Wait Until Element Is Visible    ${logout_prompt_locator}
    Click Element                    ${logout_prompt_logout_locator}
    

    