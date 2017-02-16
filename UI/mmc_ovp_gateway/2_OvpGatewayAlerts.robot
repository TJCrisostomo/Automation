*** Settings ***
Documentation     The test cases of this suite are tightly coupled. Please run test cases together. If you run independently they may fail.
Force Tags        Regression    Ovp Alerts
Library           Selenium2Library
Library           RequestsLibrary
Library           SSHLibrary
Library           ../custom/WebdriverUtils.py
Resource          ../resource/page_resource_mmc.robot
Resource          ../resource/resource_mmc.robot
Resource          ../../api/resource/resource.robot

*** Test Cases ***
tc01_alert_definitions
    [Documentation]                             CADR-2622:tc01_alert_definitions
    [Tags]                                      Sanity
    ${path}=                                    Catenate                                                    SEPARATOR=\\                ${TEMPDIR}                      1
    ${profile}=                                 Create Profile
    open browser                                ${MMC_ALERT_DEFINITIONS}                                    firefox                     ff_profile_dir=${profile}
    Maximize Browser Window
    Wait Until Element Is Enabled               ${mmc_login_username_locator}                               10s
    Input Text                                  ${mmc_login_username_locator}                               ${MMC_DEFAULT_USERNAME}
    Input Text                                  ${mmc_login_password_locator}                               ${MMC_DEFAULT_PASSWORD}
    Select Checkbox                             ${mmc_login_remember_me_locator}
    Click Element                               ${mmc_login_button_locator}
    Wait Until Page Contains Element            ${mmc_home_adrenalin_logo}                                  2m
    Page Should Contain Element                 ${mmc_home_adrenalin_logo}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           jwe
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_jwe_subcomponent_locator}
    Page Should Contain Element                 ${mmc_alert_def_jwe_name_locator}
    Page Should Contain Element                 ${mmc_alert_def_jwe_description_locator}
    Click Element                               ${mmc_alert_def_jwe_edit_link_locator}
    sleep                                       3s
    Select From List By Label                   ${mmc_alert_def_jwe_status_dropdown_locator}                Enabled
    sleep                                       2s
    Click Element                               ${mmc_alert_def_save_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           secure gateway url
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_subcomponent_locator}
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_name_locator}
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_description_locator}
    Click Element                               ${mmc_alert_def_sgw_url_edit_link_locator}
    sleep                                       3s
    Select From List By Label                   ${mmc_alert_def_sgw_url_status_dropdown_locator}            Enabled
    sleep                                       2s
    Click Element                               ${mmc_alert_def_save_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           jwe
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_jwe_enabled_locator}
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           secure gateway url
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_enabled_locator}

tc02_service_health_check_error_alert
    [Documentation]                             CADR-2623:tc02_service_health_check_error_alert
    [Tags]                                      Sanity
    Open Connection                             ${GATEWAY_IP}
    Login                                       ${SSH_USER_NAME}                                            ${SSH_PASSWORD}
    ${ovp_service_status}                       Execute Command                                             sudo service seachange-rave-ovp_gateway status
    Log To Console                              ${ovp_service_status}
    sleep                                       5s
    ${ovp_service_stop_status}                  Execute Command                                             sudo service seachange-rave-ovp_gateway stop
    Log To Console                              ${ovp_service_stop_status}
    sleep                                       5s
    ${ovp_service_status}                       Execute Command                                             sudo service seachange-rave-ovp_gateway status
    Log To Console                              ${ovp_service_status}
    Should Contain                              ${ovp_service_status}                                       seachange-rave-ovp_gateway is stopped
    sleep                                       2m
    ${ovp_service_status}                       Execute Command                                             sudo service seachange-rave-ovp_gateway status
    Log To Console                              ${ovp_service_status}
    Should Contain                              ${ovp_service_status}                                       is running
    Close Connection
    sleep                                       120s
    Go To                                       ${MMC_RECENT_ALERTS}
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Rank']]]]]]/tbody/tr/td[2]/font[text()='2']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Severity']]]]]]/tbody/tr/td[3]/font[text()='High']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='State']]]]]]/tbody/tr/td[4]/font[text()='New']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Name']]]]]]/tbody/tr/td[6]/font[text()='ServiceHA - Service Up']
    Page Should Contain Element                 xpath=//table[thead[tr[th[text()='Condition Details']]]]/tbody/tr/td[7]/font[text()='Service ovp-gateway is now Running']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Name']]]]]]/tbody/tr/td[6]/font[text()='ServiceHA - Service Restart']
    Page Should Contain Element                 xpath=//table[thead[tr[th[text()='Condition Details']]]]/tbody/tr/td[7]/font[text()='Service ovp-gateway is now ServiceRestarting']

tc03_sgw_error_alert
    [Documentation]                             CADR-2624:tc03_sgw_error_alert
    [Tags]                                      Sanity
    Go To                                       ${MMC_RECENT_ALERTS}
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Rank']]]]]]/tbody/tr/td[2]/font[text()='0']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Severity']]]]]]/tbody/tr/td[3]/font[text()='High']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='State']]]]]]/tbody/tr/td[4]/font[text()='New']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Name']]]]]]/tbody/tr/td[6]/font[text()='Secure Gateway URL Not Accessible']
    Page Should Contain Element                 xpath=//table[thead[tr[th[text()='Condition Details']]]]/tbody/tr/td[7]/font[text()='SGW Alert Event: Secure Gateway URL Not Accessible for tenantId:: invalidTenant']
    Go To                                       ${MMC_ALERT_DEFINITIONS}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           jwe
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_jwe_subcomponent_locator}
    Page Should Contain Element                 ${mmc_alert_def_jwe_name_locator}
    Page Should Contain Element                 ${mmc_alert_def_jwe_description_locator}
    Click Element                               ${mmc_alert_def_jwe_edit_link_locator}
    sleep                                       3s
    Select From List By Label                   ${mmc_alert_def_jwe_status_dropdown_locator}                Disabled
    sleep                                       2s
    Click Element                               ${mmc_alert_def_save_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           secure gateway url
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_subcomponent_locator}
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_name_locator}
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_description_locator}
    Click Element                               ${mmc_alert_def_sgw_url_edit_link_locator}
    sleep                                       3s
    Select From List By Label                   ${mmc_alert_def_sgw_url_status_dropdown_locator}            Disabled
    sleep                                       2s
    Click Element                               ${mmc_alert_def_save_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           jwe
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_jwe_disabled_locator}
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           secure gateway url
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_sgw_url_disabled_locator}
    Click Element                               ${mmc_logout_adminuser_span}
    Wait Until Element Is Visible               ${mmc_logout_link}                                          30s
    Click Element                               ${mmc_logout_link}
    Wait Until Element Is Visible               ${mmc_login_button_locator}                                 30s
    Close Browser
