*** Settings ***
Documentation     The test cases of this suite are tightly coupled. Please run test cases together. If you run independently they may fail.
Force Tags        Regression    Ovp Configuration
Library           Collections
Library           Selenium2Library
Library           RequestsLibrary
Library           SSHLibrary
Library           ../custom/WebdriverUtils.py
Resource          ../resource/page_resource_mmc.robot
Resource          ../resource/resource_mmc.robot
Resource          ../../api/resource/resource.robot

*** Test Cases ***
tc02_Create_Configuration
    [Documentation]                             CADR-2043:tc02_Create_Configuration
    [Tags]                                      Sanity
    ${path}=                                    Catenate                                                    SEPARATOR=\\                                        ${TEMPDIR}                  1
    ${profile}=                                 Create Profile
    open browser                                ${MMC_SOFTWARE}                                             firefox                                             ff_profile_dir=${profile}
    Maximize Browser Window
    Wait Until Element Is Enabled               ${mmc_login_username_locator}                               10s
    Input Text                                  ${mmc_login_username_locator}                               ${MMC_DEFAULT_USERNAME}
    Input Text                                  ${mmc_login_password_locator}                               ${MMC_DEFAULT_PASSWORD}
    Select Checkbox                             ${mmc_login_remember_me_locator}
    Click Element                               ${mmc_login_button_locator}
    Wait Until Page Contains Element            ${mmc_home_adrenalin_logo}                                  180s
    Mouse Down                                  ${mmc_create_configuration_button_locator}
    Mouse Up                                    ${mmc_create_configuration_button_locator}
    Wait Until Page Contains Element            ${dialog_config_name_locator}                               20s
    Input Text                                  ${dialog_config_name_locator}                               ${OVP_CONFIG_NAME}
    Select From List By Label                   ${dialog_component_locator}                                 ovp-gateway
    Select From List By Label                   ${dialog_version_locator}                                   Latest version
    Wait Until Page Contains Element            ${dialog_ovp_chkbox_locator}                                5s
    Select Checkbox                             ${dialog_ovp_chkbox_locator}
    Mouse Down                                  ${dialog_unassigned_location_locator}
    Mouse Up                                    ${dialog_unassigned_location_locator}
    Click Element                               ${dialog_create_button_locator}
    Wait Until Page Contains Element            ${mmc_tree_unassigned_plus_icon_locator}                    2m
    Click Element                               ${mmc_tree_unassigned_plus_icon_locator}
    Wait Until Page Contains Element            ${mmc_tree_ovp_plus_icon_locator}                           5s
    Click Element                               ${mmc_tree_ovp_plus_icon_locator}
    Wait Until Page Contains Element            ${mmc_tree_ovp_gateway_service_lable_locator}               5s
    Page Should Contain Element                 ${mmc_tree_ovp_gateway_service_lable_locator}

tc03_Create_Config_Negative
    [Documentation]                             CADR-2044:tc03_Create_Config_Negative
    [Tags]                                      Sanity
    sleep                                       5s
    Mouse Down                                  ${mmc_create_configuration_button_locator}
    Mouse Up                                    ${mmc_create_configuration_button_locator}
    Wait Until Page Contains Element            ${dialog_config_name_locator}                               20s
    Input Text                                  ${dialog_config_name_locator}                               ${OVP_CONFIG_NAME}
    Select From List By Label                   ${dialog_component_locator}                                 ovp-gateway
    Select From List By Label                   ${dialog_version_locator}                                   Latest version
    Wait Until Page Contains Element            ${dialog_ovp_chkbox_locator}                                5s
    Select Checkbox                             ${dialog_ovp_chkbox_locator}
    Mouse Down                                  ${dialog_unassigned_location_locator}
    Mouse Up                                    ${dialog_unassigned_location_locator}
    Click Element                               ${dialog_create_button_locator}
    sleep                                       5s
    Page Should Contain                         ${ovp_config_error_message}
    Click Element                               ${dialog_cancel_button1_locator}
    Wait Until Page Contains Element            ${mmc_tree_ovp_gateway_service_lable_locator}               5s
    Page Should Contain Element                 ${mmc_tree_ovp_gateway_service_lable_locator}

tc04_Default_Settings
    [Documentation]                             CADR-2045:tc04_Default_Settings
    [Tags]                                      Sanity
    sleep                                       5s
    Click Element                               ${mmc_tree_ovp_gateway_service_lable_locator}
    sleep                                       5s
    Page Should Contain                         ${tenant_table_default_message}
    Page Should Contain                         ${request_timeout_default_message}
    Page Should Contain                         ${cache_expiration_default_message}
    Page Should Contain                         ${compress_responses_default_message}
    Page Should Contain                         ${token_audience_default_message}
    Page Should Contain                         ${page_size_default_message}
    Page Should Contain                         ${all_countries_file_path_default_message}
    Page Should Contain                         ${picture_api_proxy_server_url_default_message}

tc06_Mandatory_Settings
    [Documentation]                             CADR-2047:tc06_Mandatory_Settings
    [Tags]                                      Sanity
    sleep                                       5s
    Click Element                               ${mmc_tree_ovp_gateway_service_lable_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Element Is Visible               ${mmc_ovp_add_tenant_button_locator}                        30s
    Page Should Contain Element                 ${mmc_ovp_add_tenant_button_locator}
    Clear Element Text                          ${mmc_ovp_request_timeout_textbox_locator}
    Unselect Checkbox                           ${mmc_ovp_enable_response_cache_checkbox_locator}
    Clear Element Text                          ${mmc_ovp_cache_expiration_textbox_locator}
    Select From List By Label                   ${mmc_ovp_compress_responses_dropdown_locator}              Select Compress responses
    Clear Element Text                          ${mmc_ovp_shared_secret_textbox_locator}
    Clear Element Text                          ${mmc_ovp_default_pagesize_textbox_locator}
    Clear Element Text                          ${mmc_ovp_default_language_filter_textbox_locator}
    Clear Element Text                          ${mmc_ovp_geolocation_service_url_textbox_locator}
    Clear Element Text                          ${mmc_ovp_all_countries_file_path_textbox_locator}
    Clear Element Text                          ${mmc_ovp_picture_api_proxy_server_url_textbox_locator}
    Click Element                               ${mmc_commit_button_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_ovp_tenant_table_mandatory_message_locator}
    Page Should Contain Element                 ${mmc_ovp_shared_secret_mandatory_message_locator}
    Page Should Contain Element                 ${mmc_ovp_private_claims_mandatory_message_locator}
    Page Should Contain Element                 ${mmc_ovp_geolocation_claims_mandatory_message_locator}
    Page Should Contain Element                 ${mmc_ovp_all_countries_file_path_mandatory_message_locator}
    Page Should Contain Element                 ${mmc_ovp_picture_api_proxy_mandatory_message_locator}
    Page Should Contain Element                 ${mmc_ovp_error_message_details_locator}
    Click Element                               ${mmc_cancel_button_locator}
    Click Element                               ${dialog_yes_button_locator}
    Wait Until Page Contains Element            ${mmc_tree_ovp_gateway_service_lable_locator}               10s
    Page Should Contain Element                 ${mmc_tree_ovp_gateway_service_lable_locator}

tc07_Invalid_Settings
    [Documentation]                             CADR-2048:tc07_Invalid_Settings
    [Tags]                                      Sanity
    sleep                                       5s
    Click Element                               ${mmc_tree_ovp_gateway_service_lable_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Element Is Visible               ${mmc_ovp_add_tenant_button_locator}                        30s
    Page Should Contain Element                 ${mmc_ovp_add_tenant_button_locator}
    Click Element                               ${mmc_ovp_add_tenant_button_locator}
    sleep                                       5s
    Input Text                                  ${mmc_ovp_tenant_id_textbox_locator}                        ${invalid_tenant_id}
    Input Text                                  ${mmc_ovp_sgw_url_textbox_locator}                          ${invalid_url_format}
    Select From List By Label                   ${mmc_ovp_location_rule_dropdown_locator}                   ACTUAL
    Click Element                               ${mmc_ovp_continue_button_locator}
    sleep    5s
    Page Should Contain Element                 ${mmc_ovp_tenant_id_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_sgw_url_invalid_message_locator}
    Click Element                               ${mmc_ovp_cancel_button_locator}
    Click Element                               ${dialog_yes_button_locator}
    sleep                                       5s
    Input Text                                  ${mmc_ovp_request_timeout_textbox_locator}                  a
    Input Text                                  ${mmc_ovp_cache_expiration_textbox_locator}                 b
    Clear Element Text                          ${mmc_ovp_shared_secret_textbox_locator}
    Input Text                                  ${mmc_ovp_shared_secret_textbox_locator}                    abc123!@#
    Clear Element Text                          ${mmc_ovp_default_pagesize_textbox_locator}
    Input Text                                  ${mmc_ovp_default_pagesize_textbox_locator}                 -2
    Clear Element Text                          ${mmc_ovp_geolocation_service_url_textbox_locator}
    Input Text                                  ${mmc_ovp_geolocation_service_url_textbox_locator}          ${invalid_url_format}
    Clear Element Text                          ${mmc_ovp_picture_api_proxy_server_url_textbox_locator}
    Input Text                                  ${mmc_ovp_geolocation_service_url_textbox_locator}          ${invalid_url_format}
    Click Element                               ${mmc_commit_button_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_ovp_request_timeout_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_cache_expiration_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_shared_secret_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_token_source_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_token_audience_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_default_page_size_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_geolocation_service_url_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_picture_api_proxy_server_url_invalid_message_locator}
    Page Should Contain Element                 ${mmc_ovp_error_message_details_locator}
    Click Element                               ${mmc_cancel_button_locator}
    Click Element                               ${dialog_yes_button_locator}
    Wait Until Page Contains Element            ${mmc_tree_ovp_gateway_service_lable_locator}               10s
    Page Should Contain Element                 ${mmc_tree_ovp_gateway_service_lable_locator}

tc05_Edit_Settings
    [Documentation]                             CADR-2046:tc05_Edit_Settings
    [Tags]                                      Sanity
    sleep                                       5s
    Click Element                               ${mmc_tree_ovp_gateway_service_lable_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Element Is Visible               ${mmc_ovp_add_tenant_button_locator}                        30s
    Page Should Contain Element                 ${mmc_ovp_add_tenant_button_locator}
    Click Element                               ${mmc_ovp_add_tenant_button_locator}
    sleep                                       5s
    Input Text                                  ${mmc_ovp_tenant_id_textbox_locator}                        rok
    Input Text                                  ${mmc_ovp_sgw_url_textbox_locator}                          ${valid_sgw_url}
    Select From List By Label                   ${mmc_ovp_location_rule_dropdown_locator}                   ACTUAL
    Click Element                               ${mmc_ovp_continue_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_ovp_add_tenant_button_locator}
    sleep                                       5s
    Input Text                                  ${mmc_ovp_tenant_id_textbox_locator}                        schange
    Input Text                                  ${mmc_ovp_sgw_url_textbox_locator}                          ${valid_sgw_url}
    Select From List By Label                   ${mmc_ovp_location_rule_dropdown_locator}                   PROVISIONED
    Click Element                               ${mmc_ovp_continue_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_ovp_add_tenant_button_locator}
    sleep                                       5s
    Input Text                                  ${mmc_ovp_tenant_id_textbox_locator}                        tenant1
    Input Text                                  ${mmc_ovp_sgw_url_textbox_locator}                          ${invalid_sgw_url}
    Select From List By Label                   ${mmc_ovp_location_rule_dropdown_locator}                   ACTUAL
    Click Element                               ${mmc_ovp_continue_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_ovp_add_tenant_button_locator}
    sleep                                       5s
    Input Text                                  ${mmc_ovp_tenant_id_textbox_locator}                        tenant2
    Input Text                                  ${mmc_ovp_sgw_url_textbox_locator}                          ${invalid_sgw_url}
    Select From List By Label                   ${mmc_ovp_location_rule_dropdown_locator}                   PROVISIONED
    Click Element                               ${mmc_ovp_continue_button_locator}
    sleep                                       5s
    Input Text                                  ${mmc_ovp_cache_expiration_textbox_locator}                 2
    Select From List By Label                   ${mmc_ovp_compress_responses_dropdown_locator}              no
    Input Text                                  ${mmc_ovp_default_pagesize_textbox_locator}                 20
    Input Text                                  ${mmc_ovp_default_language_filter_textbox_locator}          fr
    Input Text                                  ${mmc_ovp_geolocation_service_url_textbox_locator}          http://${SGW_IP}:8090/geolocation/ip
    Mouse Down                                  ${mmc_ovp_add_private_claim_locator}
    Mouse Up                                    ${mmc_ovp_add_private_claim_locator}
    sleep                                       10s
    Select From List By Label                   ${mmc_ovp_private_claim_dropdown_locator}                   ADD
    sleep                                       5s
    Click Element                               ${mmc_ovp_continue_button_locator}
    sleep                                       5s
    Mouse Down                                  ${mmc_commit_button_locator}
    Mouse Up                                    ${mmc_commit_button_locator}
    sleep                                       5s
    Mouse Down                                  ${mmc_commit_button_locator}
    Mouse Up                                    ${mmc_commit_button_locator}
    sleep                                       5s
    Mouse Down                                  ${dialog_commit_button_locator}
    Mouse Up                                    ${dialog_commit_button_locator}
    Wait Until Page Contains Element            ${mmc_tree_ovp_gateway_service_lable_locator}               10s
    Page Should Contain Element                 ${mmc_tree_ovp_gateway_service_lable_locator}

tc08_Assign_Configuration
    [Documentation]                             CADR-2049:tc08_Assign_Configuration
    [Tags]                                      Sanity
    sleep                                       5s
    Click Element                               ${mmc_tree_jenkins_ovp_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Page Contains Element            ${mmc_host_jenk_ovp_chkbox_locator}                         30s
    Unselect Checkbox                           ${mmc_host_jenk_ovp_chkbox_locator} 
    sleep                                       5s
    Click Element                               ${mmc_commit_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_tree_ovp_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Page Contains Element            ${mmc_host_jenk_ovp_chkbox_locator}                         30s
    Select Checkbox                             ${mmc_host_jenk_ovp_chkbox_locator} 
    sleep                                       5s
    Click Element                               ${mmc_commit_button_locator}
    sleep                                       5s
    Page Should Contain Element                 ${mmc_host_jenk_ovp_locator}
    Open Connection                             ${GATEWAY_IP}
    Login                                       ${SSH_USER_NAME}                                            ${SSH_PASSWORD}
    ${ovp_service_status}                       Execute Command                                             sudo service seachange-rave-ovp_gateway restart
    Log To Console                              ${ovp_service_status}
    sleep                                       2m

tc10_SGW_URL_propagation
    [Documentation]                             CADR-2051:tc10_SGW_URL_propagation
    [Tags]                                      Sanity
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /movie?serviceProviderId=rok
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    sleep                                       30s
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=schange
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    sleep                                       30s
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=tenant1
    Should Be Equal As Strings                  ${resp.status_code}                                         500
    Should Be True                              ${resp.content}                                             {"error":{"status":"500 Internal Server Error","message":"A generic error message, given when no more specific message is suitable","code":500}}
    sleep                                       30s
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=tenant2
    Should Be Equal As Strings                  ${resp.status_code}                                         500
    Should Be True                              ${resp.content}                                             {"error":{"status":"500 Internal Server Error","message":"A generic error message, given when no more specific message is suitable","code":500}}
    sleep                                       30s
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=invalid
    Should Be Equal As Strings                  ${resp.status_code}                                         400
    Should Be Equal                             ${resp.content}                                             serviceProviderId is invalid/not configured!
    sleep                                       30s

tc14_Compress_Responses_propagation
    [Documentation]                             CADR-2055:tc14_Compress_Responses_propagation
    [Tags]                                      Sanity
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /movie?serviceProviderId=rok
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    Dictionary Should Not Contain Key           ${resp.headers}                                             content-encoding
    Dictionary Should Not Contain Value         ${resp.headers}                                             gzip
    sleep                                       30s

tc18_Default_Page_Size_propagation
    [Documentation]                             CADR-2059:tc18_Default_Page_Size_propagation
    [Tags]                                      Sanity
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /movie?serviceProviderId=rok
    Should Be Equal As Strings                  ${resp.status_code}    200
    Should Be True                              ${resp.json()['totalCount']} > 0
    Should Be Equal As Numbers                  ${resp.json()['pageSize']}                                  20
    Dictionary Should Contain Item              ${resp.json()}                                              pageSize                                            20
    sleep                                       30s

tc19_Default_Language_Filter_propagation
    [Documentation]                             CADR-2060:tc19_Default_Language_Filter_propagation
    [Tags]                                      Sanity
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /movie?serviceProviderId=rok
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    Comment                                     Check Key Value Pair                                        ${resp.json()}                                      language                    fr
    sleep                                       30s

tc12_Enable_Response_Cache_propagation
    [Documentation]                             CADR-2053:tc12_Enable_Response_Cache_propagation
    [Tags]                                      Sanity
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=rok
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=schange
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Open Connection                             ${GATEWAY_IP}
    Login                                       ${SSH_USER_NAME}                                            ${SSH_PASSWORD}
    ${output}=                                  Execute Command                                             tail -200 /var/log/seachange/rave/ovp_gateway.log | grep -i "response for /tvshow?serviceProviderId="
    Should Contain                              ${output}                                                   Checking if response for /tvshow?serviceProviderId=schange is present in cache.
    Should Contain                              ${output}                                                   Response for /tvshow?serviceProviderId=schange is not present in cache. \ Calling action.
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=rok
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    ${output}=                                  Execute Command                                             tail -200 /var/log/seachange/rave/ovp_gateway.log | grep -i "response for /tvshow?serviceProviderId="
    Should Contain                              ${output}                                                   Checking if response for /tvshow?serviceProviderId=rok is present in cache.
    Should Contain                              ${output}                                                   Fetching response for /tvshow?serviceProviderId=rok in cache.

tc13_Cache_Expiration_propagation
    [Documentation]                             CADR-2054:tc13_Cache_Expiration_propagation
    [Tags]                                      Sanity
    sleep                                       3m
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=rok
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    ${output}=                                  Execute Command                                             tail -200 /var/log/seachange/rave/ovp_gateway.log | grep -i "response for /tvshow?serviceProviderId="
    Should Contain                              ${output}                                                   Checking if response for /tvshow?serviceProviderId=rok is present in cache.
    Should Contain                              ${output}                                                   Response for /tvshow?serviceProviderId=rok is not present in cache. \ Calling action.
    ${headers}=                                 Create Dictionary                                           X-Forwarded-For=${XFORWARDED_IP}
    Create Session                              gateway                                                     ${GATEWAY}                                          ${headers}
    ${resp}=                                    Get Request                                                 gateway                                             /tvshow?serviceProviderId=schange
    Should Be Equal As Strings                  ${resp.status_code}                                         200
    Should Be True                              ${resp.json()['totalCount']} > 0
    ${output}=                                  Execute Command                                             tail -200 /var/log/seachange/rave/ovp_gateway.log | grep -i "response for /tvshow?serviceProviderId="
    Should Contain                              ${output}                                                   Checking if response for /tvshow?serviceProviderId=schange is present in cache.
    Should Contain                              ${output}                                                   Response for /tvshow?serviceProviderId=schange is not present in cache. \ Calling action.
    Close Connection
    
tc09_Delete_Configuration
    [Documentation]                             CADR-2050:tc09_Delete_Configuration
    [Tags]                                      Sanity
    sleep                                       5s
    Click Element                               ${mmc_tree_ovp_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Page Contains Element            ${mmc_host_jenk_ovp_chkbox_locator}                         30s
    Unselect Checkbox                           ${mmc_host_jenk_ovp_chkbox_locator}
    sleep                                       5s
    Click Element                               ${mmc_commit_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_delete_locator}
    sleep                                       5s
    Click Element                               ${dialog_ok_button_locator}
    Wait Until Page Does Not Contain Element    ${mmc_tree_ovp_locator}                                     20s
    Page Should Not Contain Element             ${mmc_tree_ovp_locator}
    Click Element                               ${mmc_tree_jenkins_ovp_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_button_locator}
    sleep                                       5s
    Click Element                               ${mmc_actions_edit_locator}
    Wait Until Page Contains Element            ${mmc_host_jenk_ovp_chkbox_locator}                         30s
    Select Checkbox                             ${mmc_host_jenk_ovp_chkbox_locator} 
    sleep                                       5s
    Click Element                               ${mmc_commit_button_locator}
    Wait Until Page Contains Element            ${mmc_host_jenk_ovp_locator}                                20s
    Page Should Contain Element                 ${mmc_host_jenk_ovp_locator}
    Click Element                               ${mmc_logout_adminuser_span}
    Wait Until Element Is Visible               ${mmc_logout_link}                                          30s
    Click Element                               ${mmc_logout_link}
    Wait Until Element Is Visible               ${mmc_login_button_locator}                                 30s
    Close Browser
