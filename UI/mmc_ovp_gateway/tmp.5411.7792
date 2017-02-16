*** Settings ***
Documentation     The test cases of this suite are tightly coupled. Please run test cases together. If you run independently they may fail.
Force Tags        Regression    Ovp Monitoring
Library           Selenium2Library
Library           RequestsLibrary
Library           SSHLibrary
Library           ../custom/WebdriverUtils.py
Resource          ../resource/page_resource_mmc.robot
Resource          ../resource/resource_mmc.robot
Resource          ../../api/resource/resource.robot

*** Test Cases ***
tc13_restart_ovp_gw_service
    [Documentation]                             CADR-2189:tc13_restart_ovp_gw_service
    [Tags]                                      Sanity
    Open Connection                             ${GATEWAY_IP}
    Login                                       ${SSH_USER_NAME}                                ${SSH_PASSWORD}
    ${ovp_service_status}                       Execute Command                                 sudo service seachange-rave-ovp_gateway status
    Log To Console                              ${ovp_service_status}
    ${ovp_service_stop_status}                  Execute Command                                 sudo service seachange-rave-ovp_gateway stop
    Log To Console                              ${ovp_service_stop_status}
    Comment                                     Should Contain                                  ${ovp_service_stop_status}                                      Stopping seachange-rave-ovp_gateway
    ${ovp_service_start_status}                 Execute Command                                 sudo service seachange-rave-ovp_gateway start
    Log To Console                              ${ovp_service_start_status}
    Comment                                     Should Contain                                  ${ovp_service_start_status}                                     Starting seachange-rave-ovp_gateway
    ${ovp_service_status}                       Execute Command                                 sudo service seachange-rave-ovp_gateway status
    Log To Console                              ${ovp_service_status}
    sleep                                       3m
    Comment                                     Should Contain                                  ${ovp_service_status}                                           is running
    Close Connection

tc01_ovp_gw_mmc_rhq_monitor
    [Documentation]                             CADR-2177:tc01_ ovp_gw_mmc_rhq_monitor
    [Tags]                                      Sanity
    ${path}=                                    Catenate                                        SEPARATOR=\\                        ${TEMPDIR}                  1
    ${profile}=                                 Create Profile
    open browser                                ${MMC_MONITORING}                               firefox                             ff_profile_dir=${profile}
    Maximize Browser Window
    Wait Until Element Is Enabled               ${mmc_login_username_locator}                   10s
    Input Text                                  ${mmc_login_username_locator}                   ${MMC_DEFAULT_USERNAME}
    Input Text                                  ${mmc_login_password_locator}                   ${MMC_DEFAULT_PASSWORD}
    Select Checkbox                             ${mmc_login_remember_me_locator}
    Click Element                               ${mmc_login_button_locator}
    Wait Until Page Contains Element            ${mmc_home_adrenalin_logo}                      2m
    Page Should Contain Element                 ${mmc_home_adrenalin_logo}
    sleep                                       10s
    Wait Until Page Contains Element            ${expand_seachange_sign}                        60s
    Click Element                               ${expand_seachange_sign}
    sleep                                       10s
    Wait Until Page Contains Element            ${expand_jenkovp01_sign}                        60s
    Click Element                               ${expand_jenkovp01_sign}
    sleep                                       10s
    Wait Until Page Contains Element            ${ovp_rhq-agent_label}                          60s
    Click Element                               ${ovp_rhq-agent_label}
    sleep                                       10s
    Wait Until Page Contains Element            ${ovp_availability_parameter}                   60s
    Page Should Contain Element                 ${ovp_availability_parameter}

tc02_ovp_gw_mmc_rhq_communicate
    [Documentation]                             CADR-2178:tc02_ ovp_gw_mmc_rhq_communicate
    [Tags]                                      Sanity
    Wait Until Page Contains Element            ${expand_ovp_gateway_sign}                      60s
    Click Element                               ${expand_ovp_gateway_sign}
    Sleep                                       10s
    Wait Until Page Contains Element            ${ovp_availability_parameter}                   60s
    Click Element                               ${ovp_gateway_under_ovp_gateway_label}
    sleep                                       10s
    Wait Until Page Contains Element            ${ovp_availability_parameter}                   60s
    Page Should Contain Element                 ${ovp_availability_parameter}
    ${ovp_availability_status_updated}          Get Text                                        ${ovp_availability_status}
    Should Be Equal As Strings                  ${ovp_availability_status_updated}              Running
    ${ovp_total_failed_requests_updated}        Get Text                                        ${ovp_total_failed_requests_value}
    Should Be Equal As Numbers                  ${ovp_total_failed_requests_updated}            0.0
    ${ovp_total_rejected_requests_updated}      Get Text                                        ${ovp_total_rejected_requests_value}
    Should Be Equal As Numbers                  ${ovp_total_rejected_requests_updated}          0.0
    ${ovp_total_requests_received_updated}      Get Text                                        ${ovp_total_requests_received_value}
    Should Be Equal As Numbers                  ${ovp_total_requests_received_updated}          0.0
    ${ovp_total_successful_requests_updated}    Get Text                                        ${ovp_total_successful_requests_value}
    Should Be Equal As Numbers                  ${ovp_total_successful_requests_updated}        0.0

tc03_total_requests_received_defined
    [Documentation]                             CADR-2179:tc03_total_requests_received_defined
    [Tags]                                      Sanity
    sleep                                       5s
    Wait Until Page Contains Element            ${ovp_total_requests_received_parameter}        60s
    Page Should Contain Element                 ${ovp_total_requests_received_parameter}

tc04_total_successful_requests_defined
    [Documentation]                             CADR-2180:tc04_total_successful_requests_defined
    [Tags]                                      Sanity
    sleep                                       5s
    Wait Until Page Contains Element            ${ovp_total_successful_requests_parameter}      60s
    Page Should Contain Element                 ${ovp_total_successful_requests_parameter}

tc05_total_failed_requests_defined
    [Documentation]                             CADR-2181:tc05_total_failed_requests_defined
    [Tags]                                      Sanity
    sleep                                       5s
    Wait Until Page Contains Element            ${ovp_total_failed_requests_parameter}          60s
    Page Should Contain Element                 ${ovp_total_failed_requests_parameter}

tc06_total_rejected_requests_defined
    [Documentation]                             CADR-2182:tc06_total_rejected_requests_defined
    [Tags]                                      Sanity
    sleep                                       5s
    Wait Until Page Contains Element            ${ovp_total_rejected_requests_parameter}        60s
    Page Should Contain Element                 ${ovp_total_rejected_requests_parameter}

tc07_total_requests_received_updated
    [Documentation]                             CADR-2183:tc07_total_requests_received_updated
    [Tags]                                      Sanity
    ${headers}=                                 Create Dictionary                               X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                         ${GATEWAY}                          ${headers}
    ${resp}=                                    Get Request                                     gateway                             /tvshow?serviceProviderId=${SERVICEPROVIDER_ID}
    Should Be Equal As Strings                  ${resp.status_code}                             200
    sleep                                       3m
    Click Element                               ${ovp_gateway_under_ovp_gateway_label}
    sleep                                       10s
    ${ovp_total_requests_received_updated}      Get Text                                        ${ovp_total_requests_received_value}
    Should Be Equal As Numbers                  ${ovp_total_requests_received_updated}          1.0

tc08_total_successful_requests_updated
    [Documentation]                             CADR-2184:tc08_total_successful_requests_updated
    [Tags]                                      Sanity
    ${ovp_total_successful_requests_updated}    Get Text                                        ${ovp_total_successful_requests_value}
    Should Be Equal As Numbers                  ${ovp_total_successful_requests_updated}        1.0

tc10_total_rejected_requests_updated_404
    [Documentation]                             CADR-2186:tc10_total_rejected_requests_updated_404
    [Tags]                                      Sanity
    ${headers}=                                 Create Dictionary                               X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                         ${GATEWAY}                          ${headers}
    ${resp}=                                    Get Request                                     gateway                             /incorrect?serviceProviderId=${SERVICEPROVIDER_ID}
    Should Be Equal As Strings                  ${resp.status_code}                             404
    sleep                                       4m
    Click Element                               ${ovp_gateway_under_ovp_gateway_label}
    sleep                                       10s
    ${ovp_total_rejected_requests_updated}      Get Text                                        ${ovp_total_rejected_requests_value}
    Should Be Equal As Numbers                  ${ovp_total_rejected_requests_updated}          1.0
    ${ovp_total_requests_received_updated}      Get Text                                        ${ovp_total_requests_received_value}
    Should Be Equal As Numbers                  ${ovp_total_requests_received_updated}          2.0
    Click Element                               ${mmc_logout_adminuser_span}
    Wait Until Element Is Visible               ${mmc_logout_link}                              30s
    Click Element                               ${mmc_logout_link}
    Wait Until Element Is Visible               ${mmc_login_button_locator}                     30s
    Close Browser

