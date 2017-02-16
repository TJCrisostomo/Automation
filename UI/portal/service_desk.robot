*** Settings ***
Documentation    A test suite for testing Service Desk of Rave Tenant Portal.
...				     \n* Verify Login Page Elements
...                  \n* Valid Login
...				     \n* Verify Landing Page Elements


Library     String
Library     DateTime
Resource    ../resource/resource_portal.robot


Suite Setup       Run Keywords          Open Rave Portal    Login Rave Portal    
Suite Teardown    Close All Browsers
Force Tags        In Progress

*** Variables ***
#************************ New Ticket Text Displays *************************
${panel_body_text}					All fields are required. Please provide as descriptive a title and description as possible for all fields.
${attached_file_help_text}			You can attach a file such as a document or screenshot to this ticket.
${priority_text}					Please select a priority carefully.				
${description_text}					Please be as descriptive as possible, including any details we may need to address your query.			
${required_field_error_message_text}	This field is required.	
${file_location}					/home/vagrant/data/coffee.png
${issue_summary_text}				Issue Summary Test										
${service_request_summary_text}		Service Request Summary Test
${issue_details_text}				Issue Details Test...Issue Details Test...Issue Details Test...Issue Details Test...								
${service_request_details_text}		Service Request Details Test....Service Request Details Test...Service Request Details Test
${service_request_followup_text}	Follow up on this Service Request
${issue_followup}					Follow up on this Issue
${ticket_respond_to_email_label_text}	Your reply will be sent to
${ticket_respond_header_text}		Respond to this ticket
${comment_input_box_label_text}		Comment	 	
#************************ My Ticket Text Displays *************************
${filter_by_title_display_text}			Filter by Title...		
${filter_by_category_display_text}		Filter by Category...
${filter_by_priority_display_text}		Select Priority
${filter_by_status_display_text}		Select Status
${filter_by_created_date_display_text}	Filter by Created Date...
${filter_by_submitter_display_text}		Filter by Submitter...
${filter_by_category_issue_text}		Issue
${filter_by_category_service_request_text}	Service Request	

#**************************** Table Column Number ******************************
${col_number_ticket#}       1
${col_number_title}		    2
${col_number_category}      3
${col_number_priority}      4
${col_number_status}        5
${col_number_created}		6
${col_number_submitter}		7

#******************** Creation Date Custom Range Interval **********************
${date_interval_start}    0
${date_interval_end}     90

#******************** Active Filter Label**********************
${active_label_title_text}			Title: 		
${active_label_category_text}		Category: 
${active_label_priority_text}		Priority: 
${active_label_status_text}			Status: 
${active_label_created_text}		Created: 
${active_label_submitter_text}		Submitter: 



#******************** Submitter **********************
${submitter_input_text}		Tenant 1		

*** Test Cases ***
 Service Desk Page Elements Validation
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2804:Service Desk Page Element Validation
	Wait Until Element Is Visible		${nav_bar_serviceDesk_locator} 
    Wait Until Element Is Enabled		${nav_bar_serviceDesk_locator}
    Click Element						${nav_bar_serviceDesk_locator}
    Element Should Contain				${home_breadcrumb_locator}			Home		
    Element Should Contain				${service_desk_breadcrumb_locator}		Service Desk
    Page Should Contain Element  		${sidemenu_ticket_expanded_locator}
    Page Should Contain Element			${sidemenu_new_tickets_locator}
    Page Should Contain Element  		${sidemenu_my_tickets_locator}	
    Page Should Contain Element			${sidemenu_knowledgebase_collapsed_locator}	
 	Click Element						${sidemenu_knowledgebase_collapsed_locator}	
 	Page Should Contain Element			${sidemenu_knowledgebase_expanded_locator}
 	Page Should Contain Element			${sidemenu_ticket_collapsed_locator}	
 	Page Should Contain Element			${sidemenu_categories_locator}
 
 
 Submit Ticket Page Elements Validation 
  	[Tags]                           	Service Desk   
	[Documentation]                  	CADR-2811: Submit Ticket Page Elements Validation
	Click Element						${nav_bar_serviceDesk_locator}
	#Click Element						${sidemenu_ticket_collapsed_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}					New Ticket
	Element Should Contain				${new_ticket_page_title_locator}				SUBMIT A TICKET
	Element Should Contain				${new_ticket_panel_title_locator}				New Ticket
	Element Should Contain				${new_ticket_panel_body_locator}				${panel_body_text}			
	Element Should Contain				${new_ticket_category_control_label_locator}				Category				
	Page Should Contain Element			${new_ticket_category_drop_down_locator}
	Element Should Contain				${new_ticket_issue_summary_control_label_locator}			Summary of your query		
	Page Should Contain Element			${new_ticket_issue_summary_input_box_locator}
	Element Should Contain				${new_ticket_issue_description_control_label_locator} 		Description of your issue
	Page Should Contain Element			${issue_description_input_box_locator}			
	Element Should Contain				${new_ticket_issue_description_help_locator}				${description_text}								
	Page Should Contain Element			${new_ticket_priority_drop_down_locator}						
	Element Should Contain				${new_ticket_priority_control_label_locator}				Urgency
	Element Should Contain				${new_ticket_priority_help_locator}						${priority_text}
	Page Should Contain Element			${new_ticket_attached_file_button_locator}		
	Element Should Contain				${new_ticket_attached_file_control_label_locator}			Attach File		
	Element Should Contain				${new_ticket_attached_file_help_locator}					${attached_file_help_text}					
	Page Should Contain Element			${new_ticket_submit_button_locator}							

 
 My Tickets Page Elements Validation
 	[Tags]                           	Service Desk   
	[Documentation]                  	CADR-2812:My Ticket Page Element Validation
 	Click Element						${nav_bar_serviceDesk_locator}
 	Click Element						${sidemenu_my_tickets_locator}
 	Element Should Contain				${active_breadcrumb_locator}		My Tickets
	Element Should Contain				${my_ticket_Page_title_locator}		Tickets
	${filter_by}=		                Get Element Attribute               ${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings       	${filter_by_title_display_text}   	${filter_by}
	Element Should Contain           	${my_ticket_table_label_locator}	Show
	Element Should Contain           	${my_ticket_table_label_locator}    entries
 	Table Header Should Contain			${my_tickets_table_locator}			Ticket #
	Table Header Should Contain			${my_tickets_table_locator}			Title 					
	Table Header Should Contain 		${my_tickets_table_locator}			Category
	Table Header Should Contain 		${my_tickets_table_locator}			Priority					
	Table Header Should Contain 		${my_tickets_table_locator}			Status					
	Table Header Should Contain 		${my_tickets_table_locator}			Created					
	Table Header Should Contain 		${my_tickets_table_locator}			Submitter				
	Page Should Contain Element			${my_tickets_first_page_locator}
	Page Should Contain Element			${my_tickets_previous_page_locator}
	Page Should Contain Element			${my_tickets_next_page_locator}
	Page Should Contain Element			${my_tickets_last_page_locator}
	${table_info}=						Get Text							${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Ticket Available
	Element Should Contain				${my_tickets_table_info_col_locator}	Showing
	Element Should Contain				${my_tickets_table_info_col_locator}	to
	Element Should Contain				${my_tickets_table_info_col_locator}	of
	Element Should Contain				${my_tickets_table_info_col_locator}	Items


 Submit Ticket Page All Required Field Blanks 
 	[Tags]                           	Service Desk   
	[Documentation]                  	CADR-2813:Submit Ticket Page All Required Field Blanks
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_submit_button_locator}
	Element Should Contain				${new_ticket_category_error_validation_locator}				${required_field_error_message_text}
	Element Should Contain				${new_ticket_issue_summary_error_validation_locator}		${required_field_error_message_text}
	Element Should Contain				${new_ticket_issue_description_error_validation_locator}	${required_field_error_message_text}

 Submit Ticket No Category 
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2814:Submit Ticket No Category 
	Click Element						${sidemenu_new_tickets_locator}
	Input Text 							${new_ticket_issue_summary_input_box_locator}		Test
	Input Text 							${issue_description_input_box_locator}				Test Description
	Select From List By Value			${new_ticket_priority_drop_down_locator}			1
	Choose File							${new_ticket_attached_file_button_locator}			${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Element Should Contain				${new_ticket_category_error_validation_locator}		${required_field_error_message_text}
	
 Submit Issue No Title 
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2815:Submit Issue No Title
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}				1	
	Input Text 							${issue_description_input_box_locator}					Test Description
	Select From List By Value			${new_ticket_priority_drop_down_locator}				1
	Choose File							${new_ticket_attached_file_button_locator}				${file_location}						
	Click Element						${new_ticket_submit_button_locator}
	Element Should Contain				${new_ticket_issue_summary_error_validation_locator}	${required_field_error_message_text}


 Submit ServiceRequest No Title 
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2816:Submit ServiceRequest No Title 
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}				2	
	Input Text 							${issue_description_input_box_locator}					Test Description
	Select From List By Value			${new_ticket_priority_drop_down_locator}				2
	Choose File							${new_ticket_attached_file_button_locator}				${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Element Should Contain				${new_ticket_issue_summary_error_validation_locator}	${required_field_error_message_text}		

 Submit Issue No Description 
  	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2817:Submit Issue No Description 
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}					1	
	Input Text 							${new_ticket_issue_summary_input_box_locator}				Test Title
	Select From List By Value			${new_ticket_priority_drop_down_locator}					3
	Choose File							${new_ticket_attached_file_button_locator}					${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Element Should Contain				${new_ticket_issue_description_error_validation_locator}	${required_field_error_message_text}	

 Submit ServiceRequest No Description 
  	[Tags]                           	Service Desk    
	[Documentation]                  	CCADR-2818:Submit ServiceRequest No Description
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}					2	
	Input Text 							${new_ticket_issue_summary_input_box_locator}				Test Title
	Select From List By Value			${new_ticket_priority_drop_down_locator}					4
	Choose File							${new_ticket_attached_file_button_locator}					${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Element Should Contain				${new_ticket_issue_description_error_validation_locator}	${required_field_error_message_text}

 Submit ServiceRequest with attachment Critical Priority
   	[Tags]                           	Service Desk		Create Ticket    
	[Documentation]                  	CADR-2819:Submit ServiceRequest with attachment Critical Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}			2	
	Input Text 							${new_ticket_issue_summary_input_box_locator}		${service_request_summary_text}
	Input Text 							${issue_description_input_box_locator}				${service_request_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}						1
	Choose File							${new_ticket_attached_file_button_locator}			${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}						${service_request_summary_text}
	${ticket_header_text}=				Get Text											${ticket_header_locator}
	Should Contain						${ticket_header_text}								${service_request_summary_text}
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}								${service_request_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}					${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}			${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}			${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}					${service_request_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}
	
Submit ServiceRequest with attachment High Priority
   	[Tags]                           	Service Desk		Create Ticket    
	[Documentation]                  	CADR-2820:Submit ServiceRequest with attachment High Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}			2	
	Input Text 							${new_ticket_issue_summary_input_box_locator}		${service_request_summary_text}
	Input Text 							${issue_description_input_box_locator}				${service_request_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}			2
	Choose File							${new_ticket_attached_file_button_locator}			${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}						${service_request_summary_text}
	${ticket_header_text}=				Get Text											${ticket_header_locator}
	Should Contain						${ticket_header_text}								${service_request_summary_text}
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}								${service_request_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}					${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}			${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}			${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}					${service_request_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}									
	
Submit ServiceRequest with attachment Normal Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2821:Submit ServiceRequest with attachment Normal Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}			2	
	Input Text 							${new_ticket_issue_summary_input_box_locator}		${service_request_summary_text}
	Input Text 							${issue_description_input_box_locator}				${service_request_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}			3
	Choose File							${new_ticket_attached_file_button_locator}			${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}						${service_request_summary_text}
	${ticket_header_text}=				Get Text											${ticket_header_locator}
	Should Contain						${ticket_header_text}								${service_request_summary_text}
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}								${service_request_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}					${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}			${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}			${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}					${service_request_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}									
	
Submit ServiceRequest with attachment Low Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2822:Submit ServiceRequest with attachment Low Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}			2	
	Input Text 							${new_ticket_issue_summary_input_box_locator}		${service_request_summary_text}
	Input Text 							${issue_description_input_box_locator}				${service_request_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}			4
	Choose File							${new_ticket_attached_file_button_locator}			${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}						${service_request_summary_text}
	${ticket_header_text}=				Get Text											${ticket_header_locator}
	Should Contain						${ticket_header_text}								${service_request_summary_text}
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}								${service_request_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}					${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}			${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}			${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}					${service_request_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}									
	

 Submit Issue with attachment Critical Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2823:Submit Issue with attachment Critical Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}			1	
	Input Text 							${new_ticket_issue_summary_input_box_locator}		${issue_summary_text}
	Input Text 							${issue_description_input_box_locator}				${issue_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}			1
	Choose File							${new_ticket_attached_file_button_locator}			${file_location}
	Click Element						${new_ticket_submit_button_locator}
 	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}						${issue_summary_text}	
	${ticket_header_text}=				Get Text											${ticket_header_locator}
	Should Contain						${ticket_header_text}								${issue_summary_text}	
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}								${issue_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}					${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}			${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}			${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}					${issue_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}									
	
Submit Issue with attachment High Priority			
   	[Tags]                           	Service Desk		Create Ticket    
	[Documentation]						CADR-2824:Submit Issue with attachment High Priority  
	Click Element						${nav_bar_serviceDesk_locator}                	
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}		1	
	Input Text 							${new_ticket_issue_summary_input_box_locator}	${issue_summary_text}
	Input Text 							${issue_description_input_box_locator}			${issue_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}		2
	Choose File							${new_ticket_attached_file_button_locator}		${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}					${issue_summary_text}	
	${ticket_header_text}=				Get Text										${ticket_header_locator}
	Should Contain						${ticket_header_text}							${issue_summary_text}	
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}							${issue_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}				${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}		${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}		${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}				${issue_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}									
	
Submit Issue with attachment Normal Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2825:Submit Issue with attachment Normal Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}		1	
	Input Text 							${new_ticket_issue_summary_input_box_locator}	${issue_summary_text}
	Input Text 							${issue_description_input_box_locator}			${issue_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}		3
	Choose File							${new_ticket_attached_file_button_locator}		${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}					${issue_summary_text}	
	${ticket_header_text}=				Get Text										${ticket_header_locator}
	Should Contain						${ticket_header_text}							${issue_summary_text}	
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}							${issue_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}				${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}		${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}		${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}				${issue_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}									
	
Submit Issue with attachment Low Priority
   	[Tags]                           	Service Desk 			Create Ticket   
	[Documentation]                  	CADR-2826:Submit Issue with attachment Low Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_new_tickets_locator}
	Click Element						${new_ticket_category_drop_down_locator}
	Select From List By Value			${new_ticket_category_drop_down_locator}		1	
	Input Text 							${new_ticket_issue_summary_input_box_locator}	${issue_summary_text}
	Input Text 							${issue_description_input_box_locator}			${issue_details_text}
	Select From List By Value			${new_ticket_priority_drop_down_locator}		4
	Choose File							${new_ticket_attached_file_button_locator}		${file_location}
	Click Element						${new_ticket_submit_button_locator}
	Wait Until Page Contains Element	${ticket_header_locator}
	Element Should Contain				${active_breadcrumb_locator}					${issue_summary_text}	
	${ticket_header_text}=				Get Text										${ticket_header_locator}
	Should Contain						${ticket_header_text}							${issue_summary_text}	
 	Page Should Contain Element			${ticket_attachment_locator}
 	Select Frame						${ticket_body_frame_locator}	
 	Element Should Contain				${ticket_body_locator}							${issue_details_text}
 	Unselect Frame						
 	Element Should Contain				${ticket_respond_header_locator}				${ticket_respond_header_text}							
	Element Should Contain				${ticket_respond_to_email_label_locator}		${ticket_respond_to_email_label_text}
	Page Should Contain Element			${ticket_respond_to_email_input_box_locator}
	Element Should Contain				${ticket_comment_input_box_label_locator}		${comment_input_box_label_text}
	Select Frame						${ticket_comment_iframe_locator}
	Element Should Contain				${ticket_comment_auto_body_locator}				${issue_details_text}
	Unselect Frame
	Page Should Contain Element			${ticket_comment_attached_file_locator}
	Page Should Contain Element			${ticket_add_follow_up_locator}
	
Filter MyTickets By Title
 	[Tags]                           	Service Desk			    
	[Documentation]                  	CADR-2836:FilterMyTicketsByTitle								
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_title_locator}
	${filter_by}=		                Get Element Attribute               		${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings       	${filter_by_title_display_text}   			${filter_by}
	Input text							${my_tickets_filter_by_locator}				${issue_summary_text}				
	Press Key                        	${my_tickets_filter_by_locator}          	\\13                  #ENTER key
	Sleep                               2s
	Element Should Contain				${my_ticket_active_filter_locator}			${active_label_title_text} ${issue_summary_text}					
	${table_info}						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available																	
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page               				${number_items}			${my_tickets_table_length_locator}
	:FOR       ${page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page}=					Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${issue_summary_text}		${my_tickets_table_locator}		${col_number_title}		
	\  Check State of Page Navigation Buttons		${current_page}		${last_page}		${my_tickets_table_pages_locator}		${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}		${my_tickets_next_page_locator}		${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep                            1s


Filter My Tickets By Category Issue
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2837:FilterMyTicketsByCategoryIssue
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_category_locator}
	${filter_by}=		                Get Element Attribute               		${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings       	${filter_by_category_display_text}   		${filter_by}				
	Input text							${my_tickets_filter_by_locator}				${filter_by_category_issue_text}
	Press Key                        	${my_tickets_filter_by_locator}          	\\13 
	Sleep                               2s
	Element Should Contain				${my_ticket_active_filter_locator}			${active_label_category_text} ${filter_by_category_issue_text} 																	
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page               				${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${filter_by_category_issue_text}		${my_tickets_table_locator}		${col_number_category}		
	\  Check State of Page Navigation Buttons		${current_page}		${last_page}		${my_tickets_table_pages_locator}		${my_tickets_first_page_locator}		${my_tickets_previous_page_locator}		${my_tickets_next_page_locator}		${my_tickets_last_page_locator}	
	\  Click Element                     ${my_tickets_next_page_locator}
	\  Sleep							1s   															


Filter My Tickets By Category ServiceRequest
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2837:FilterMyTicketsByCategoryIssue
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_category_locator}
	${filter_by}=		                Get Element Attribute               		${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings       	${filter_by_category_display_text}   		${filter_by}				
	Input text							${my_tickets_filter_by_locator}				${filter_by_category_service_request_text}
	Press Key                        	${my_tickets_filter_by_locator}          	\\13 
	Sleep                               2s																	
	Element Should Contain				${my_ticket_active_filter_locator}			${active_label_category_text} ${filter_by_category_service_request_text}
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page               				${number_items}			${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${filter_by_category_service_request_text}		${my_tickets_table_locator}		${col_number_category}	
	\  Check State of Page Navigation Buttons		${current_page}		${last_page}		${my_tickets_table_pages_locator}		${my_tickets_first_page_locator}		${my_tickets_previous_page_locator}		${my_tickets_next_page_locator}		${my_tickets_last_page_locator}	
	\  Click Element                     ${my_tickets_next_page_locator}
	\  Sleep							1s

Filter My Tickets By Priority Critical
 	[Tags]                           	Service Desk    
	[Documentation]                  	 CADR-2838:FilterMyTicketsByPriorityCritical
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_priority_locator}
	Page Should Contain Element			${my_tickets_filter_by_priority_button_locator}
	${filter_by}=						Get Text									${my_tickets_filter_by_priority_button_locator}
	Should Be Equal As Strings			${filter_by_priority_display_text}			${filter_by}
	Click Element						${my_tickets_filter_by_priority_button_locator}
	${priority_value}=					Get Text									${my_tickets_filter_by_priority_critical_locator}
	Click Link							${my_tickets_filter_by_priority_critical_locator}						
	Sleep                               2s																	
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}			${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${priority_value}		${my_tickets_table_locator}	${col_number_priority} 		
	\  Check State of Page Navigation Buttons		${current_page}		${last_page}		${my_tickets_table_pages_locator}		${my_tickets_first_page_locator}		${my_tickets_previous_page_locator}		${my_tickets_next_page_locator}		${my_tickets_last_page_locator}
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s


Filter My Tickets By Priority High
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2839:FilterMyTicketsByPriorityHigh
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_priority_locator}
	Page Should Contain Element			${my_tickets_filter_by_priority_button_locator}
	${filter_by}=						Get Text									${my_tickets_filter_by_priority_button_locator}
	Should Be Equal As Strings			${filter_by_priority_display_text}			${filter_by}
	Click Element						${my_tickets_filter_by_priority_button_locator}
	${priority_value}=					Get Text									${my_tickets_filter_by_priority_high_locator}
	Click Link							${my_tickets_filter_by_priority_high_locator}						
	Sleep                               2s																	
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}			${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${priority_value}		${my_tickets_table_locator}	${col_number_priority} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s


Filter My Tickets By Priority Normal
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2840:FilterMyTicketsByPriorityNormal
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_priority_locator}
	Page Should Contain Element			${my_tickets_filter_by_priority_button_locator}
	${filter_by}=						Get Text									${my_tickets_filter_by_priority_button_locator}
	Should Be Equal As Strings			${filter_by_priority_display_text}			${filter_by}
	Click Element						${my_tickets_filter_by_priority_button_locator}
	${priority_value}=					Get Text									${my_tickets_filter_by_priority_normal_locator}
	Click Link							${my_tickets_filter_by_priority_normal_locator}						
	Sleep                               2s																	
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}			${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${priority_value}		${my_tickets_table_locator}		${col_number_priority} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                     ${my_tickets_next_page_locator}
	\  Sleep							1s


Filter My Tickets By Priority Low
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2841:FilterMyTicketsByPriorityLow
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_priority_locator}
	Page Should Contain Element			${my_tickets_filter_by_priority_button_locator}
	${filter_by}=						Get Text									${my_tickets_filter_by_priority_button_locator}
	Should Be Equal As Strings			${filter_by_priority_display_text}			${filter_by}
	Click Element						${my_tickets_filter_by_priority_button_locator}
	${priority_value}=					Get Text									${my_tickets_filter_by_priority_low_locator}
	Click Link							${my_tickets_filter_by_priority_low_locator}						
	Sleep                               2s																	
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}			${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    0    -1
	\  ${current_page}=					Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${priority_value}		${my_tickets_table_locator}		${col_number_priority} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s


Filter My Tickets By Status Open
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2842:FilterMyTicketsByStatusOpen
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_status_locator}
	Page Should Contain Element			${my_tickets_filter_by_status_button_locator}
	${filter_by}=						Get Text									${my_tickets_filter_by_status_button_locator}
	Should Be Equal As Strings			${filter_by_status_display_text}			${filter_by}
	Click Element						${my_tickets_filter_by_status_button_locator}
	${status_value}=					Get Text									${my_tickets_filter_by_status_open_locator}
	Click Link							${my_tickets_filter_by_status_open_locator}					
	Sleep                               2s																	
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}			${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${status_value}		${my_tickets_table_locator}		${col_number_status} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s	   				   				   			

Filter My Tickets By Status Reopened
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2843:FilterMyTicketsByStatusReopened
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}				My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_status_locator}
	Page Should Contain Element			${my_tickets_filter_by_status_button_locator}
	${filter_by}=						Get Text									${my_tickets_filter_by_status_button_locator}
	Should Be Equal As Strings			${filter_by_status_display_text}			${filter_by}
	Click Element						${my_tickets_filter_by_status_button_locator}
	${status_value}=					Get Text									${my_tickets_filter_by_status_reopen_locator}
	Click Link							${my_tickets_filter_by_status_reopen_locator}					
	Sleep                               2s																	
	${table_info}=						Get Text									${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}=					Get Number Of Items							${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}			${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             			${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count					${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${status_value}		${my_tickets_table_locator}		${col_number_status} 	
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s	   				   				   			


Filter My Tickets By Status Closed
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2844:FilterMyTicketsByStatusClosed
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_status_locator}
	Page Should Contain Element			${my_tickets_filter_by_status_button_locator}
	${filter_by}=						Get Text								${my_tickets_filter_by_status_button_locator}
	Should Be Equal As Strings			${filter_by_status_display_text}		${filter_by}
	Click Element						${my_tickets_filter_by_status_button_locator}
	${status_value}=					Get Text								${my_tickets_filter_by_status_closed_locator}
	Click Link							${my_tickets_filter_by_status_closed_locator}				
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}
	:FOR       ${page}                  IN RANGE         	${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${status_value}		${my_tickets_table_locator}		${col_number_status} 	
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s	   				   				   			


Filter My Tickets By Status Duplicate
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2845:FilterMyTicketsByStatusDuplicate
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_status_locator}
	Page Should Contain Element			${my_tickets_filter_by_status_button_locator}
	${filter_by}=						Get Text								${my_tickets_filter_by_status_button_locator}
	Should Be Equal As Strings			${filter_by_status_display_text}		${filter_by}
	Click Element						${my_tickets_filter_by_status_button_locator}
	${status_value}=					Get Text								${my_tickets_filter_by_status_duplicate_locator}
	Click Link							${my_tickets_filter_by_status_duplicate_locator}
	Sleep                               2s																	
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available					
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${status_value}		${my_tickets_table_locator}		${col_number_status} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s	
	   				   				   			
Filter MyTickets By Status Resolved     	               
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2846:FilterMyTicketsByStatusResolved
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_status_locator}
	Page Should Contain Element			${my_tickets_filter_by_status_button_locator}
	${filter_by}=						Get Text								${my_tickets_filter_by_status_button_locator}
	Should Be Equal As Strings			${filter_by_status_display_text}		${filter_by}
	Click Element						${my_tickets_filter_by_status_button_locator}
	${status_value}=					Get Text								${my_tickets_filter_by_status_resolved_locator}
	Click Link							${my_tickets_filter_by_status_resolved_locator}				
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available																	
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${status_value}		${my_tickets_table_locator}		${col_number_status} 	
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s					   				   			
	
Filter My Tickets By Created Date Today
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2847:FilterMyTicketsByCreatedDateToday
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_created_date_locator}	
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_created_date_display_text}	${filter_by}
	Click Element						${my_tickets_filter_by_locator}
	Click Element						${my_tickets_filter_by_created_date_today_locator}
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	${date_today}=						Get Current Date				local	result_format=%m/%d/%Y
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    	0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${date_today}		${my_tickets_table_locator}		${col_number_created}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s					   			 


Filter My Tickets By Created Date Yesterday	
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2848:FilterMyTicketsByCreatedDateYesterday
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_created_date_locator}	
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_created_date_display_text}	${filter_by}
	Click Element						${my_tickets_filter_by_locator}
	Click Element						${my_tickets_filter_by_created_date_yesterday_locator}
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	${date_today}=						Get Current Date						local	
	${date_yesterday}=					Subtract Time From Date        			${date_today}           1 day	result_format=%m/%d/%Y
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${date_yesterday}			${my_tickets_table_locator}		${col_number_created}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s				


Filter My Tickets By Created Date Last 7 Days	
 	[Tags]                           	Service Desk    
	[Documentation]                  	 CADR-2864:FilterMyTicketsByCreatedDateLast7Days
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_created_date_locator}	
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_created_date_display_text}	${filter_by}
	Click Element						${my_tickets_filter_by_locator}
	Click Element						${my_tickets_filter_by_created_date_7days_locator}
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	${filtered_value}=					Get Text								${my_ticket_active_filter_locator}
	${filtered_value}=					Get Substring 		${filtered_value}	9
	${date_range_start}=					Get Substring		${filtered_value}	0	10
	${date_range_end}=					Get Substring		${filtered_value}	-10
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    	0    -1
	\  ${current_page} 					Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result Date Range			${table_count}		${date_range_start}		${date_range_end}		${my_tickets_table_locator}	${col_number_created}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s	


Filter My Tickets By Created Date Last 30 Days	
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2865:FilterMyTicketsByCreatedDateLast30Days
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_created_date_locator}	
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_created_date_display_text}	${filter_by}
	Click Element						${my_tickets_filter_by_locator}
	Click Element						${my_tickets_filter_by_created_date_30days_locator} 
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	${filtered_value}=					Get Text			${my_ticket_active_filter_locator}
	${filtered_value}=					Get Substring 		${filtered_value}	9
	${date_range_start}=				Get Substring		${filtered_value}	0	10
	${date_range_end}=					Get Substring		${filtered_value}	-10
	${number_items}=					Get Number Of Items		${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    	0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result Date Range			${table_count}		${date_range_start}		${date_range_end}		${my_tickets_table_locator}	${col_number_created}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s	


Filter My Tickets By Created Date This Month	
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2866:FilterMyTicketsByCreatedDateThisMonth
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_created_date_locator}	
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_created_date_display_text}	${filter_by}
	Click Element						${my_tickets_filter_by_locator}
	Click Element						${my_tickets_filter_by_created_date_this_month_locator} 
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	${filtered_value}=					Get Text			${my_ticket_active_filter_locator}
	${filtered_value}=					Get Substring 		${filtered_value}	9
	${date_range_start}=				Get Substring		${filtered_value}	0	10
	${date_range_end}=					Get Substring		${filtered_value}	-10
	${number_items}=					Get Number Of Items		${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    	0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result Date Range			${table_count}		${date_range_start}		${date_range_end}		${my_tickets_table_locator}	${col_number_created}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s	
	
Filter My Tickets By Created Date Last Month	
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2867:FilterMyTicketsByCreatedDateLastMonth
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_created_date_locator}	
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_created_date_display_text}	${filter_by}
	Click Element						${my_tickets_filter_by_locator}
	Click Element						${my_tickets_filter_by_created_date_last_month_locator}
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	${filtered_value}=					Get Text			${my_ticket_active_filter_locator}
	${filtered_value}=					Get Substring 		${filtered_value}	9
	${date_range_start}=				Get Substring		${filtered_value}	0	10
	${date_range_end}=					Get Substring		${filtered_value}	-10
	${number_items}=					Get Number Of Items		${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    	0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result Date Range			${table_count}		${date_range_start}		${date_range_end}		${my_tickets_table_locator}	${col_number_created}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s				



Filter My Tickets By Created Date Custom	
 	[Tags]                           	Service Desk    
	[Documentation]                  	 CADR-2848:FilterMyTicketsByCreatedDateYesterday
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_created_date_locator}	
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_created_date_display_text}	${filter_by}
	Click Element						${my_tickets_filter_by_locator}
	Click Element						${my_tickets_filter_by_created_date_custom_locator}
	Sleep                               2s
	Wait Until Element Is Visible          ${Calendar_left_input_locator} 
	Wait Until Element Is Visible          ${Calendar_right_input_locator}  
	${current_datetime}=                   Get Current Date                     result_format=datetime
	${custom_range_start_datetime}=        Get Random Date Within Range         ${date_interval_start}               ${date_interval_end}              ${current_datetime}    subtract   
	${range_interval}=                     Subtract Date From Date              ${current_datetime}                 ${custom_range_start_datetime}    verbose
	${range_interval}=                     Fetch From Left                      ${range_interval}                   days
	${rpt_interval_end}=                   Replace Variables                    ${range_interval}
	${custom_range_end_datetime}=          Get Random Date Within Range         ${date_interval_start}               ${date_interval_end}              ${custom_range_start_datetime}
	...                                                                         add
	${custom_range_start}=                 Convert Date                         ${custom_range_start_datetime}      result_format=%m/%d/%Y   
	${custom_range_end}=                   Convert Date                         ${custom_range_end_datetime}        result_format=%m/%d/%Y
	Input Text                             ${Calendar_left_input_locator}        ${custom_range_start}
	Press Key                              ${Calendar_left_input_locator}        \\13                                #ENTER key
	Input Text                             ${Calendar_right_input_locator}         ${custom_range_end}
	Press Key                             ${Calendar_right_input_locator}         \\13  
	Click Element                          ${Calendar_outside_locator}
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Results Available
	${filtered_value}=					Get Text			${my_ticket_active_filter_locator}
	${filtered_value}=					Get Substring 		${filtered_value}	9
	${date_range_start}=				Get Substring		${filtered_value}	0	10
	${date_range_end}=					Get Substring		${filtered_value}	-10
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page       ${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    	0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result Date Range			${table_count}		${date_range_start}		${date_range_end}		${my_tickets_table_locator}	${col_number_created}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s				

Filter My Tickets By Submitter
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2869:FilterMyTicketsBySubmitter
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_submitter_locator}
	${filter_by}=		                Get Element Attribute               	${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings			${filter_by_submitter_display_text}		${filter_by}
	Input text							${my_tickets_filter_by_locator}			${submitter_input_text}
	Press Key                        	${my_tickets_filter_by_locator}          \\13                  #ENTER key
	Sleep                               2s
	${table_info}=						Get Text								${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'	Pass Execution		No Results Available
	Element Should Contain				${my_ticket_active_filter_locator}		${submitter_input_text}
	${number_items}=					Get Number Of Items						${my_tickets_table_info_col_locator}
	${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}								
	:FOR       ${page}                  IN RANGE         	${last_page}    	0    -1
	\  ${current_page}= 				Get Element Attribute             		${my_tickets_table_current_page_locator}/input@value
	\  ${table_count}=					Get Matching Xpath Count				${my_tickets_row_locator}
	\  Check Filtered Result			${table_count}		${submitter_input_text}			${my_tickets_table_locator}	${col_number_submitter}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}	
	\  Click Element                    ${my_tickets_next_page_locator}
	\  Sleep							1s
	

Sort My Ticket By Ticket#
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2870:SortMyTicketByTicket#
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Click Element                       ${my_tickets_ticket#_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute		${my_tickets_ticket#_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List       ${col_number_ticket#} 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                  ${sorted_list}
	Check Sorting                       ${sorted_list}              ${list_count}                      ${order}
	Click Element                       ${my_tickets_ticket#_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_ticket#_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_ticket#} 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	

Sort My Ticket By Title
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2871:SortMyTicketByTitle
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Click Element                       ${my_tickets_title_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_title_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_title}			${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${my_tickets_title_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_title_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_title}	 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}


Sort My Ticket By Category
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2872:SortMyTicketByCategory
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Click Element                       ${my_tickets_category_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_category_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_category}			${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${my_tickets_category_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_category_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_category}	 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}		

Sort My Ticket By Priority
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2873:SortMyTicketByPriority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Click Element                       ${my_tickets_priority_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_priority_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_priority}			${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${my_tickets_priority_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_priority_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_category}	 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}			


Sort My Ticket By Status
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2874:SortMyTicketByStatus
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Click Element                       ${my_tickets_status_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_status_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_status}			${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${my_tickets_status_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_status_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_status}	 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}				
	
Sort My Ticket By Created
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2875:SortMyTicketByCreated
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Click Element                       ${my_tickets_created_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_created_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_created}			${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${my_tickets_created_col_locator}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${my_tickets_created_col_locator}@aria-sort
	${sorted_list}=                     Get Table Column List        ${col_number_created}	 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}				

Sort My Ticket By Submitter
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2876:SortMyTicketBySubmitter
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Click Element                       ${my_tickets_submitter_col_locator}
	Sleep                            	2s
	${order}=                        	Get Element Attribute        ${my_tickets_submitter_col_locator}@aria-sort
	${sorted_list}=                  	Get Table Column List        ${col_number_submitter}			${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                   	Get Length                   ${sorted_list}
	Check Sorting                    	${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${my_tickets_submitter_col_locator}
	Sleep                            	2s
	${order}=                        	Get Element Attribute        ${my_tickets_submitter_col_locator}@aria-sort
	${sorted_list}=                  	Get Table Column List        ${col_number_submitter}	 		${my_tickets_row_locator}			${my_tickets_table_locator}   
	${list_count}=                   	Get Length                   ${sorted_list}
	Check Sorting                    	${sorted_list}               ${list_count}                      ${order}
	
My Ticket Show Specified Number Of Entries
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2877:ShowSpecifiedNumberOfEntries
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets	
	Wait Until Element is Enabled       ${my_tickets_table_length_locator}
    Select From List By Value           ${my_tickets_table_length_locator}   ${show_10_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_10_entries}		${my_tickets_table_length_locator}		${my_tickets_row_locator}		${my_tickets_table_info_col_locator} 				
    Select From List By Value           ${my_tickets_table_length_locator}    ${show_25_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_25_entries}		${my_tickets_table_length_locator}		${my_tickets_row_locator}		${my_tickets_table_info_col_locator}
    Select From List By Value           ${my_tickets_table_length_locator}   ${show_50_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_50_entries}		${my_tickets_table_length_locator}		${my_tickets_row_locator}		${my_tickets_table_info_col_locator}
    Select From List By Value           ${my_tickets_table_length_locator}   ${show_100_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_100_entries}		${my_tickets_table_length_locator}		${my_tickets_row_locator}		${my_tickets_table_info_col_locator}				

My Ticket Forward Navigation Of Table Pages
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2878:ForwardNavigationOfTablePages
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets	
	Wait Until Element is Enabled       ${my_tickets_table_length_locator}
    Select From List By Value           ${my_tickets_table_length_locator}  	${show_10_entries}
    Sleep                               3s
    ${number_items}=                    Get Number of Items						${my_tickets_table_info_col_locator}
    ${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}
	:FOR          ${i}                  IN RANGE             1              	${last_page}+1
	\  ${current_page}=                 		Get Element Attribute          ${my_tickets_table_current_page_locator}/input@value
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}
	\  Check Table Information                  ${current_page}         ${show_10_entries}      ${number_items}     ${my_tickets_row_locator}		${my_tickets_table_info_col_locator} 			
	\  Click Element                            ${my_tickets_next_page_locator}
	\  Sleep                                    3s

My Ticket Backward Navigation Of Table Pages
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2879:BackwardNavigationOfTablePages
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets	
	Wait Until Element is Enabled       ${my_tickets_table_length_locator}
    Select From List By Value           ${my_tickets_table_length_locator}    	${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items						${my_tickets_table_info_col_locator}
    ${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}
    :FOR            ${j}                IN RANGE            ${last_page}    0    -1
    \  ${current_page}=                 		Get Element Attribute          	${my_tickets_table_current_page_locator}/input@value
    \  Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}
	\  Check Table Information                  ${current_page}         ${show_10_entries}      ${number_items}     ${my_tickets_row_locator}		${my_tickets_table_info_col_locator}
	\  Click Element                            ${my_tickets_previous_page_locator}
	\  Sleep                                    3s
	
My Ticket Navigate To Last Page
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2880:NavigateToLastPage
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets	
	Wait Until Element is Enabled       ${my_tickets_table_length_locator}
    Select From List By Value           ${my_tickets_table_length_locator}    	${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items						${my_tickets_table_info_col_locator}
    ${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}	
	Click Element						${my_tickets_last_page_locator}						 
	Sleep                               2s
	${current_page}=                    Get Element Attribute          	${my_tickets_table_current_page_locator}/input@value
    Check State of Page Navigation Buttons	${current_page}		${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}
    Check Table Information                 ${current_page}		${show_10_entries}      ${number_items}     ${my_tickets_row_locator}		${my_tickets_table_info_col_locator}
   
My Ticket Navigate To First Page
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2881:NavigateToFirstPage
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets	
	Wait Until Element is Enabled       ${my_tickets_table_length_locator}
    Select From List By Value           ${my_tickets_table_length_locator}    	${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items						${my_tickets_table_info_col_locator}
    ${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}	
	Click Element						${my_tickets_first_page_locator}						 
	Sleep                               2s
	${current_page}=                    Get Element Attribute          			${my_tickets_table_current_page_locator}/input@value
    Check State of Page Navigation Buttons	${current_page}			${last_page}	${my_tickets_table_pages_locator}	${my_tickets_first_page_locator}	${my_tickets_previous_page_locator}	${my_tickets_next_page_locator}	${my_tickets_last_page_locator}
    Check Table Information                 ${current_page}         ${show_10_entries}      ${number_items}     ${my_tickets_row_locator}		${my_tickets_table_info_col_locator}
   
My Ticket Navigate To Specified Page
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2882:NavigateToSpecifiedPage
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}			My Tickets	
	Wait Until Element is Enabled       ${my_tickets_table_length_locator}
    Select From List By Value           ${my_tickets_table_length_locator}    	${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items						${my_tickets_table_info_col_locator}
    ${last_page}=                       Get Last Page		${number_items}		${my_tickets_table_length_locator}
    ${random_page}=                     Evaluate            random.randint(1, ${last_page})              modules=random	    			
 	Input Text                         ${my_tickets_page_number_input_locator}    ${random_page}   
 
 Add Comment to a Ticket Service Request
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2883:Add Comment to a Ticket Service Request
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_category_locator}
	${filter_by}=		                Get Element Attribute               ${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings       	${filter_by_category_display_text}  ${filter_by}				
	Input text							${my_tickets_filter_by_locator}		${filter_by_category_service_request_text}
	Press Key                        	${my_tickets_filter_by_locator}     \\13 
	Sleep                               2s
	${table_info}=						Get Text							${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Tickets Available
	${table_row_count}=					Get Matching Xpath Count			${my_tickets_row_locator}
	${random_row}=						Evaluate                      		random.randint(1, ${table_row_count})        modules=random
	Click Element						${my_tickets_table_locator}//tr[${random_row}]/td[${col_number_title}]/a
	Wait Until Element is Enabled		${ticket_comment_iframe_locator}
   	Select Frame						${ticket_comment_iframe_locator}
	Input text  						tinymce					${service_request_followup_text} 				
	Unselect Frame
	Click Element 						${ticket_add_follow_up_locator}
	Wait Until Element is Enabled		${ticket_add_follow_up_locator}
	Sleep                               3s
	Element Should Contain				${active_breadcrumb_locator}		${service_request_summary_text}
	${ticket_header_text}=				Get Text							${ticket_header_locator}
	Should Contain						${ticket_header_text}				${service_request_summary_text}
 	Page Should Contain Element			${ticket_attachment_locator}
 	Sleep								3s
 	${CommentNumber}=              		Get Matching Xpath Count            ${ticket_comments_count_locator}
 	Run Keyword If						${CommentNumber} == '2'				${CommentNumber}	evaluate 		${CommentNumber} + 1		
 	${iframe_id}=						Get Element Attribute				${ticket_comments_accordion_locator}/div[${CommentNumber}]/div[@class="panel-body"]/div[@class="followup well"]//iframe@id
	Select Frame						${ticket_iframe_locator}[@id="${iframe_id}"]
	${data_id}=							Remove String		${iframe_id}	_ifr			
	${count}=    						Get Matching Xpath Count    		//body[@id="tinymce" and @data-id="${data_id}"]/p		
	${comment}=    						Create List
	:FOR    	${i}    				IN RANGE    1    ${count}+1
	\	${name}=    					Get Text    xpath=//body[@id="tinymce" and @data-id="${data_id}"]/p[${i}]
	\   Append To List    				${comment}		${name}    	
	Unselect Frame
	Should Contain						${comment}		${service_request_followup_text} 							 


 Add Comment to a Ticket Issue
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2884:Add Comment to a Ticket Issue
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${sidemenu_my_tickets_locator}
	Element Should Contain				${active_breadcrumb_locator}		My Tickets
	Click Element						${my_tickets_filter_button_locator}
	Page Should Contain Element			${my_tickets_filter_button_menu_locator}
	Click Link							${my_tickets_filter_by_category_locator}
	${filter_by}=		                Get Element Attribute               ${my_tickets_filter_by_locator}@placeholder
	Should Be Equal As Strings       	${filter_by_category_display_text}  ${filter_by}				
	Input text							${my_tickets_filter_by_locator}		${filter_by_category_issue_text}
	Press Key                        	${my_tickets_filter_by_locator}     \\13 
	Sleep                               2s
	${table_info}=						Get Text							${my_tickets_table_info_col_locator}
	Run Keyword If						'${table_info}'=='Showing 0 Results'		Pass Execution		No Tickets Available
	${table_row_count}=					Get Matching Xpath Count			${my_tickets_row_locator}
	${random_row}=						Evaluate                      		random.randint(1, ${table_row_count})        modules=random
	Click Element						${my_tickets_table_locator}//tr[${random_row}]/td[${col_number_title}]/a
	Wait Until Element is Enabled		${ticket_comment_iframe_locator}
   	Select Frame						${ticket_comment_iframe_locator}
	Input text  						tinymce					${issue_followup}				 				
	Unselect Frame
	Click Element 						${ticket_add_follow_up_locator}
	Wait Until Element is Enabled		${ticket_add_follow_up_locator}
	Element Should Contain				${active_breadcrumb_locator}		${issue_summary_text}
	${ticket_header_text}=				Get Text							${ticket_header_locator}
	Should Contain						${ticket_header_text}				${issue_summary_text}
 	Page Should Contain Element			${ticket_attachment_locator}
 	Sleep                               3s
 	${CommentNumber}=              		Get Matching Xpath Count            ${ticket_comments_count_locator}
 	Run Keyword If						${CommentNumber} == '2'				${CommentNumber}	evaluate 		${CommentNumber} + 1		
 	${iframe_id}=						Get Element Attribute					${ticket_comments_accordion_locator}/div[${CommentNumber}]/div[@class="panel-body"]/div[@class="followup well"]//iframe@id
	Select Frame						${ticket_iframe_locator}[@id="${iframe_id}"]
	${data_id}=							Remove String			${iframe_id}			_ifr			
	${count}=    						Get Matching Xpath Count    			//body[@id="tinymce" and @data-id="${data_id}"]/p		
	${comment}=    						Create List
	:FOR   		 ${i}    				IN RANGE    1    ${count}+1
	\	${name}=    					Get Text    xpath=//body[@id="tinymce" and @data-id="${data_id}"]/p[${i}]
	\   Append To List    				${comment}	${name}    	
	Unselect Frame
	Should Contain						${comment}				${issue_followup}							 
	
	