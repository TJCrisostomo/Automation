*** Settings ***
Documentation    A test suite for testing the Monitoring of Geolocation in MMC.

Resource          ../resource/resource_mmc.robot
Library           RequestsLibrary
Library           SSHLibrary
Suite Setup       Run Keywords    Populate Geoloc Request    AND    Login MMC
Suite Teardown    Run Keywords    Close All Browsers         AND    Delete All Sessions

*** Variables ***
@{ip_list}        18.0.0.0    18.0

*** Keywords ***
Populate Geoloc Request
    Create Session       geolocation    ${GEOLOCATION_SERVICE}
    ${count}=            Evaluate       random.randint(10,20)        modules=random
    :FOR    ${i}    IN RANGE    ${count}
    \  ${random}=        Evaluate       random.choice(@{ip_list})    modules=random
    \  ${resp}=          Get Request    geolocation                  /geolocation/ip/${random}
    Sleep                1 minute

*** Test Cases ***
Geolocation Availability Running
	[Documentation]                     CADR-2100:tc01_ geolocation_availability_running
	[Tags]                              Geolocation Availability
	Comment                             All test cases are verified on dev environment(.56 and .59) Bugs CLOUD-4659. and CLOUD-4663
	Go To                               ${MMC_MONITORING}
	Wait Until Element Is Enabled       ${mon_seachange_plus_locator}         10 seconds
	Click Element                       ${mon_seachange_plus_locator}
	Wait Until Element Is Enabled       ${mon_sgw_plus_locator}               10 seconds
	Click Element                       ${mon_sgw_plus_locator}
	Wait Until Element Is Enabled       ${mon_geoloc_plus_locator}            10 seconds
	Click Element                       ${mon_geoloc_plus_locator}
	Wait Until Element Is Enabled       ${mon_geoloc_tab_locator}             10 seconds
	Click Element                       ${mon_geoloc_tab_locator}
	Wait Until Page Contains Element    ${mon_geoloc_availability_locator}    10 seconds       Page Does not contain 'Availability' Metric
	${status}=                          Get Text                              ${mon_geoloc_availability_status_locator}
    Should Be Equal                     ${status}                             Running
    Page Should Contain Element         ${mon_geoloc_header_locator}

Geolocation HealthCheckStatus Defined
	[Documentation]                     CADR-2102:tc03_geoloaction_HealthCheckStatus_defined
	[Tags]                              Geolocation HealthCheck
    Page Should Contain Element         ${mon_geoloc_healthcheck_status_locator}


Total Requests Received Defined
   	[Documentation]                     CADR-2103:tc04_total_requests_received_defined
   	[Tags]                              Geolocation Total Requests
    Page Should Contain Element         ${mon_geoloc_requests_received_locator}
    Page Should Contain Element         ${mon_geoloc_requests_received_value_locator}

Total Successful Requests Defined
    [Documentation]                     CADR-2104:tc05_total_successful_requests_defined
    [Tags]                              Geolocation Successful Requests
    Page Should Contain Element         ${mon_geoloc_successful_requests_locator}
    Page Should Contain Element         ${mon_geoloc_successful_requests_value_locator}
	
Total Failed Requests Defined
    [Documentation]	                    CADR-2105:tc06_total_failed_requests_defined
    [Tags] 	                            Geolocation Failed Requests
    Page Should Contain Element         ${mon_geoloc_failed_requests_locator}
    Page Should Contain Element         ${mon_geoloc_failed_requests_value_locator}

Total Requests Received Updated
    [Documentation]                     CADR-2107:tc08_total_requests_received_updated
    [Tags]                        	    Geolocation Total Requests
	Click Element                       ${mon_geoloc_tab_locator}
    Wait Until Element Is Visible       ${mon_geoloc_featured_metrics_locator}    1 minute
    ${total_requests}=                  Get Text                              ${mon_geoloc_requests_received_value_locator}
    ${response}=                        Get Request                           geolocation                                       /geolocation/ip/18.0.0.0
    Should Be Equal As Strings          ${response.status_code}			      200
    Sleep                               1 minute
    Reload Page
    Wait Until Element Is Visible       ${mon_geoloc_featured_metrics_locator}    1 minute
    ${total_requests_updated}=          Get Text                              ${mon_geoloc_requests_received_value_locator}
    ${successful_requests_updated}=     Get Text                              ${mon_geoloc_successful_requests_value_locator}
    ${failed_requests_updated}=         Get Text                              ${mon_geoloc_failed_requests_value_locator}
    Should Be True                      ${total_requests_updated} == ${total_requests} + ${1.0}
    Should Be True                      ${total_requests_updated} == ${successful_requests_updated} + ${failed_requests_updated}

Total Successful Requests Update												
   	[Documentation]                     CADR-2108:tc09_total_successful_requests_update
   	[Tags]                        	    Geolocation Successful Requests
	${total_requests}=                  Get Text                              ${mon_geoloc_requests_received_value_locator}
    ${successful_requests}=             Get Text                              ${mon_geoloc_successful_requests_value_locator}
    ${response}=                        Get Request                           geolocation                                       /geolocation/ip/18.0.0.0
    Should Be Equal As Strings          ${response.status_code}			      200
    Sleep                               1 minute
    Reload Page
    Wait Until Element Is Visible       ${mon_geoloc_featured_metrics_locator}    1 minute
    ${total_requests_updated}=          Get Text                              ${mon_geoloc_requests_received_value_locator}
    ${successful_requests_updated}=     Get Text                              ${mon_geoloc_successful_requests_value_locator}
	Should Be True                      ${successful_requests_updated} == ${successful_requests} + ${1.0}
	Should Be True                      ${total_requests_updated} == ${total_requests} + ${1.0}

Total Failed Requests Update
	[Documentation]                     CADR-2109:tc10_total_failed_requests_update
	[Tags]                        	    Geolocation Failed Requests
    ${total_requests}=                  Get Text                              ${mon_geoloc_requests_received_value_locator}
    ${failed_requests}=                 Get Text                              ${mon_geoloc_failed_requests_value_locator}
    ${response}=                        Get Request                           geolocation                                       /geolocation/ip/18.0.
    Should Be Equal As Strings          ${response.status_code}			      400
    Sleep                               1 minute
    Reload Page
    Wait Until Element Is Visible       ${mon_geoloc_featured_metrics_locator}    1 minute
    ${total_requests_updated}=          Get Text                              ${mon_geoloc_requests_received_value_locator}
    ${failed_requests_updated}=         Get Text                              ${mon_geoloc_failed_requests_value_locator}
	Should Be True                      ${failed_requests_updated} == ${failed_requests} + ${1.0}
	Should Be True                      ${total_requests_updated} == ${total_requests} + ${1.0}

Geolocation Availability Down
	[Documentation]                     CADR-2101:tc02_Availability parameter_Down
	[Tags]                              Geolocation Availability
    Open Connection                     ${SGW_IP}
    Login                               ${SSH_USER_NAME}                      ${SSH_PASSWORD}
    ${service_status}=                  Execute Command                       /etc/init.d/geolocation status
    Should Contain                      ${service_status}                     geolocation is running
    ${service_status}=                  Execute Command                       /etc/init.d/geolocation stop
    Sleep                               1 minute
    Reload Page
    Wait Until Element Is Visible    	${mon_geoloc_featured_metrics_locator}    1 minute
    ${status}=                          Get Text                              ${mon_geoloc_availability_status_locator}
    Should Be Equal                     ${status}                             Down
    ${service_status}=                  Execute Command                       /etc/init.d/geolocation start
 	Close Connection
 	
 	
*** comment ***
Geolocation HealthCheckStatus Update
	[Documentation]                     CADR-2106:tc07_geoloaction_HealthCheckStatus_update
	[Tags]                              Geolocation HealthCheck
    					sleep    											${WAIT2M}
    					Reload Page
    					Wait Until Element Is Visible    					${FEATURED METRICS} 
    					${initial_status}    								Get Text    						${HEALTHCHECK_STATUS_VALUE}
    					Should Be Equal As Strings    						${initial_status}    				1.0
    					Wait Until Element Is Visible    					${CONFIGURATION_TAB}    			${WAIT60S}
    					Mouse Over    										${CONFIGURATION_TAB}
    					sleep    											${WAIT3S}
    					Click Element    									${SOFTWARE_CONFIGURATION}
    					Wait Until Element Is Visible    					${SEACHANGE_HEADER}    				${WAIT60S}
    					${minusSignExists}    								Element Exists    					${GEOLOCATION_MINUS}
    					Run Keyword If    									${minusSignExists}    				Click Element    						${GEOLOCATION_PLUS_SIGN}
    					Wait Until Element Is Visible    					${MMC_GEOLOCATION_SERVICE}    		${WAIT20S}
    					Click Element    									${MMC_GEOLOCATION_SERVICE}
    					sleep    											${WAIT10S}
    					Wait Until Element Is Visible    					${ACTION_BUTTON}    				${WAIT20S}
    					Mouse Over    										${ACTION_BUTTON}
    					sleep    											${WAIT5S}
    					Wait Until Element Is Visible    					${EDIT}    							${WAIT20S}
    					Click Element    									${EDIT}
    					Wait Until Element Is Visible    					${GEOLOCATION_DB_PATH}    			${WAIT20S}
    					Input Text    										${GEOLOCATION_DB_PATH}    			${DB_INVALID_VALUE}
    					Wait Until Element Is Visible    					${REVIEW_AND_COMMIT}    			${WAIT20S}
						Click Element    									${REVIEW_AND_COMMIT}
    					Comment												Wait Until Element Is Visible    	${CONFIRM_REVIEW}    				${WAIT20S}
    					Comment												Click Element    					${CONFIRM_REVIEW}
    					Comment												Wait Until Element Is Visible    	${COMMIT}    						${WAIT30S}
    					Comment												Click Element    					${COMMIT}
    					Wait Until Element Is Visible    					${INVALID_DBPATH}					${WAIT3M}
    					Wait Until Element Is Visible    					${GEOLOCATION_MINUS}    			${WAIT20S}
    					Click Element    									${GEOLOCATION_MINUS}
    					Mouse Over    										${MONITORING_TAB}
    					sleep    											${WAIT3S}
    					Click Element    									${PHYSICAL_VIEW}
    					Wait Until Element Is Visible    					${FEATURED METRICS}    				${WAIT40S}
    					sleep    											${WAIT3M}
    					Reload Page
    					Wait Until Element Is Visible    					${FEATURED METRICS}    				${WAIT60S}
    					${HEALTHE_CHECK_STATUS}    							Get Text    						${HEALTHCHECK_STATUS_VALUE}
    					Should Be Equal As Strings    						${HEALTHE_CHECK_STATUS}    			0.0
    					sleep    											${WAIT5S}
    					Wait Until Element Is Visible    					${CONFIGURATION_TAB}    			${WAIT60S}
    					Mouse Over    										${CONFIGURATION_TAB}
    					sleep    											${WAIT3S}
    					Click Element    									${SOFTWARE_CONFIGURATION}
    					Wait Until Element Is Visible    					${GEOLOCATION_HEADER}  				${WAIT3M}
    					${minusSignExists}    								Element Exists    					${GEOLOCATION_MINUS}
    					Run Keyword If    									${minusSignExists}    				Click Element    								${GEOLOCATION_PLUS_SIGN}
    					Wait Until Element Is Visible    					${MMC_GEOLOCATION_SERVICE}    		${WAIT20S}
    					Click Element    									${MMC_GEOLOCATION_SERVICE}
    					sleep    											${WAIT10S}
    					Wait Until Element Is Visible    					${ACTION_BUTTON}    				${WAIT20S}
    					Mouse Over    										${ACTION_BUTTON}
    					sleep    											${WAIT5S}
    					Wait Until Element Is Visible    					${EDIT}    							${WAIT20S}
    					Click Element    									${EDIT}
    					Wait Until Element Is Visible    					${GEOLOCATION_DB_PATH}    			${WAIT20S}
    					Input Text    										${GEOLOCATION_DB_PATH}    			${DB_VALID_VALUE}
    					Wait Until Element Is Visible    					${REVIEW_AND_COMMIT}    			${WAIT20S}
    					Click Element    									${REVIEW_AND_COMMIT}
    					Comment												Wait Until Element Is Visible    	${CONFIRM_REVIEW}    				${WAIT20S}
    					Comment												Click Element    					${CONFIRM_REVIEW}
    					Comment												Wait Until Element Is Visible    	${COMMIT}    						${WAIT30S}
    					Comment												Click Element    					${COMMIT}
    					Wait Until Element Is Visible    					${DBPATH}							${WAIT3M}
    					Mouse Over    										${MONITORING_TAB}
    					sleep    											${WAIT3S}
    					Click Element    									${PHYSICAL_VIEW}
    					Wait Until Element Is Visible    					${FEATURED METRICS}    				${WAIT40S}
    					sleep    											${WAIT2M}
    					Reload Page
    					Wait Until Element Is Visible    					${FEATURED METRICS}    				${WAIT60S}
    					
