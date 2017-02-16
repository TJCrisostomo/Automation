*** Settings ***
Documentation    A test suite for testing the Software Configuration of Geolocation MMC component.
...				     \n* Delete Geolocation Configuration
...                  \n* Create Geolocation Configuration
...				     \n* Edit Geolocation Configuration
...				     \n* Invalid Geolocation Database Path
...				     \n* Valid Geolocation Database Path

Resource    ../resource/resource_mmc.robot
Resource	../../api/resource/resource.robot
Library     String

Suite Setup       Login MMC
Suite Teardown    Close All Browsers 

*** Variables ***
${valid_geoloc_data_path}    /seachange/local/geolocation/GeoLite2-City.mmdb

*** Test Cases ***
Delete Geolocation Configuration
	[Tags]                               Geolocation Configuration    Test
	[Documentation]                      CADR-2661:tc05_delete_configuration
	#Wait Until Element Is Enabled        ${mmc_configurations_locator}          10 seconds    
	Go To                                ${MMC_SOFTWARE}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_locator}             10 seconds    ${GEOLOC_CONFIG_NAME} does not exist
	Click Element                        ${mmc_tree_geoloc_locator} 
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	Wait Until Element Is Visible        ${mmc_geoloc_sub_component_locator}    10 seconds 
	Wait Until Element Is Enabled        ${mmc_actions_button_locator}          10 seconds
	Mouse Over                           ${mmc_actions_button_locator}	
	Wait Until Element Is Enabled        ${mmc_actions_edit_locator}            10 seconds
	Click Element                        ${mmc_actions_edit_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	Wait Until Element Is Enabled        ${mmc_host_sgw_chkbox_locator}         10 seconds
	Unselect Checkbox                    ${mmc_host_sgw_chkbox_locator}
	Wait Until Element Is Enabled        ${mmc_commit_button_locator}           10 seconds
	Click Element                        ${mmc_commit_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	Wait Until Element Is Enabled        ${mmc_actions_button_locator}          10 seconds
	Mouse Over                           ${mmc_actions_button_locator}
	Wait Until Element Is Enabled        ${mmc_actions_delete_locator}          10 seconds
	Click Element                        ${mmc_actions_delete_locator}
	Wait Until Element Is Enabled        ${dialog_ok_button_locator}            10 seconds
	Click Element                        ${dialog_ok_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds

Create Geolocation Configuration
	[Tags]                               Geolocation Configuration    Test
	[Documentation]                      CADR-2086:tc01_Create_GeoLocation_Configuration
	#Wait Until Element Is Enabled        ${mmc_configurations_locator}                 10 seconds
	Go To                                ${MMC_SOFTWARE}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}                    10 seconds
	Wait Until Element Is Enabled        ${mmc_create_configuration_button_locator}    10 seconds
	Mouse Down                           ${mmc_create_configuration_button_locator}
	Mouse Up                             ${mmc_create_configuration_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}                    10 seconds
	Wait Until Element Is Enabled        ${dialog_config_name_locator}                 10 seconds
	Input Text                           ${dialog_config_name_locator}                 ${GEOLOC_CONFIG_NAME}
	Wait Until Element Is Enabled        ${dialog_component_locator}                   10 seconds
	Select From List By Label            ${dialog_component_locator}                   Geolocation
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}                    10 seconds
	Wait Until Element Is Enabled        ${dialog_version_locator}                     10 seconds
	Select From List By Label            ${dialog_version_locator}                     Latest version
	Wait Until Element Is Enabled        ${dialog_geoloc_chkbox_locator}               10 seconds
	Select Checkbox                      ${dialog_geoloc_chkbox_locator}
	Wait Until Element Is Enabled        ${dialog_location_locator}                    10 seconds
	Wait Until Element Is Visible        ${dialog_location_locator}                    30 seconds
	Mouse Down                           ${dialog_location_locator}
	Mouse Up                             ${dialog_location_locator}
	Wait Until Element Is Enabled        ${dialog_create_button_locator}               10 seconds
	Click Element                        ${dialog_create_button_locator}
	#Wait Until Element Is Not Visible    ${mmc_please_wait_locator}                    10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_locator}                    10 seconds
	
Edit Geolocation Configuration
	[Tags]                               Geolocation Configuration    Test
	[Documentation]                      CADR-2767:Edit Geolocation component configuration
	Go To                                ${MMC_SOFTWARE}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_locator}             10 seconds 
	Click Element                        ${mmc_tree_geoloc_locator} 
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	Wait Until Element Is Visible        ${mmc_geoloc_sub_component_locator}    10 seconds 
	Wait Until Element Is Visible        ${mmc_actions_button_locator}          10 seconds
	Wait Until Element Is Enabled        ${mmc_actions_button_locator}          10 seconds
	Mouse Over                           ${mmc_actions_button_locator}	
	Wait Until Element Is Visible        ${mmc_actions_edit_locator}            10 seconds
	Wait Until Element Is Enabled        ${mmc_actions_edit_locator}            10 seconds
	Click Element                        ${mmc_actions_edit_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	Wait Until Element Is Visible        ${mmc_host_sgw_chkbox_locator}         10 seconds
	Wait Until Element Is Enabled        ${mmc_host_sgw_chkbox_locator}         10 seconds
	Select Checkbox                      ${mmc_host_sgw_chkbox_locator}
	Wait Until Element Is Visible        ${mmc_commit_button_locator}           10 seconds
	Wait Until Element Is Enabled        ${mmc_commit_button_locator}           10 seconds
	Click Element                        ${mmc_commit_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}             10 seconds
	
Invalid Geolocation Database Path 
	[Tags]                               Geolocation Configuration
	[Documentation]                      CADR-2087:tc02_invalid_dbPath_configuartion
	Go To                                ${MMC_SOFTWARE}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_tree_geoloc_locator}              10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_tree_geoloc_plus_icon_locator}    10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_plus_icon_locator}    10 seconds
	Click Element                        ${mmc_tree_geoloc_plus_icon_locator}
	Wait Until Element Is Visible        ${mmc_tree_geoloc_service_locator}      10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_service_locator}      10 seconds
	Click Element                        ${mmc_tree_geoloc_service_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Enabled        ${mmc_geoloc_db_path_locator}           10 seconds
	Wait Until Element Is Visible        ${mmc_actions_button_locator}           10 seconds
	Wait Until Element Is Enabled        ${mmc_actions_button_locator}           10 seconds
	Mouse Over                           ${mmc_actions_button_locator}	
	Wait Until Element Is Visible        ${mmc_actions_edit_locator}             10 seconds
	Wait Until Element Is Enabled        ${mmc_actions_edit_locator}             10 seconds
	Click Element                        ${mmc_actions_edit_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_GeolocationDataPath_locator}      10 seconds
	Wait Until Element Is Enabled        ${mmc_GeolocationDataPath_locator}      10 seconds
	${geoloc_data_path}=                 Get Value                               ${mmc_GeolocationDataPath_locator}
	${dbpath_length}=                    Get Length                              ${geoloc_data_path}
	${invalid_data_path}=                Replace String                          ${geoloc_data_path}               .mmdb    .mmdbaaaaaa
	Focus                                ${mmc_GeolocationDataPath_locator}
	:FOR                                 ${i}                                    IN RANGE                          1        ${dbpath_length}+2
	\  Press Key                         ${mmc_GeolocationDataPath_locator}      \\127                     
	Press Key                            ${mmc_GeolocationDataPath_locator}      ${invalid_data_path}                   
	Wait Until Element Is Visible        ${mmc_commit_button_locator}            10 seconds
	Wait Until Element Is Enabled        ${mmc_commit_button_locator}            10 seconds
	Click Element                        ${mmc_commit_button_locator}
	Sleep                                2s
	Wait Until Element Is Visible        ${mmc_changes_locator}                  10 seconds
	Wait Until Element Is Visible        ${mmc_changes_new_value_locator}        10 seconds
	${new_value}=                        Get Text                                ${mmc_changes_new_value_locator}
	Should Be Equal As Strings           ${new_value}                            ${invalid_data_path}
	Wait Until Element Is Visible        ${mmc_commit_button_locator}            10 seconds
	Wait Until Element Is Enabled        ${mmc_commit_button_locator}            10 seconds
	Click Element                        ${mmc_commit_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Visible        ${dialog_commit_button_locator}         10 seconds
	Wait Until Element Is Enabled        ${dialog_commit_button_locator}         10 seconds
	Click Element                        ${dialog_commit_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Click Element                        ${mmc_tree_geoloc_minus_icon_locator}
	Click Element                        ${mmc_tree_geoloc_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Sleep                                90 seconds
	Create Session                       geolocation                             ${GEOLOCATION_SERVICE}
	${response}                          Get Request                             geolocation                       /geolocation/ip/18.0.0.0
	Should Be Equal As Strings           ${response.status_code}                 500
	
Valid Geolocation Database Path 
	[Tags]                               Geolocation Configuration
	[Documentation]                      CADR-2088:tc03_valid_dbPath_configuartiond
	Go To                                ${MMC_SOFTWARE}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_tree_geoloc_locator}              10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_tree_geoloc_plus_icon_locator}    20 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_plus_icon_locator}    10 seconds
	Click Element                        ${mmc_tree_geoloc_plus_icon_locator}
	Wait Until Element Is Visible        ${mmc_tree_geoloc_service_locator}      10 seconds
	Wait Until Element Is Enabled        ${mmc_tree_geoloc_service_locator}      10 seconds
	Click Element                        ${mmc_tree_geoloc_service_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_geoloc_db_path_locator}           10 seconds
	Wait Until Element Is Enabled        ${mmc_geoloc_db_path_locator}           10 seconds
	Wait Until Element Is Visible        ${mmc_actions_button_locator}           10 seconds
	Wait Until Element Is Enabled        ${mmc_actions_button_locator}           10 seconds
	Mouse Over                           ${mmc_actions_button_locator}	
	Wait Until Element Is Visible        ${mmc_actions_edit_locator}             10 seconds
	Click Element                        ${mmc_actions_edit_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_GeolocationDataPath_locator}      10 seconds
	Wait Until Element Is Enabled        ${mmc_GeolocationDataPath_locator}      10 seconds
	${geoloc_data_path}=                 Get Value                               ${mmc_GeolocationDataPath_locator}
	${dbpath_length}=                    Get Length                              ${geoloc_data_path}
	Focus                                ${mmc_GeolocationDataPath_locator}
	:FOR                                 ${i}                                    IN RANGE                          1    ${dbpath_length}+2
	\  Press Key                         ${mmc_GeolocationDataPath_locator}      \\127                     
	Input Text                           ${mmc_GeolocationDataPath_locator}      ${valid_geoloc_data_path}
	Wait Until Element Is Visible        ${mmc_commit_button_locator}            10 seconds
	Wait Until Element Is Enabled        ${mmc_commit_button_locator}            10 seconds
	Click Element                        ${mmc_commit_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Wait Until Element Is Visible        ${mmc_changes_locator}                  10 seconds
	Wait Until Element Is Visible        ${mmc_changes_new_value_locator}        10 seconds
	${new_value}=                        Get Text                                ${mmc_changes_new_value_locator}
	Should Be Equal As Strings           ${new_value}                            ${valid_geoloc_data_path}
	${widget_displayed}=                 Run Keyword And Return Status           Page Should Contain Element       ${dialog_widget_locator}
	Run Keyword If                       ${widget_displayed}                     Click Element                     ${dialog_commit_button_locator}
	...  ELSE                            Run Keywords                            Click Element                     ${mmc_changes_commit_locator}
	...  AND                             Wait Until Element Is Not Visible       ${mmc_please_wait_locator}        10 seconds
	...  AND                             Click Element                           ${dialog_commit_button_locator}
	Wait Until Element Is Not Visible    ${mmc_please_wait_locator}              10 seconds
	Sleep                                180 seconds
	Create Session                       geolocation                             ${GEOLOCATION_SERVICE}
	${response}                          Get Request                             geolocation                       /geolocation/ip/18.0.0.0
	Should Be Equal As Strings           ${response.status_code}                 200





