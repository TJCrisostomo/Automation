*** Settings ***
Documentation    A resource file with reusable keywords and variables related to MMC.
...
Resource    ./page_resource_mmc.robot	
Library     Selenium2Library

*** Variables ***
#******************************** IPs and URLs *********************************
${MMC_URL}		            https://10.204.1.201:8443
${BROWSER}		            Firefox
${MMC_LOGIN}                ${MMC_URL}/mmc/log_in
${MMC_SOFTWARE}             ${MMC_URL}/mmc/software_configurations
${MMC_MONITORING}           ${MMC_URL}/mmc/monitoring_browse/browse_hardware
${MMC_LOG_VIEWER}           ${MMC_URL}/mmc/monitoring_browse/log_viewer
${MMC_ALERT_DEFINITIONS}    ${MMC_URL}/mmc/alert_defs
${MMC_RECENT_ALERTS}        ${MMC_URL}/mmc/alerts



${SGW_IP}                10.204.1.203
${GEOLOCATION_SERVICE}   http://${SGW_IP}:8090

#SB08 TestB
#${MMC_URL}		          https://10.202.8.124:8443
#${SGW_IP}                10.202.8.193
#${SGW_HOSTNAME}          SB08b-SGW01

#******************************* Hostname **************************************
${SGW_HOSTNAME}          jenksgw01
${SSH_USER_NAME}         seachange
${SSH_PASSWORD}          SeaChange

#******************************* Default Inputs ********************************
${MMC_DEFAULT_USERNAME}  admin
${MMC_DEFAULT_PASSWORD}  admin@123

#****************************** Common Variables *******************************
${GEOLOC_CONFIG_NAME}    GeoLocation
${OVP_CONFIG_NAME}       OVP_GATEWAY_AUTOMATION

#****************************** Ovp Gateway Configuration Variables *******************************
${ovp_config_error_message}                         The name (${OVP_CONFIG_NAME}) is already in use
${tenant_table_default_message}                     There are currently no items to display.
${request_timeout_default_message}                  3000 milliseconds
${cache_expiration_default_message}                 5 minutes
${compress_responses_default_message}               yes
${token_audience_default_message}                   Unconfigured
${page_size_default_message}                        100
${all_countries_file_path_default_message}          /seachange/local/seachange-rave-ovp_gateway/conf/allCountries.txt
${picture_api_proxy_server_url_default_message}     http://127.0.0.1:9000
${valid_sgw_url}                                    http://10.204.1.203:8080/SecureGateway
${invalid_sgw_url}                                  http://192.168.105.60:8080/SecureGateway
${invalid_tenant_id}                                abc123!@#
${invalid_url_format}                               invalid-url.com


*** Keywords ***
Login MMC
	Open Browser					 ${MMC_LOGIN}				        ${BROWSER}
	Maximize Browser Window
	Wait Until Element Is Enabled    ${mmc_login_username_locator}      10 seconds
	Input Text						 ${mmc_login_username_locator}      ${MMC_DEFAULT_USERNAME}
	Wait Until Element Is Enabled	 ${mmc_login_password_locator}      10 seconds
	Input Text						 ${mmc_login_password_locator}	    ${MMC_DEFAULT_PASSWORD}	
	Wait Until Element Is Enabled	 ${mmc_login_button_locator}        10 seconds
	Click Element					 ${mmc_login_button_locator}
	Wait Until Element Is Enabled    ${mmc_home_locator}                10 seconds
	
	
	
	
