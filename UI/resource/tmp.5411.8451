*** Settings ***
Documentation    A resource file of xpaths related to MMC.

Resource    ../resource/resource_mmc.robot

*** Variables ***
#***************************** Login Page Elements *****************************
${mmc_login_username_locator}                 xpath=//input[@id="user_user_name"]
${mmc_login_password_locator}                 xpath=//input[@id="user_password"]
${mmc_login_remember_me_locator}              xpath=//input[@id='user_remember_me' and @type='checkbox']
${mmc_login_button_locator}                   xpath=//a[@id='anchor_log_in' and @title='Click To Log In']

#***************************** Logout Elements *****************************
${mmc_logout_adminuser_span}                  xpath=//span[@class='username']
${mmc_logout_link}                            xpath=//a[@id='LogOut']

#**************************** Landing Page Elements ****************************
${mmc_home_adrenalin_logo}                    xpath=//img[@title='Home' and @alt='Adrenalin']
${mmc_home_locator}                           xpath=//div[@class='navbar-brand']/a[@href='/mmc/operational_monitoring/dashboard']
${mmc_dashboard_header_locator}               xpath=//div[@id="header"]//*[@id="dashboard_header"]
${mmc_configurations_locator}                 xpath=//div[@id="enterprise-nav-tab"]//a[@href="/mmc/software_configurations"]/span
${mmc_software_configurations_locator}        xpath=//div[@id="enterprise-nav-tab"]//ul[@class="dropdown-menu"]//a[@href="/mmc/software_configurations"]

#************************ Configurations Page Elements *************************
${mmc_please_wait_locator}                    xpath=//div[text()="Please Wait..."]
${mmc_create_configuration_button_locator}    xpath=//div[@id="box_inside_left_sw_config_loc_tree"]//a[@class="create_config_btn"]

${mmc_tree_unassigned_plus_icon_locator}      xpath=//img[@id='branch_oc_loc_0']
${mmc_tree_seachange_plus_icon_locator}       xpath=//tr[td[div[a[text()='SeaChange']]]]/td/img[@src='/mmc/images/tree/plus0.gif']

${mmc_tree_geoloc_locator}                    xpath=//div[@id="sw_config_loc_tree"]//a[(text()="${GEOLOC_CONFIG_NAME}")]
${mmc_tree_geoloc_plus_icon_locator}          xpath=//div[@id="sw_config_loc_tree"]//a[contains(text(),"GeoLocation")]/ancestor::tr/td/img[@src="/mmc/images/tree/plus0.gif"]
${mmc_tree_geoloc_minus_icon_locator}         xpath=//div[@id="sw_config_loc_tree"]//a[contains(text(),"GeoLocation")]/ancestor::tr/td/img[@src="/mmc/images/tree/minus0.gif"]
${mmc_tree_geoloc_service_locator}            xpath=//div[@class="tafelTree_row"]//a[contains(text(),"Geolocation service")]

${mmc_geoloc_sub_component_locator}           xpath=//span[contains(text(),"Geolocation service")]
${mmc_geoloc_db_path_locator}                 xpath=//fieldset//ol/li//span[@class="text-form-readonly"]
${mmc_GeolocationDataPath_locator}            xpath=//input[@id="GeolocationDataPath"]

${mmc_actions_button_locator}                 xpath=//button[@class="btn blue dropdown-toggle" and contains(., "Actions")]
${mmc_actions_edit_locator}                   xpath=//div[@id="actionDropDown_action1"]//a[@title="Edit"]
${mmc_actions_delete_locator}                 xpath=//div[@id="actionDropDown_action1"]//a[@title="Delete"]

${mmc_host_sgw_chkbox_locator}                xpath=//form[@id="form"]//ol//li//div[@id="main_table_servers"]//table[@id="servers"]//input[@id="chbx_server_2"]

${mmc_commit_button_locator}                  xpath=//div[@class="btnHolderPrimary "]//span[@class="btnInnerSpan"]
${mmc_cancel_button_locator}                  xpath=//div[@class="btnHolderSecondary "]//span[@class="btnInnerSpan"]

${mmc_changes_locator}                        xpath=//div[@id="change_indicator_container"]//th[@title="Action"]
${mmc_changes_new_value_locator}              xpath=//div[@class="divChangeIndicatorTable"]//tr[@id="tr_track_GeolocationDataPath"]/td[3]
${mmc_changes_commit_locator}                 xpath=//form[@id="edit_configuration_form_id"]//fieldset[@style="padding-bottom: 13px"]//span[@class="btnOuterSpan"]//span[@class="btnInnerSpan"]

${dialog_widget_locator}                      xpath=//div[@class="ui-dialog ui-widget ui-widget-content ui-corner-all confirmation_dlg ui-draggable"]
${dialog_ok_button_locator}                   xpath=//div[@class="ui-dialog ui-widget ui-widget-content ui-corner-all confirmation_dlg ui-draggable"]//span[contains(text(),"OK")]
${dialog_cancel_button_locator}               xpath=//div[@class="ui-dialog ui-widget ui-widget-content ui-corner-all confirmation_dlg ui-draggable"]//span[contains(text(),"Cancel")]
${dialog_commit_button_locator}               xpath=//div[@class="ui-dialog ui-widget ui-widget-content ui-corner-all confirmation_dlg ui-draggable"]//span[contains(text(),"Commit")]
${dialog_yes_button_locator}                  xpath=//div[@class="ui-dialog ui-widget ui-widget-content ui-corner-all confirmation_dlg ui-draggable"]//span[contains(text(),"Yes")]

${mmc_tree_ovp_plus_icon_locator}               xpath=//tr[td[div[a[text()='OVP_GATEWAY_AUTOMATION']]]]/td/img[@src='/mmc/images/tree/plus0.gif']
${mmc_tree_ovp_locator}                         xpath=//div[table[tbody[tr[td[div[a[text()='Unassigned']]]]]]]/div/table/tbody/tr/td/div/a[text()='OVP_GATEWAY_AUTOMATION']
${mmc_tree_ovp_gateway_service_lable_locator}   xpath=//div[table[tbody[tr[td[div[a[text()='OVP_GATEWAY_AUTOMATION']]]]]]]/div/table/tbody/tr/td/div/a[text()='ovp-gateway service']

#${mmc_host_sb08b_ovp_chkbox_locator}            xpath=//tr[td[text()='SB08b-OVP01']]/td/input[@type='checkbox']
${mmc_host_jenk_ovp_chkbox_locator}             xpath=//tr[td[text()='jenkovp01']]/td/input[@type='checkbox']

#${mmc_tree_sb08b_ovp_locator}                   xpath=//div[table[tbody[tr[td[div[a[text()='SeaChange']]]]]]]/div/table/tbody/tr/td/div/a[text()='SB08-OVP']
${mmc_tree_jenkins_ovp_locator}                 xpath=//div[table[tbody[tr[td[div[a[text()='SeaChange']]]]]]]/div/table/tbody/tr/td/div/a[text()='OVP']

#${mmc_host_sb08b_ovp_locator}                   xpath=//li[label[text()='Servers assigned to this software configuration']]/div/a[text()='SB08b-OVP01']
${mmc_host_jenk_ovp_locator}                    xpath=//li[label[text()='Servers assigned to this software configuration']]/div/a[text()='jenkovp01']

#**************** Create Software Configuration Window Elements ****************
${dialog_config_name_locator}                 xpath=//div[@id="create_config_dialog_content"]//input[@id="config_name"]
${dialog_component_locator}                   xpath=//div[@id="create_config_dialog_content"]//select[@id="component_id"]
${dialog_version_locator}                     xpath=//div[@id="create_config_dialog_content"]//select[@id="display_version"]
${dialog_geoloc_chkbox_locator}               xpath=//div[@id="service_select_panel"]//td[contains(text(),"Geolocation service")]/preceding-sibling::td/input[@id="services_0"]
${dialog_location_locator}                    xpath=//div[@id="create_config_loc_tree_loc_12" and contains(., "SeaChange")]
${dialog_create_button_locator}               xpath=//div[@id="create_config_dialog_content"]//span[@class="btnOuterSpan"]

${dialog_ovp_chkbox_locator}                  xpath=//tr[td[text()='ovp-gateway service']]/td/input[@type='checkbox']
${dialog_unassigned_location_locator}         xpath=//div[text()='Unassigned']
${dialog_cancel_button1_locator}              xpath=//a[@title='Click To Close Dialog']/span/span[text()='Cancel']

#**************** Monitoring Page Elements ****************
${mon_seachange_plus_locator}                 xpath=//a[text()='Unassigned']/ancestor::div[@class='tafelTree_root']/following-sibling::div//img[@class='tafelTreeopenable' and contains(@src,'plus0.gif')]
${mon_sgw_plus_locator}                       xpath=//a[text()='${SGW_HOSTNAME}']/ancestor::tr//img[@class='tafelTreeopenable' and contains(@src,'plus0.gif')]
${mon_geoloc_plus_locator}                    xpath=//a[text()='Geolocation']/ancestor::tr//img[@class='tafelTreeopenable' and contains(@src,'plus0.gif')]
${mon_geoloc_tab_locator}                     xpath=//a[text()='Geolocation']/ancestor::table/following-sibling::div//a[text()='Geolocation']

${mon_geoloc_featured_metrics_locator}        xpath=//legend[text()='Featured Metrics']
${mon_geoloc_availability_locator}            xpath=//span[text()='Availability']
${mon_geoloc_healthcheck_status_locator}      xpath=//span[text()='Geolocation Healthcheck Status']
${mon_geoloc_requests_received_locator}       xpath=//span[text()='Total Requests received']
${mon_geoloc_failed_requests_locator}         xpath=//span[text()='Total Failed Requests']
${mon_geoloc_successful_requests_locator}     xpath=//span[text()='Total Successful Requests']

${mon_geoloc_availability_status_locator}        xpath=//td[preceding-sibling::td/span[text()='Availability']]/span
${mon_geoloc_requests_received_value_locator}    xpath=//td[preceding-sibling::td/span[text()='Total Requests received']]/span
${mon_geoloc_failed_requests_value_locator}	     xpath=//td[preceding-sibling::td/span[text()='Total Failed Requests']]/span
${mon_geoloc_successful_requests_value_locator}  xpath=//td[preceding-sibling::td/span[text()='Total Successful Requests']]/span
${mon_geoloc_header_locator}                     xpath=//div[text()='Geolocation (Geolocation)']

#**************** Ovp Gateway Monitoring Elements****************
${expand_seachange_sign}                         xpath=//div[@id='myTree']/div[4]/table/tbody/tr/td[1]/img
#${expand_sb08b-ovpgw01_sign}                     xpath=//tr[td[div[a[text()='SB08-OVP01']]]]/td/img[@src='/mmc/images/tree/plus0.gif']
${expand_jenkovp01_sign}                         xpath=//tr[td[div[a[text()='jenkovp01']]]]/td/img[@src='/mmc/images/tree/plus0.gif']
${expand_ovp_gateway_sign}                       xpath=//tr[td[div[a[text()='OVP Gateway']]]]/td/img[@src='/mmc/images/tree/plus0.gif']
${ovp_gateway_label_after_expand}                xpath=//tr[td[3][img[@src='/mmc/images/tree/minus0.gif']]]/td/div/a[contains(text(),'OVP Gateway')]
${ovp_gateway_under_ovp_gateway_label}           xpath=//tr[td[3][img[@src='/mmc/images/tree/line1.gif']]]/td/div/a[contains(text(),'OVP Gateway')]
${ovp_rhq-agent_label}                           xpath=//a[text()='RHQ Agent']
${ovp_availability_parameter}                    xpath=//tr[@id='tr_FeaturedMetrics_avail']
${ovp_total_failed_requests_parameter}           xpath=//span[text()='Total Failed Requests']
${ovp_total_rejected_requests_parameter}         xpath=//span[text()='Total Rejected Requests']
${ovp_total_requests_received_parameter}         xpath=//span[text()='Total Requests received']
${ovp_total_successful_requests_parameter}       xpath=//span[text()='Total Successful Requests']
${ovp_availability_status}                       xpath=//span[@id='fc_value_avail']
${ovp_total_failed_requests_value}               xpath=//tr[contains(@id,'tr_FeaturedMetrics')][td[span[text()='Total Failed Requests']]]/td/span[contains(@id,'fc_value')]
${ovp_total_rejected_requests_value}             xpath=//tr[contains(@id,'tr_FeaturedMetrics')][td[span[text()='Total Rejected Requests']]]/td/span[contains(@id,'fc_value')]
${ovp_total_requests_received_value}             xpath=//tr[contains(@id,'tr_FeaturedMetrics')][td[span[text()='Total Requests received']]]/td/span[contains(@id,'fc_value')]
${ovp_total_successful_requests_value}           xpath=//tr[contains(@id,'tr_FeaturedMetrics')][td[span[text()='Total Successful Requests']]]/td/span[contains(@id,'fc_value')]

#****************************** Ovp Gateway Configuration Page Elements *******************************
${mmc_ovp_add_tenant_button_locator}                        xpath=//span[text()='Add Service Provider Configuration']
${mmc_ovp_tenant_id_textbox_locator}                        xpath=//input[@id='TenantID']
${mmc_ovp_sgw_url_textbox_locator}                          xpath=//input[@id='SecureGatewayURL']
${mmc_ovp_location_rule_dropdown_locator}                   xpath=//select[@id='LocationRule']
${mmc_ovp_continue_button_locator}                          xpath=//div[@id='close_button']/div[contains(@class,'btnHolderPrimary')]/a/span/span[text()='Continue']
${mmc_ovp_cancel_button_locator}                            xpath=//div[@id='close_button']/div[contains(@class,'btnHolderSecondary')]/a/span/span[text()='Cancel']
${mmc_ovp_sgw_url_textbox_locator}                          xpath=//input[@id='SecureGatewayURL']
${mmc_ovp_location_rule_dropdown_locator}                   xpath=//select[@id='LocationRule']
${mmc_ovp_cache_expiration_textbox_locator}                 xpath=//input[@id='Cache_expiration']
${mmc_ovp_compress_responses_dropdown_locator}              xpath=//select[@id='Compress_responses']
${mmc_ovp_default_pagesize_textbox_locator}                 xpath=//input[@id='Default_Page_Size']
${mmc_ovp_default_language_filter_textbox_locator}          xpath=//input[@id='Default_Language_Filter']
${mmc_ovp_add_private_claim_locator}                        xpath=//span[text()='Add Private Claim']
${mmc_ovp_private_claim_dropdown_locator}                   xpath=//select[@id='Private_Claim']
${mmc_ovp_request_timeout_textbox_locator}                  xpath=//input[@id='Request_timeout']
${mmc_ovp_enable_response_cache_checkbox_locator}           xpath=//input[@id='Enable_Response_Cache']
${mmc_ovp_cache_expiration_textbox_locator}                 xpath=//input[@id='Cache_expiration']
${mmc_ovp_shared_secret_textbox_locator}                    xpath=//input[@id='Shared_Secret']
${mmc_ovp_geolocation_service_url_textbox_locator}          xpath=//input[@id='Geolocation_Service_URL']
${mmc_ovp_all_countries_file_path_textbox_locator}          xpath=//input[@id='All_Countries_File_Path']
${mmc_ovp_picture_api_proxy_server_url_textbox_locator}     xpath=//input[@id='Picture_API_Proxy_Server_URL']

${mmc_ovp_tenant_table_mandatory_message_locator}                   xpath=//div[@id='TenantParametersList_tablevalidate']
${mmc_ovp_shared_secret_mandatory_message_locator}                  xpath=//div[@id='Shared_Secret_validate']
${mmc_ovp_private_claims_mandatory_message_locator}                 xpath=//div[@id='PrivateClaimsList_tablevalidate']
${mmc_ovp_geolocation_claims_mandatory_message_locator}             xpath=//div[@id='Geolocation_Service_URL_validate']
${mmc_ovp_all_countries_file_path_mandatory_message_locator}        xpath=//div[@id='All_Countries_File_Path_validate']
${mmc_ovp_picture_api_proxy_mandatory_message_locator}              xpath=//div[@id='Picture_API_Proxy_Server_URL_validate']

${mmc_ovp_tenant_id_invalid_message_locator}                        xpath=//span[@id='TenantID_validate_regexptext']
${mmc_ovp_sgw_url_invalid_message_locator}                          xpath=//span[@id='SecureGatewayURL_validate_url']
${mmc_ovp_request_timeout_invalid_message_locator}                  xpath=//span[@id='Request_timeout_validate_integer']
${mmc_ovp_cache_expiration_invalid_message_locator}                 xpath=//span[@id='Cache_expiration_validate_integer']
${mmc_ovp_shared_secret_invalid_message_locator}                    xpath=//span[@id='Shared_Secret_validate_regexptext']
${mmc_ovp_token_source_invalid_message_locator}                     xpath=//span[@id='Expected_token_source_validate_url']
${mmc_ovp_token_audience_invalid_message_locator}                   xpath=//span[@id='Token_audience_validate_url'] 
${mmc_ovp_default_page_size_invalid_message_locator}                xpath=//span[@id='Default_Page_Size_validate_range_-2147483648_2147483647']
${mmc_ovp_geolocation_service_url_invalid_message_locator}          xpath=//span[@id='Geolocation_Service_URL_validate_url']
${mmc_ovp_picture_api_proxy_server_url_invalid_message_locator}     xpath=//span[@id='Picture_API_Proxy_Server_URL_validate_url']
${mmc_ovp_error_message_details_locator}                            xpath=//span[@id='error-message-details']

#****************************** Ovp Gateway Log Viewer Page Elements *******************************
${mmc_adv_search_btn_locator}                                       xpath=//span[@class='advanced_search_btn']
${mmc_adv_search_search_btn_locator}                                xpath=//a[@id='anchor_']/span/span[text()='Search']
${mmc_log_viewer_adv_search_start_time_textbox_locator}             xpath=//input[@id='search_start_time']
${mmc_log_viewer_adv_search_current_date_locator}                   xpath=//a[contains(@class,'ui-state-highlight')]
${mmc_log_viewer_adv_search_end_time_textbox_locator}               xpath=//input[@id='search_end_time']
${mmc_log_viewer_adv_search_time_done_btn_locator}                  xpath=//button[@id='text_close']
${mmc_log_viewer_adv_search_hour_slider_locator}                    xpath=//div[@id='hourSlider']/a
${mmc_log_viewer_adv_search_minute_slider_locator}                  xpath=//div[@id='minuteSlider']/a
${mmc_log_viewer_adv_search_component_textbox_locator}              xpath=//input[@id='search_component']
${mmc_log_viewer_adv_search_server_textbox_locator}                 xpath=//input[@id='search_server']
${mmc_log_viewer_adv_search_message_textbox_locator}                xpath=//input[@id='search_message']
${mmc_log_viewer_table_header_DateTime_locator}                     xpath=//th[text()='Date/Time']

#****************************** Ovp Gateway Alerts Page Elements *******************************
${mmc_alert_def_adv_alert_search_textbox_locator}                   xpath=//input[@id='search_term_jQuery_table_alert_def']
${mmc_alert_def_save_button_locator}                                xpath=//span[text()='Save Changes']

${mmc_alert_def_jwe_enabled_locator}                                xpath=//table[thead[tr[th[1][text()='Status']]]]/tbody/tr/td[1][text()='Enabled']
${mmc_alert_def_jwe_disabled_locator}                               xpath=//table[thead[tr[th[1][text()='Status']]]]/tbody/tr/td[1][text()='Disabled']
${mmc_alert_def_jwe_subcomponent_locator}                           xpath=//table[thead[tr[th[2][text()='Subcomponent']]]]/tbody/tr/td[2][text()='OVP Gateway Configuration']
${mmc_alert_def_jwe_name_locator}                                   xpath=//table[thead[tr[th[3][text()='Name']]]]/tbody/tr/td[3]/a[text()='JWE Authentication Failure']
${mmc_alert_def_jwe_description_locator}                            xpath=//table[thead[tr[th[4][text()='Description']]]]/tbody/tr/td[4][text()='JWE Authentication Failure']

${mmc_alert_def_sgw_url_enabled_locator}                            xpath=//table[thead[tr[th[1][text()='Status']]]]/tbody/tr/td[1][text()='Enabled']
${mmc_alert_def_sgw_url_disabled_locator}                           xpath=//table[thead[tr[th[1][text()='Status']]]]/tbody/tr/td[1][text()='Disabled']
${mmc_alert_def_sgw_url_subcomponent_locator}                       xpath=//table[thead[tr[th[2][text()='Subcomponent']]]]/tbody/tr/td[2][text()='Linux']
${mmc_alert_def_sgw_url_name_locator}                               xpath=//table[thead[tr[th[3][text()='Name']]]]/tbody/tr/td[3]/a[text()='Secure Gateway URL Not Accessible']
${mmc_alert_def_sgw_url_description_locator}                        xpath=//table[thead[tr[th[4][text()='Description']]]]/tbody/tr/td[4][text()='Secure Gateway URL Not Accessible']

${mmc_alert_def_jwe_edit_link_locator}                              xpath=//tr[td[text()='JWE Authentication Failure']]/td/a[text()='Edit']
${mmc_alert_def_sgw_url_edit_link_locator}                          xpath=//tr[td[text()='Secure Gateway URL Not Accessible']]/td/a[text()='Edit']

${mmc_alert_def_jwe_status_dropdown_locator}                        xpath=//ol[li[div[input[@value='JWE Authentication Failure']]]]/li/select[@id='status']
${mmc_alert_def_sgw_url_status_dropdown_locator}                    xpath=//ol[li[div[input[@value='Secure Gateway URL Not Accessible']]]]/li/select[@id='status']


#****************************** Geolocation Service Alerts Page Elements *******************************

${mmc_alert_def_geo_subcomponent_locator}                           xpath=//table[thead[tr[th[2][text()='Subcomponent']]]]/tbody/tr/td[2][text()='Secure Gateway-Geofencing Plug-in']
${mmc_alert_def_geo_name_locator}                                   xpath=//table[thead[tr[th[3][text()='Name']]]]/tbody/tr/td[3]/a[text()='Geolocation Service Not Accessible']
${mmc_alert_def_geo_description_locator}                            xpath=//table[thead[tr[th[4][text()='Description']]]]/tbody/tr/td[4][text()='Geolocation Service Not Accessible']

${mmc_alert_def_geo_edit_link_locator}                              xpath=//tr[td[text()='Geolocation Service Not Accessible']]/td/a[text()='Edit']
${mmc_alert_def_geo_status_dropdown_locator}                        xpath=//ol[li[div[input[@value='Geolocation Service Not Accessible']]]]/li/select[@id='status']

${mmc_alert_def_geo_enabled_locator}                                xpath=//table[thead[tr[th[1][text()='Status']]]]/tbody/tr/td[1][text()='Enabled']
${mmc_alert_def_geo_disabled_locator}                               xpath=//table[thead[tr[th[1][text()='Status']]]]/tbody/tr/td[1][text()='Disabled']


