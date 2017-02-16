*** Settings ***
Documentation     The test cases of this suite are tightly coupled. Please run test cases together. If you run independently they may fail. Open bug CLOUD-4659 may cause test case "tc02_service_health_check_failed_Alert" to fail.
Force Tags        Regression    Geo Alerts
Library           Selenium2Library
Library           SSHLibrary
Library           ../custom/WebdriverUtils.py
Resource          ../resource/page_resource_mmc.robot
Resource          ../resource/resource_mmc.robot

*** Test Cases ***
tc01_alert_definition
    [Documentation]                             CADR-2095:tc01_alert_definition
    [Tags]                                      Sanity
    ${path}=                                    Catenate                                                    SEPARATOR=\\                                                ${TEMPDIR}                      1
    ${profile}=                                 Create Profile
    open browser                                ${MMC_ALERT_DEFINITIONS}                                    firefox                                                     ff_profile_dir=${profile}
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
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           Geolocation Service Not Accessible
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_geo_subcomponent_locator}
    Page Should Contain Element                 ${mmc_alert_def_geo_name_locator}
    Page Should Contain Element                 ${mmc_alert_def_geo_description_locator}
    Click Element                               ${mmc_alert_def_geo_edit_link_locator}
    sleep                                       3s
    Select From List By Label                   ${mmc_alert_def_geo_status_dropdown_locator}                Enabled
    sleep                                       2s
    Click Element                               ${mmc_alert_def_save_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           Geolocation Service Not Accessible
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_geo_enabled_locator}

tc02_service_health_check_failed_Alert
    [Documentation]                             CADR-2096:tc02_service_health_check_failed_Alert
    [Tags]                                      Sanity
    Go To                                       ${MMC_SOFTWARE}
    sleep                                       5s
    Click Element                               ${mmc_tree_geoloc_plus_icon_locator}
    sleep                                       5s
    Click Element                               ${mmc_tree_geoloc_service_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Element Is Visible               ${mmc_GeolocationDataPath_locator}                          30s
    Page Should Contain Element                 ${mmc_GeolocationDataPath_locator}
    Clear Element Text                          ${mmc_GeolocationDataPath_locator}
    Input Text                                  ${mmc_GeolocationDataPath_locator}                          /seachange/local/geolocation/GeoLite2-City.mmbdbbb
    sleep                                       5s
    Mouse Down                                  ${mmc_commit_button_locator}
    Mouse Up                                    ${mmc_commit_button_locator}
    sleep                                       5s
    Mouse Down                                  ${mmc_commit_button_locator}
    Mouse Up                                    ${mmc_commit_button_locator}
    sleep                                       5s
    Mouse Down                                  ${dialog_commit_button_locator}
    Mouse Up                                    ${dialog_commit_button_locator}
    sleep                                       5s
    Wait Until Page Contains Element            ${mmc_tree_geoloc_service_locator}                          10s
    Page Should Contain Element                 ${mmc_tree_geoloc_service_locator}
    Open Connection                             ${SGW_IP}
    Login                                       ${SSH_USER_NAME}                                            ${SSH_PASSWORD}
    ${geolocation_service_status}               Execute Command                                             service geolocation restart
    Log To Console                              ${geolocation_service_status}
    Close Connection
    sleep                                       120s
    Go To                                       ${MMC_RECENT_ALERTS}
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Rank']]]]]]/tbody/tr/td[2]/font[text()='1']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Severity']]]]]]/tbody/tr/td[3]/font[text()='High']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='State']]]]]]/tbody/tr/td[4]/font[text()='New']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Name']]]]]]/tbody/tr/td[6]/font[text()='Geolocation Service Health Check failure']
    Page Should Contain Element                 xpath=//table[thead[tr[th[text()='Condition Details']]]]/tbody/tr/td[7]/font[text()='Geolocation Healthcheck Status < 1.0']
    Page Should Contain Element                 xpath=//table[thead[tr[th[a[span[text()='Name']]]]]]/tbody/tr/td[8]/font[contains(text(),'org.tanukisoftware.wrapper.WrapperSimpleApp:10901.Geolocation')]
    Go To                                       ${MMC_SOFTWARE}
    sleep                                       5s
    Click Element                               ${mmc_tree_geoloc_plus_icon_locator}
    sleep                                       5s
    Click Element                               ${mmc_tree_geoloc_service_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Element Is Visible               ${mmc_GeolocationDataPath_locator}                          30s
    Page Should Contain Element                 ${mmc_GeolocationDataPath_locator}
    Clear Element Text                          ${mmc_GeolocationDataPath_locator}
    Input Text                                  ${mmc_GeolocationDataPath_locator}                          /seachange/local/geolocation/GeoLite2-City.mmdb
    sleep                                       5s
    Mouse Down                                  ${mmc_commit_button_locator}
    Mouse Up                                    ${mmc_commit_button_locator}
    sleep                                       5s
    Mouse Down                                  ${mmc_commit_button_locator}
    Mouse Up                                    ${mmc_commit_button_locator}
    sleep                                       5s
    Mouse Down                                  ${dialog_commit_button_locator}
    Mouse Up                                    ${dialog_commit_button_locator}
    sleep                                       5s
    Wait Until Page Contains Element            ${mmc_tree_geoloc_service_locator}                          10s
    Page Should Contain Element                 ${mmc_tree_geoloc_service_locator}
    Go To                                       ${MMC_ALERT_DEFINITIONS}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           Geolocation Service Not Accessible
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_geo_subcomponent_locator}
    Page Should Contain Element                 ${mmc_alert_def_geo_name_locator}
    Page Should Contain Element                 ${mmc_alert_def_geo_description_locator}
    Click Element                               ${mmc_alert_def_geo_edit_link_locator}
    sleep                                       3s
    Select From List By Label                   ${mmc_alert_def_geo_status_dropdown_locator}                Disabled
    sleep                                       2s
    Click Element                               ${mmc_alert_def_save_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_adv_search_btn_locator}
    sleep                                       5s
    Input Text                                  ${mmc_alert_def_adv_alert_search_textbox_locator}           Geolocation Service Not Accessible
    sleep                                       2s
    Click Element                               ${mmc_adv_search_search_btn_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_alert_def_geo_disabled_locator}
    Click Element                               ${mmc_logout_adminuser_span}
    Wait Until Element Is Visible               ${mmc_logout_link}                                          30s
    Click Element                               ${mmc_logout_link}
    Wait Until Element Is Visible               ${mmc_login_button_locator}                                 30s
    Close Browser
