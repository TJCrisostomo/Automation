*** Settings ***
Force Tags        Regression    Geo Central Logging
Library           Selenium2Library
Library           SSHLibrary
Library           ../custom/WebdriverUtils.py
Resource          ../resource/page_resource_mmc.robot
Resource          ../resource/resource_mmc.robot

*** Test Cases ***
tc01_central logging
    [Documentation]                             CADR-2112:tc01_central logging
    [Tags]                                      Sanity
    Open Connection                             ${SGW_IP}
    Login                                       ${SSH_USER_NAME}                                            ${SSH_PASSWORD}
    ${geolocation_status}                       Execute Command                                             service geolocation restart
    Log To Console                              ${geolocation_status}
    Comment                                     Should Contain                                              ${geolocation_status}               Starting geolocation
    Close Connection
    ${path}=                                    Catenate                                                    SEPARATOR=\\                        ${TEMPDIR}                      1
    ${profile}=                                 Create Profile
    open browser                                ${MMC_LOG_VIEWER}                                           firefox                             ff_profile_dir=${profile}
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
    Click Element                               ${mmc_log_viewer_adv_search_start_time_textbox_locator}
    sleep                                       5s
    Click Element                               ${mmc_log_viewer_adv_search_current_date_locator}
    sleep                                       5s
    Click Element                               ${mmc_log_viewer_adv_search_time_done_btn_locator}
    sleep                                       5s
    Click Element                               ${mmc_log_viewer_adv_search_end_time_textbox_locator}
    sleep                                       5s
    Click Element                               ${mmc_log_viewer_adv_search_current_date_locator}
    sleep                                       5s
    Drag And Drop By Offset                     ${mmc_log_viewer_adv_search_hour_slider_locator}            0                                   -200
    sleep                                       5s
    Drag And Drop By Offset                     ${mmc_log_viewer_adv_search_minute_slider_locator}          0                                   -200
    sleep                                       5s
    Click Element                               ${mmc_log_viewer_adv_search_time_done_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_log_viewer_adv_search_component_textbox_locator}      Geolocation
    sleep                                       5s
    Input Text                                  ${mmc_log_viewer_adv_search_server_textbox_locator}         ${SGW_IP}
    sleep                                       5s
    Input Text                                  ${mmc_log_viewer_adv_search_message_textbox_locator}        geolocation
    sleep                                       5s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    Sleep                                       10s
    Click Element                               ${mmc_log_viewer_table_header_DateTime_locator}
    Sleep                                       10s
    Page Should Contain Element                 xpath=//table[@id='jQuery_table_log_viewer']/tbody/tr/td[2][text()=' Geolocation.']
    Page Should Contain Element                 xpath=//table[@id='jQuery_table_log_viewer']/tbody/tr/td[4][text()="${SGW_IP}"]
    Page Should Contain Element                 xpath=//table[@id='jQuery_table_log_viewer']/tbody/tr/td[6]/a[contains(text(),'-')]
    Page Should Contain Element                 xpath=//table[@id='jQuery_table_log_viewer']/tbody/tr/td[7]/div/span[contains(text(),'Deployed "geolocation.war"')]
    Page Should Contain Element                 xpath=//table[@id='jQuery_table_log_viewer']/tbody/tr/td[7]/div/span[contains(text(),'Completed initialization of serviceName=Geolocation')]
    Page Should Contain Element                 xpath=//table[@id='jQuery_table_log_viewer']/tbody/tr/td[7]/div/span[contains(text(),'Geolocation Service Startup')]
    Click Element                               ${mmc_logout_adminuser_span}
    Wait Until Element Is Visible               ${mmc_logout_link}                                          30s
    Click Element                               ${mmc_logout_link}
    Wait Until Element Is Visible               ${mmc_login_button_locator}                                 30s
    Close Browser
