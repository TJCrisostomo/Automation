*** Settings ***
Documentation    A test suite for testing the Login Page of Rave Tenant Portal.
...				     \n* Verify Login Page Elements
...                  \n* Valid Login
...				     \n* Verify Landing Page Elements

Resource    ../resource/resource_tenant_portal.robot
Library     String

Suite Setup       Open Rave Tenant Portal
Suite Teardown    Close All Browsers 

*** Variables ***
#*********************************** Inputs ************************************
${username}    tenant1
${password}    admin@123

#************************* Landing Page Text Displays **************************
${nav_bar_user}    User    # User will be replaced by logged-in username

*** Test Cases ***
Valid Login
	[Tags]                      In_Progress                 #Login
	[Documentation]             CADR-2765:Valid Login
	${top_menu_login_name}=     Login Rave Tenant Portal    ${username}
	Set Suite Variable          ${top_menu_login_name}
	${nav_bar_user}=            Replace String              ${nav_bar_user}    User    ${top_menu_login_name}
	Set Suite Variable          ${nav_bar_user}

*** the following variables are not used for now ***
#************************** Login Page Text Displays ***************************
${login_form_title}         Login to your account
${login_username}           Username
${login_password}           Password
${login_button}             Log in
${login_forget_password}    Forgot your password ?
${login_reset_password}     Click here to reset your password.
${login_copyright}          2016 © SeaChange - Rave Tenant Portal

#************************* Landing Page Text Displays **************************
${nav_bar_header}             Rave Tenant Portal
${nav_bar_home}               Home
${nav_bar_helpdesk}           Helpdesk
${nav_bar_reporting}          Reporting
${nav_bar_billing}            Billing
${top_menu_login_name}        User             # will be replaced by logged-in username     
${top_menu_logout}            Log out
${breadcrumb_portal}          Portal
${breadcrumb_home}            Home
${content_caption}            Welcome User!    # User will be replaced by logged-in username
${prefooter_p}                Our vision is to provide transformative and monetizable personalized video experiences in the home and everywhere, any time on any device through innovative software.
${prefooter_submit_email}     mail@email.com
${prefooter_submit}           SUBMIT
${prefooter_phone}            Phone: +1.978.889.3064
${prefooter_contact_email}    rave@schange.com
${footer_rights}              2016 © Seachange. All Rights Reserved.

*** do not run these test cases for now ***
Verify Login Page Elements
	[Tags]                            In_Progress                      #Login
	[Documentation]                   CADR-2764:Login Page Elements
	${login_form_title_text}=         Get Text                         ${login_form_title_locator}
	Should Be Equal As Strings        ${login_form_title_text}         ${login_form_title}
	${username_text}=                 Get Element Attribute            ${login_username_locator}@placeholder
	Should Be Equal As Strings        ${username_text}                 ${login_username}
	${login_password_text}=           Get Element Attribute            ${login_password_locator}@placeholder
	Should Be Equal As Strings        ${login_password_text}           ${login_password}
	${login_button_text}=             Get Text                         ${login_button_locator}
	Should Be Equal As Strings        ${login_button_text}             ${login_button}
	${login_forget_password_text}=    Get Text                         ${login_forget_password_locator}
	Should Be Equal As Strings        ${login_forget_password_text}    ${login_forget_password}
	${login_reset_password_text}=     Get Text                         ${login_reset_password_locator}
	Should Be Equal As Strings        ${login_reset_password_text}     ${login_reset_password}
	${login_copyright_text}=          Get Text                         ${login_copyright_locator}
	Should Be Equal As Strings        ${login_copyright_text}          ${login_copyright}
	Capture Page Screenshot           Rave_Tenant_Portal_Login_Page.png
	
Verify Landing Page Elements	
	[Tags]                              In_Progress                        #Login
	[Documentation]                     CADR-2766:Landing Page Elements
	# Page Header
	${nav_bar_header_text}=             Get Text                           ${nav_bar_header_locator}
	Should Be Equal As Strings          ${nav_bar_header_text}             ${nav_bar_header}
	${nav_bar_home_text}=               Get Text                           ${nav_bar_home_locator}
	Should Be Equal As Strings          ${nav_bar_home_text}               ${nav_bar_home}
	${nav_bar_helpdesk_text}=           Get Text                           ${nav_bar_helpdesk_locator}
	Should Be Equal As Strings          ${nav_bar_helpdesk_text}           ${nav_bar_helpdesk}
	${nav_bar_reporting_text}=          Get Text                           ${nav_bar_reporting_locator}
	Should Be Equal As Strings          ${nav_bar_reporting_text}          ${nav_bar_reporting}
	${top_menu_login_name_text}=        Get Text                           ${top_menu_login_name_locator}
	Should Be Equal As Strings          ${top_menu_login_name_text}        ${top_menu_login_name}
	${top_menu_logout_text}=            Get Text                           ${top_menu_logout_locator}
	Should Be Equal As Strings          ${top_menu_logout_text}            ${top_menu_logout}
	# Breadcrumb
	${breadcrumb_portal_text}=          Get Text                           ${breadcrumb_portal_locator}
	Should Be Equal As Strings          ${breadcrumb_portal_text}          ${breadcrumb_portal}
	${breadcrumb_home_text}=            Get Text                           ${breadcrumb_home_locator}
	Should Be Equal As Strings          ${breadcrumb_home_text}            ${breadcrumb_home}
	# Container
	${content_caption_text}=            Get Text                           ${content_caption_locator}
	Should Be Equal As Strings          ${content_caption_text}            ${content_caption}
	# Prefooter
	Page Should Contain Element         ${prefooter_about_locator}
	${prefooter_p_text}=                Get Text                           ${prefooter_p_locator}
	Should Be Equal As Strings          ${prefooter_p_text}                ${prefooter_p}
	Page Should Contain Element         ${prefooter_subscribe_locator}
	${prefooter_submit_email_text}=     Get Element Attribute              ${prefooter_email_locator}@placeholder
	Should Be Equal As Strings          ${prefooter_submit_email_text}     ${prefooter_submit_email}
	${prefooter_submit_text}=           Get Text                           ${prefooter_submit_locator}
	Should Be Equal As Strings          ${prefooter_submit_text}           ${prefooter_submit}
	Page Should Contain Element         ${prefooter_follow_locator}
	Page Should Contain Element         ${prefooter_facebook_locator}
	Page Should Contain Element         ${prefooter_twitter_locator}
	Page Should Contain Element         ${prefooter_linkedin_locator}
	Page Should Contain Element         ${prefooter_youtube_locator}
	Page Should Contain Element         ${prefooter_contacts_locator}
	Element Should Contain              ${prefooter_address_locator}       ${prefooter_phone}
	Element Should Contain              ${prefooter_address_locator}       Email:
	${prefooter_contact_email_text}=    Get Text                           ${prefooter_contact_email_locator}
	Should Be Equal As Strings          ${prefooter_contact_email_text}    ${prefooter_contact_email}
	# Footer
	${footer_rights_text}=              Get Text                           ${footer_rights_locator}
	Should Be Equal As Strings          ${footer_rights_text}              ${footer_rights}
	${footer_chevron_up_text}=          Get Element Attribute              ${footer_chevron_up_locator}@title
	Should Be Equal As Strings          ${footer_chevron_up_text}          Go to top 
