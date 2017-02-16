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
${PanelBodyText}				All fields are required. Please provide as descriptive a title and description as possible for all fields.
${AttachedFileHelpText}			You can attach a file such as a document or screenshot to this ticket.
${PriorityText}					Please select a priority carefully.				
${DescriptionText}				Please be as descriptive as possible, including any details we may need to address your query.			
${RequiredFieldErrorMessage}	This field is required.	
${FileLocation}					/home/vagrant/data/coffee.png
${IssueSummary}					Issue Summary Test										
${ServiceRequestSummary}		Service Request Summary Test
${IssueDetails}					Issue Details Test...Issue Details Test...Issue Details Test...Issue Details Test...								
${ServiceRequestDetails}		Service Request Details Test....Service Request Details Test...Service Request Details Test
${ServiceRequestFollowup}		Follow up on this Service Request
${IssueFollowup}				Follow up on this Issue
${TicketRespondToEmailLabelText}	Your reply will be sent to
${TicketRespondHeaderText}			Respond to this ticket
${LabelCommentBoxText}				Comment	 	
#************************ My Ticket Text Displays *************************
${FilterByTitle}			Filter by Title...		
${FilterByCategory}			Filter by Category...
${FilterByPriority}			Select Priority
${FilterByStatus}			Select Status
${FilterByCreatedDate}		Filter by Created Date...
${FilterBySubmitter}		Filter by Submitter...
${FilterByCategoryIssue}	Issue
${FilterByCategoryServiceRequest}	Service Request	

#**************************** Table Column Number ******************************
${ColTicket#}       1
${ColTitle}		    2
${ColCategory}      3
${ColPriority}      4
${ColStatus}        5
${ColCreated}		6
${ColSubmitter}		7

#******************** Creation Date Custom Range Interval **********************
${DateIntervalStart}    0
${DateIntervalEnd}      90

#******************** Active Filter Label**********************
${ActiveLabelTitle}				Title: 		
${ActiveLabelCategory}			Category: 
${ActiveLabelPriority}			Priority: 
${ActiveLabelStatus}			Status: 
${ActiveLabelCreated}			Created: 
${ActiveLabelSubmitter}			Submitter: 



#******************** Submitter **********************
${SubmitterInput}		Tenant 1		

*** Test Cases ***
 Service Desk Page Elements Validation
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2804:Service Desk Page Element Validation
	Wait Until Element Is Visible		${nav_bar_serviceDesk_locator} 
    Wait Until Element Is Enabled		${nav_bar_serviceDesk_locator}
    Click Element						${nav_bar_serviceDesk_locator}
    Element Should Contain				${Home_Breadcrumb}			Home		
    Element Should Contain				${ServiceDesk_Breadcrumb}	Service Desk
    Page Should Contain Element  		${SideMenu_Ticket_Expanded}
    Page Should Contain Element			${SideMenu_NewTickets}
    Page Should Contain Element  		${SideMenu_MyTickets}	
    Page Should Contain Element			${SideMenu_Knowledgebase_Collapsed}
 	Click Element						${SideMenu_Knowledgebase_Collapsed}
 	Page Should Contain Element			${SideMenu_Knowledgebase_Expanded}
 	Page Should Contain Element			${SideMenu_Ticket_Collapsed}	
 	Page Should Contain Element			${SideMenu_Categories}
 
 
 Submit Ticket Page Elements Validation 
  	[Tags]                           	Service Desk   
	[Documentation]                  	CADR-2811: Submit Ticket Page Elements Validation
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_Ticket_Collapsed}
	Click Element						${SideMenu_NewTickets}
	Element Should Contain				${ActiveBreadcrumb}					New Ticket
	Element Should Contain				${NewTicketPageTitle}				SUBMIT A TICKET
	Element Should Contain				${NewTicketPanelTitle}				New Ticket
	Element Should Contain				${NewTicketPanelBody}				${PanelBodyText}			
	Element Should Contain				${CategoryControlLabel}				Category				
	Page Should Contain Element			${CategoryDropDown}
	Element Should Contain				${IssueSummaryControlLabel}			Summary of your query		
	Page Should Contain Element			${IssueSummaryInputBox}
	Element Should Contain				${IssueDescriptionControlLabel} 	Description of your issue
	Page Should Contain Element			${IssueDescriptionInputBox}			
	Element Should Contain				${IssueDescriptionHelp}				${DescriptionText}								
	Page Should Contain Element			${PriorityDropDown}						
	Element Should Contain				${PriorityControlLabel}				Urgency
	Element Should Contain				${PriorityHelp}						${PriorityText}
	Page Should Contain Element			${AttachedFileButton}		
	Element Should Contain				${AttachedFileControlLabel}			Attach File		
	Element Should Contain				${AttachedFileHelp}					${AttachedFileHelpText}					
	Page Should Contain Element			${SubmitButton}							

 
 My Tickets Page Elements Validation
 	[Tags]                           	Service Desk   
	[Documentation]                  	CADR-2812:My Ticket Page Element Validation
 	Click Element						${nav_bar_serviceDesk_locator}
 	Click Element						${SideMenu_MyTickets}
 	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Element Should Contain				${MyTicketPageTitle}				Tickets
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings       	${FilterByTitle}   					${Filter_by}
	Element Should Contain           	${MyTicketTableLabel}	            Show
	Element Should Contain           	${MyTicketTableLabel}           	entries
 	Table Header Should Contain			${MyTicketsTable}					Ticket #
	Table Header Should Contain			${MyTicketsTable}					Title 					
	Table Header Should Contain 		${MyTicketsTable}					Category
	Table Header Should Contain 		${MyTicketsTable}					Priority					
	Table Header Should Contain 		${MyTicketsTable}					Status					
	Table Header Should Contain 		${MyTicketsTable}					Created					
	Table Header Should Contain 		${MyTicketsTable}					Submitter				
	Page Should Contain Element			${MyTicketsFirstPage}
	Page Should Contain Element			${MyTicketsPreviousPage}
	Page Should Contain Element			${MyTicketsNextPage}
	Page Should Contain Element			${MyTicketsLastPage}
	${TableInfo}=						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Ticket Available
	Element Should Contain				${MyTicketTableInfo}				Showing
	Element Should Contain				${MyTicketTableInfo}				to
	Element Should Contain				${MyTicketTableInfo}				of
	Element Should Contain				${MyTicketTableInfo}				Items


 Submit Ticket Page All Required Field Blanks 
 	[Tags]                           	Service Desk   
	[Documentation]                  	CADR-2813:Submit Ticket Page All Required Field Blanks
	Click Element						${SideMenu_NewTickets}
	Click Element						${SubmitButton}
	Element Should Contain				${CategoryErrorValidation}				${RequiredFieldErrorMessage}
	Element Should Contain				${IssueSummaryErrorValidation}			${RequiredFieldErrorMessage}
	Element Should Contain				${IssueDescriptionErrorValidation}		${RequiredFieldErrorMessage}

 Submit Ticket No Category 
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2814:Submit Ticket No Category 
	Click Element						${SideMenu_NewTickets}
	Input Text 							${IssueSummaryInputBox}					Test
	Input Text 							${IssueDescriptionInputBox}				Test Description
	Select From List By Value			${PriorityDropDown}						1
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Element Should Contain				${CategoryErrorValidation}				${RequiredFieldErrorMessage}
	
 Submit Issue No Title 
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2815:Submit Issue No Title
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						1	
	Input Text 							${IssueDescriptionInputBox}				Test Description
	Select From List By Value			${PriorityDropDown}						1
	Choose File							${AttachedFileButton}					${FileLocation}						
	Click Element						${SubmitButton}
	Element Should Contain				${IssueSummaryErrorValidation}				${RequiredFieldErrorMessage}


 Submit ServiceRequest No Title 
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2816:Submit ServiceRequest No Title 
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						2	
	Input Text 							${IssueDescriptionInputBox}				Test Description
	Select From List By Value			${PriorityDropDown}						2
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Element Should Contain				${IssueSummaryErrorValidation}			${RequiredFieldErrorMessage}		

 Submit Issue No Description 
  	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2817:Submit Issue No Description 
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						1	
	Input Text 							${IssueSummaryInputBox}					Test Title
	Select From List By Value			${PriorityDropDown}						3
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Element Should Contain				${IssueDescriptionErrorValidation}		${RequiredFieldErrorMessage}	

 Submit ServiceRequest No Description 
  	[Tags]                           	Service Desk    
	[Documentation]                  	CCADR-2818:Submit ServiceRequest No Description
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						2	
	Input Text 							${IssueSummaryInputBox}					Test Title
	Select From List By Value			${PriorityDropDown}						4
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Element Should Contain				${IssueDescriptionErrorValidation}		${RequiredFieldErrorMessage}

 Submit ServiceRequest with attachment Critical Priority
   	[Tags]                           	Service Desk		Create Ticket    
	[Documentation]                  	CADR-2819:Submit ServiceRequest with attachment Critical Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						2	
	Input Text 							${IssueSummaryInputBox}					${ServiceRequestSummary}
	Input Text 							${IssueDescriptionInputBox}				${ServiceRequestDetails}
	Select From List By Value			${PriorityDropDown}						1
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${ServiceRequestSummary}
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${ServiceRequestSummary}
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${ServiceRequestDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${ServiceRequestDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}
	
Submit ServiceRequest with attachment High Priority
   	[Tags]                           	Service Desk		Create Ticket    
	[Documentation]                  	CADR-2820:Submit ServiceRequest with attachment High Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						2	
	Input Text 							${IssueSummaryInputBox}					${ServiceRequestSummary}
	Input Text 							${IssueDescriptionInputBox}				${ServiceRequestDetails}
	Select From List By Value			${PriorityDropDown}						2
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${ServiceRequestSummary}
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${ServiceRequestSummary}
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${ServiceRequestDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${ServiceRequestDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}									
	
Submit ServiceRequest with attachment Normal Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2821:Submit ServiceRequest with attachment Normal Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						2	
	Input Text 							${IssueSummaryInputBox}					${ServiceRequestSummary}
	Input Text 							${IssueDescriptionInputBox}				${ServiceRequestDetails}
	Select From List By Value			${PriorityDropDown}						3
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${ServiceRequestSummary}
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${ServiceRequestSummary}
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${ServiceRequestDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${ServiceRequestDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}									
	
Submit ServiceRequest with attachment Low Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2822:Submit ServiceRequest with attachment Low Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						2	
	Input Text 							${IssueSummaryInputBox}					${ServiceRequestSummary}
	Input Text 							${IssueDescriptionInputBox}				${ServiceRequestDetails}
	Select From List By Value			${PriorityDropDown}						4
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${ServiceRequestSummary}
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${ServiceRequestSummary}
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${ServiceRequestDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${ServiceRequestDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}									
	

 Submit Issue with attachment Critical Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2823:Submit Issue with attachment Critical Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						1	
	Input Text 							${IssueSummaryInputBox}					${IssueSummary}
	Input Text 							${IssueDescriptionInputBox}				${IssueDetails}
	Select From List By Value			${PriorityDropDown}						1
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
 	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${IssueSummary}	
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${IssueSummary}	
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${IssueDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${IssueDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}									
	
Submit Issue with attachment High Priority			
   	[Tags]                           	Service Desk		Create Ticket    
	[Documentation]						CADR-2824:Submit Issue with attachment High Priority  
	Click Element						${nav_bar_serviceDesk_locator}                	
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						1	
	Input Text 							${IssueSummaryInputBox}					${IssueSummary}
	Input Text 							${IssueDescriptionInputBox}				${IssueDetails}
	Select From List By Value			${PriorityDropDown}						2
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${IssueSummary}	
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${IssueSummary}	
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${IssueDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${IssueDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}									
	
Submit Issue with attachment Normal Priority
   	[Tags]                           	Service Desk			Create Ticket    
	[Documentation]                  	CADR-2825:Submit Issue with attachment Normal Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						1	
	Input Text 							${IssueSummaryInputBox}					${IssueSummary}
	Input Text 							${IssueDescriptionInputBox}				${IssueDetails}
	Select From List By Value			${PriorityDropDown}						3
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${IssueSummary}	
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${IssueSummary}	
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${IssueDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${IssueDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}									
	
Submit Issue with attachment Low Priority
   	[Tags]                           	Service Desk 			Create Ticket   
	[Documentation]                  	CADR-2826:Submit Issue with attachment Low Priority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_NewTickets}
	Click Element						${CategoryDropDown}
	Select From List By Value			${CategoryDropDown}						1	
	Input Text 							${IssueSummaryInputBox}					${IssueSummary}
	Input Text 							${IssueDescriptionInputBox}				${IssueDetails}
	Select From List By Value			${PriorityDropDown}						4
	Choose File							${AttachedFileButton}					${FileLocation}
	Click Element						${SubmitButton}
	Wait Until Page Contains Element	${TicketHeader}
	Element Should Contain				${ActiveBreadcrumb}						${IssueSummary}	
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${IssueSummary}	
 	Page Should Contain Element			${Attachement}
 	Select Frame						${TicketBodyFrame}	
 	Element Should Contain				${TicketBody}							${IssueDetails}
 	Unselect Frame						
 	Element Should Contain				${TicketRespondHeader}					${TicketRespondHeaderText}							
	Element Should Contain				${TicketRespondToEmailLabel}			${TicketRespondToEmailLabelText}
	Page Should Contain Element			${TicketRespondToEmailBox}
	Element Should Contain				${LabelCommentBox}						${LabelCommentBoxText}
	Select Frame						${CommentIframe}
	Element Should Contain				${CommentAutoBody}						${IssueDetails}
	Unselect Frame
	Page Should Contain Element			${CommentAttachedFile}
	Page Should Contain Element			${AddFollowupButton}
	
Filter MyTickets By Title
 	[Tags]                           	Service Desk			    
	[Documentation]                  	CADR-2836:FilterMyTicketsByTitle								
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByTitle}
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings       	${FilterByTitle}   					${Filter_by}
	Input text							${MyTicketsFilterBy}				${IssueSummary}				
	Press Key                        	${MyTicketsFilterBy}          \\13                  #ENTER key
	Sleep                               2s
	Element Should Contain				${MyTicketActiveFilter}			${ActiveLabelTitle} ${IssueSummary}					
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available																	
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${IssueSummary}		${MyTicketsTable}	${ColTitle}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                             ${MyTicketsNextPage}
	\  Sleep                                     1s


Filter My Tickets By Category Issue
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2837:FilterMyTicketsByCategoryIssue
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCategory}
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings       	${FilterByCategory}   				${Filter_by}				
	Input text							${MyTicketsFilterBy}				${FilterByCategoryIssue}
	Press Key                        	${MyTicketsFilterBy}          \\13 
	Sleep                               2s
	Element Should Contain				${MyTicketActiveFilter}				${ActiveLabelCategory} ${FilterByCategoryIssue} 																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${FilterByCategoryIssue}		${MyTicketsTable}	${ColCategory}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s   															


Filter My Tickets By Category ServiceRequest
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2837:FilterMyTicketsByCategoryIssue
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCategory}
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings       	${FilterByCategory}   				${Filter_by}				
	Input text							${MyTicketsFilterBy}				${FilterByCategoryServiceRequest}
	Press Key                        	${MyTicketsFilterBy}          \\13 
	Sleep                               2s																	
	Element Should Contain				${MyTicketActiveFilter}				${ActiveLabelCategory} ${FilterByCategoryServiceRequest}
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${FilterByCategoryServiceRequest}		${MyTicketsTable}	${ColCategory}	
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s

Filter My Tickets By Priority Critical
 	[Tags]                           	Service Desk    
	[Documentation]                  	 CADR-2838:FilterMyTicketsByPriorityCritical
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByPriority}
	Page Should Contain Element			${MyTicketsFilterByPriorityButton}
	${Filter_by}						Get Text						${MyTicketsFilterByPriorityButton}
	Should Be Equal As Strings			${FilterByPriority}				${Filter_by}
	Click Element						${MyTicketsFilterByPriorityButton}
	${PriorityValue}					Get Text						${MyTicketsFilterByPriorityCritical}
	Click Link							${MyTicketsFilterByPriorityCritical}						
	Sleep                               2s																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${PriorityValue}		${MyTicketsTable}	${ColPriority} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s


Filter My Tickets By Priority High
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2839:FilterMyTicketsByPriorityHigh
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByPriority}
	Page Should Contain Element			${MyTicketsFilterByPriorityButton}
	${Filter_by}						Get Text						${MyTicketsFilterByPriorityButton}
	Should Be Equal As Strings			${FilterByPriority}				${Filter_by}
	Click Element						${MyTicketsFilterByPriorityButton}
	${PriorityValue}					Get Text						${MyTicketsFilterByPriorityHigh}
	Click Link							${MyTicketsFilterByPriorityHigh}						
	Sleep                               2s																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${PriorityValue}		${MyTicketsTable}	${ColPriority} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s


Filter My Tickets By Priority Normal
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2840:FilterMyTicketsByPriorityNormal
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByPriority}
	Page Should Contain Element			${MyTicketsFilterByPriorityButton}
	${Filter_by}						Get Text						${MyTicketsFilterByPriorityButton}
	Should Be Equal As Strings			${FilterByPriority}				${Filter_by}
	Click Element						${MyTicketsFilterByPriorityButton}
	${PriorityValue}					Get Text						${MyTicketsFilterByPriorityNormal}
	Click Link							${MyTicketsFilterByPriorityNormal}						
	Sleep                               2s																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${PriorityValue}		${MyTicketsTable}	${ColPriority} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s


Filter My Tickets By Priority Low
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2841:FilterMyTicketsByPriorityLow
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByPriority}
	Page Should Contain Element			${MyTicketsFilterByPriorityButton}
	${Filter_by}						Get Text						${MyTicketsFilterByPriorityButton}
	Should Be Equal As Strings			${FilterByPriority}				${Filter_by}
	Click Element						${MyTicketsFilterByPriorityButton}
	${PriorityValue}					Get Text						${MyTicketsFilterByPriorityLow}
	Click Link							${MyTicketsFilterByPriorityLow}						
	Sleep                               2s																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${PriorityValue}		${MyTicketsTable}	${ColPriority} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s


Filter My Tickets By Status Open
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2842:FilterMyTicketsByStatusOpen
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByStatus}
	Page Should Contain Element			${MyTicketsFilterByStatusButton}
	${Filter_by}						Get Text						${MyTicketsFilterByStatusButton}
	Should Be Equal As Strings			${FilterByStatus}				${Filter_by}
	Click Element						${MyTicketsFilterByStatusButton}
	${StatusValue}						Get Text						${MyTicketsFilterByStatusOpen}
	Click Link							${MyTicketsFilterByStatusOpen}					
	Sleep                               2s																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${StatusValue}		${MyTicketsTable}	${ColStatus} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s	   				   				   			

Filter My Tickets By Status Reopened
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2843:FilterMyTicketsByStatusReopened
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByStatus}
	Page Should Contain Element			${MyTicketsFilterByStatusButton}
	${Filter_by}						Get Text						${MyTicketsFilterByStatusButton}
	Should Be Equal As Strings			${FilterByStatus}				${Filter_by}
	Click Element						${MyTicketsFilterByStatusButton}
	${StatusValue}						Get Text						${MyTicketsFilterByStatusReopened}
	Click Link							${MyTicketsFilterByStatusReopened}					
	Sleep                               2s																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${StatusValue}		${MyTicketsTable}	${ColStatus} 	
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s	   				   				   			


Filter My Tickets By Status Closed
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2844:FilterMyTicketsByStatusClosed
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByStatus}
	Page Should Contain Element			${MyTicketsFilterByStatusButton}
	${Filter_by}						Get Text						${MyTicketsFilterByStatusButton}
	Should Be Equal As Strings			${FilterByStatus}				${Filter_by}
	Click Element						${MyTicketsFilterByStatusButton}
	${StatusValue}						Get Text						${MyTicketsFilterByStatusClosed}
	Click Link							${MyTicketsFilterByStatusClosed}				
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${StatusValue}		${MyTicketsTable}	${ColStatus} 	
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s	   				   				   			


Filter My Tickets By Status Duplicate
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2845:FilterMyTicketsByStatusDuplicate
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByStatus}
	Page Should Contain Element			${MyTicketsFilterByStatusButton}
	${Filter_by}						Get Text						${MyTicketsFilterByStatusButton}
	Should Be Equal As Strings			${FilterByStatus}				${Filter_by}
	Click Element						${MyTicketsFilterByStatusButton}
	${StatusValue}						Get Text						${MyTicketsFilterByStatusDuplicate}
	Click Link							${MyTicketsFilterByStatusDuplicate}
	Sleep                               2s																	
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available					
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page} 				    Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\  ${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\  Check Filtered Result			${TableCount}		${StatusValue}		${MyTicketsTable}	${ColStatus} 		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s	
	   				   				   			
Filter MyTickets By Status Resolved     	               
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2846:FilterMyTicketsByStatusResolved
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByStatus}
	Page Should Contain Element			${MyTicketsFilterByStatusButton}
	${Filter_by}						Get Text						${MyTicketsFilterByStatusButton}
	Should Be Equal As Strings			${FilterByStatus}				${Filter_by}
	Click Element						${MyTicketsFilterByStatusButton}
	${StatusValue}						Get Text						${MyTicketsFilterByStatusResolved}
	Click Link							${MyTicketsFilterByStatusResolved}				
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available																	
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${StatusValue}		${MyTicketsTable}	${ColStatus} 	
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s					   				   			
	
Filter My Tickets By Created Date Today
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2847:FilterMyTicketsByCreatedDateToday
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCreatedDate}	
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterByCreatedDate}				${Filter_by}
	Click Element						${MyTicketsFilterBy}
	Click Element						${MyTicketsFilterByCreatedDateToday}
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${DateToday}						Get Current Date					local	result_format=%m/%d/%Y
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${DateToday}			${MyTicketsTable}	${ColCreated}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s					   			 


Filter My Tickets By Created Date Yesterday	
 	[Tags]                           	Service Desk    
	[Documentation]                  	 CADR-2848:FilterMyTicketsByCreatedDateYesterday
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCreatedDate}	
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterByCreatedDate}				${Filter_by}
	Click Element						${MyTicketsFilterBy}
	Click Element						${MyTicketsFilterByCreatedDateYesterday}
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${DateToday}						Get Current Date					local	
	${DateYesterday}					Subtract Time From Date        		${DateToday}           1 day	result_format=%m/%d/%Y
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${DateYesterday}			${MyTicketsTable}	${ColCreated}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s				


Filter My Tickets By Created Date Last 7 Days	
 	[Tags]                           	Service Desk    
	[Documentation]                  	 CADR-2864:FilterMyTicketsByCreatedDateLast7Days
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCreatedDate}	
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterByCreatedDate}				${Filter_by}
	Click Element						${MyTicketsFilterBy}
	Click Element						${MyTicketsFilterByCreatedDate7days}
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${FilterValue}						Get Text				${MyTicketActiveFilter}
	${FilterValue}						Get Substring 			${FilterValue}			9
	${DateRangeStart}					Get Substring			${FilterValue}			0	10
	${DateRangeEnd}						Get Substring			${FilterValue}			-10
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\  ${current_page} 					Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\  ${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\  Check Filtered Result Date Range			${TableCount}		${DateRangeStart}		${DateRangeEnd}		${MyTicketsTable}	${ColCreated}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s	


Filter My Tickets By Created Date Last 30 Days	
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2865:FilterMyTicketsByCreatedDateLast30Days
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCreatedDate}	
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterByCreatedDate}				${Filter_by}
	Click Element						${MyTicketsFilterBy}
	Click Element						${MyTicketsFilterByCreatedDatelast30days} 
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${FilterValue}						Get Text				${MyTicketActiveFilter}
	${FilterValue}						Get Substring 			${FilterValue}			9
	${DateRangeStart}					Get Substring			${FilterValue}			0	10
	${DateRangeEnd}						Get Substring			${FilterValue}			-10
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result Date Range			${TableCount}		${DateRangeStart}		${DateRangeEnd}		${MyTicketsTable}	${ColCreated}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s	


Filter My Tickets By Created Date This Month	
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2866:FilterMyTicketsByCreatedDateThisMonth
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCreatedDate}	
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterByCreatedDate}				${Filter_by}
	Click Element						${MyTicketsFilterBy}
	Click Element						${MyTicketsFilterByCreatedDateThisMonth} 
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${FilterValue}						Get Text				${MyTicketActiveFilter}
	${FilterValue}						Get Substring 			${FilterValue}			9
	${DateRangeStart}					Get Substring			${FilterValue}			0	10
	${DateRangeEnd}						Get Substring			${FilterValue}			-10
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result Date Range			${TableCount}		${DateRangeStart}		${DateRangeEnd}		${MyTicketsTable}	${ColCreated}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s	
	
Filter My Tickets By Created Date Last Month	
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2867:FilterMyTicketsByCreatedDateLastMonth
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCreatedDate}	
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterByCreatedDate}				${Filter_by}
	Click Element						${MyTicketsFilterBy}
	Click Element						${MyTicketsFilterByCreatedDateLastMonth}
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${FilterValue}						Get Text				${MyTicketActiveFilter}
	${FilterValue}						Get Substring 			${FilterValue}			9
	${DateRangeStart}					Get Substring			${FilterValue}			0	10
	${DateRangeEnd}						Get Substring			${FilterValue}			-10
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result Date Range			${TableCount}		${DateRangeStart}		${DateRangeEnd}		${MyTicketsTable}	${ColCreated}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s				



Filter My Tickets By Created Date Custom	
 	[Tags]                           	Service Desk    
	[Documentation]                  	 CADR-2848:FilterMyTicketsByCreatedDateYesterday
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCreatedDate}	
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterByCreatedDate}				${Filter_by}
	Click Element						${MyTicketsFilterBy}
	Click Element						${MyTicketsFilterByCreatedDateCustom}
	Sleep                               2s
	Wait Until Element Is Visible          ${Calendar_left_input_locator} 
	Wait Until Element Is Visible          ${Calendar_right_input_locator}  
	${current_datetime}=                   Get Current Date                     result_format=datetime
	${custom_range_start_datetime}=        Get Random Date Within Range         ${DateIntervalStart}               ${DateIntervalEnd}               ${current_datetime}    subtract   
	${range_interval}=                     Subtract Date From Date              ${current_datetime}                 ${custom_range_start_datetime}    verbose
	${range_interval}=                     Fetch From Left                      ${range_interval}                   days
	${rpt_interval_end}=                   Replace Variables                    ${range_interval}
	${custom_range_end_datetime}=          Get Random Date Within Range         ${DateIntervalStart}               ${DateIntervalEnd}               ${custom_range_start_datetime}
	...                                                                         add
	${custom_range_start}=                 Convert Date                         ${custom_range_start_datetime}      result_format=%m/%d/%Y   
	${custom_range_end}=                   Convert Date                         ${custom_range_end_datetime}        result_format=%m/%d/%Y
	Input Text                             ${Calendar_left_input_locator}        ${custom_range_start}
	Press Key                              ${Calendar_left_input_locator}        \\13                                #ENTER key
	Input Text                             ${Calendar_right_input_locator}         ${custom_range_end}
	Press Key                             ${Calendar_right_input_locator}         \\13  
	Click Element                          ${Calendar_outside_locator}
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	${FilterValue}						Get Text				${MyTicketActiveFilter}
	${FilterValue}						Get Substring 			${FilterValue}			9
	${DateRangeStart}					Get Substring			${FilterValue}			0	10
	${DateRangeEnd}						Get Substring			${FilterValue}			-10
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result Date Range			${TableCount}		${DateRangeStart}		${DateRangeEnd}		${MyTicketsTable}	${ColCreated}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							1s				

Filter My Tickets By Submitter
 	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2869:FilterMyTicketsBySubmitter
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterBySubmitter}
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings			${FilterBySubmitter}				${Filter_by}
	Input text							${MyTicketsFilterBy}				${SubmitterInput}
	Press Key                        	${MyTicketsFilterBy}          \\13                  #ENTER key
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Results Available
	Element Should Contain				${MyTicketActiveFilter}			${SubmitterInput}
	${number_items}						Get Number Of Items				${MyTicketTableInfo}
	${last_page}                        Get Last Page               ${number_items}			${MyTicketsTableLength}								
	:FOR       ${Page}                  IN RANGE         ${last_page}    0    -1
	\   ${current_page} 				Get Element Attribute             ${MyTicketTableCurrentPage}/input@value
	\ 	${TableCount}					Get Matching Xpath Count			${MyTicketRows}
	\   Check Filtered Result			${TableCount}		${SubmitterInput}			${MyTicketsTable}	${ColSubmitter}		
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}	
	\  Click Element                     ${MyTicketsNextPage}
	\  Sleep							 1s
	

Sort My Ticket By Ticket#
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2870:SortMyTicketByTicket#
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Click Element                       ${MyTicketTicket#Col}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketTicket#Col}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColTicket#} 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${MyTicketTicket#Col}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketTicket#Col}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColTicket#} 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	

Sort My Ticket By Title
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2871:SortMyTicketByTitle
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Click Element                       ${MyTicketTitleCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketTitleCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColTitle}			${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${MyTicketTitleCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketTitleCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColTitle}	 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}


Sort My Ticket By Category
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2872:SortMyTicketByCategory
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Click Element                       ${MyTicketCategoryCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketCategoryCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColCategory}			${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${MyTicketCategoryCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketCategoryCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColCategory}	 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}		

Sort My Ticket By Priority
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2873:SortMyTicketByPriority
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Click Element                       ${MyTicketPriorityCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketPriorityCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColPriority}			${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${MyTicketPriorityCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketPriorityCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColCategory}	 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}			


Sort My Ticket By Status
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2874:SortMyTicketByStatus
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Click Element                       ${MyTicketStatusCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketStatusCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColStatus}			${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${MyTicketStatusCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketStatusCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColStatus}	 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}				
	
Sort My Ticket By Created
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2875:SortMyTicketByCreated
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Click Element                       ${MyTicketCreatedCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketCreatedCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColCreated}			${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${MyTicketCreatedCol}
	Sleep                            	2s
	${order}=                           Get Element Attribute        ${MyTicketCreatedCol}@aria-sort
	${sorted_list}=                     Get Table Column List        ${ColCreated}	 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                      Get Length                   ${sorted_list}
	Check Sorting                       ${sorted_list}               ${list_count}                      ${order}				

Sort My Ticket By Submitter
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2876:SortMyTicketBySubmitter
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Click Element                       ${MyTicketSubmitterCol}
	Sleep                            	2s
	${order}=                        	Get Element Attribute        ${MyTicketSubmitterCol}@aria-sort
	${sorted_list}=                  	Get Table Column List        ${ColSubmitter}			${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                   	Get Length                   ${sorted_list}
	Check Sorting                    	${sorted_list}               ${list_count}                      ${order}
	Click Element                       ${MyTicketSubmitterCol}
	Sleep                            	2s
	${order}=                        	Get Element Attribute        ${MyTicketSubmitterCol}@aria-sort
	${sorted_list}=                  	Get Table Column List        ${ColSubmitter}	 		${MyTicketRows}			${MyTicketsTable}   
	${list_count}=                   	Get Length                   ${sorted_list}
	Check Sorting                    	${sorted_list}               ${list_count}                      ${order}
	
My Ticket Show Specified Number Of Entries
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2877:ShowSpecifiedNumberOfEntries
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Wait Until Element is Enabled       ${MyTicketsTableLength}
    Select From List By Value           ${MyTicketsTableLength}   ${show_10_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_10_entries}		${MyTicketsTableLength}		${MyTicketRows}		${MyTicketTableInfo} 				
    Select From List By Value           ${MyTicketsTableLength}    ${show_25_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_25_entries}		${MyTicketsTableLength}		${MyTicketRows}		${MyTicketTableInfo}
    Select From List By Value           ${MyTicketsTableLength}   ${show_50_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_50_entries}		${MyTicketsTableLength}		${MyTicketRows}		${MyTicketTableInfo}
    Select From List By Value           ${MyTicketsTableLength}   ${show_100_entries}
    Sleep                               2s
    Check Show Entries Value	 		${show_100_entries}		${MyTicketsTableLength}		${MyTicketRows}		${MyTicketTableInfo}				

My Ticket Forward Navigation Of Table Pages
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2878:ForwardNavigationOfTablePages
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Wait Until Element is Enabled       ${MyTicketsTableLength}
    Select From List By Value           ${MyTicketsTableLength}    ${show_10_entries}
    Sleep                               3s
    ${number_items}=                    Get Number of Items		${MyTicketTableInfo}
    ${last_page}=                       Get Last Page		${number_items}		${MyTicketsTableLength}
	:FOR          ${i}                  IN RANGE             1              ${last_page}+1
	\  ${current_page}=                 		Get Element Attribute          ${MyTicketTableCurrentPage}/input@value
	\  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}
	\  Check Table Information                  ${current_page}         ${show_10_entries}      ${number_items}     ${MyTicketRows}		${MyTicketTableInfo} 			
	\  Click Element                            ${MyTicketsNextPage}
	\  Sleep                                    3s

My Ticket Backward Navigation Of Table Pages
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2879:BackwardNavigationOfTablePages
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Wait Until Element is Enabled       ${MyTicketsTableLength}
    Select From List By Value           ${MyTicketsTableLength}    ${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items		${MyTicketTableInfo}
    ${last_page}=                       Get Last Page		${number_items}		${MyTicketsTableLength}
    :FOR            ${j}                IN RANGE            ${last_page}    0    -1
    \  ${current_page}=                 		Get Element Attribute          ${MyTicketTableCurrentPage}/input@value
    \  Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}
	\  Check Table Information                  ${current_page}         ${show_10_entries}      ${number_items}     ${MyTicketRows}		${MyTicketTableInfo}
	\  Click Element                            ${MyTicketsPreviousPage}
	\  Sleep                                    3s
	
My Ticket Navigate To Last Page
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2880:NavigateToLastPage
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Wait Until Element is Enabled       ${MyTicketsTableLength}
    Select From List By Value           ${MyTicketsTableLength}    ${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items		${MyTicketTableInfo}
    ${last_page}=                       Get Last Page		${number_items}		${MyTicketsTableLength}	
	Click Element						${MyTicketsLastPage}						 
	Sleep                                     2s
	${current_page}=                          Get Element Attribute          ${MyTicketTableCurrentPage}/input@value
    Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}
    Check Table Information                  ${current_page}         ${show_10_entries}      ${number_items}     ${MyTicketRows}		${MyTicketTableInfo}
   
My Ticket Navigate To First Page
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2881:NavigateToFirstPage
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Wait Until Element is Enabled       ${MyTicketsTableLength}
    Select From List By Value           ${MyTicketsTableLength}    ${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items		${MyTicketTableInfo}
    ${last_page}=                       Get Last Page		${number_items}		${MyTicketsTableLength}	
	Click Element						${MyTicketsFirstPage}						 
	Sleep                                     2s
	${current_page}=                          Get Element Attribute          ${MyTicketTableCurrentPage}/input@value
    Check State of Page Navigation Buttons	${current_page}			${last_page}	${MyTicketTablePages}	${MyTicketsFirstPage}	${MyTicketsPreviousPage}	${MyTicketsNextPage}	${MyTicketsLastPage}
    Check Table Information                  ${current_page}         ${show_10_entries}      ${number_items}     ${MyTicketRows}		${MyTicketTableInfo}
   
My Ticket Navigate To Specified Page
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2882:NavigateToSpecifiedPage
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets	
	Wait Until Element is Enabled       ${MyTicketsTableLength}
    Select From List By Value           ${MyTicketsTableLength}    ${show_10_entries}
    Sleep                               3s	
	${number_items}=                    Get Number of Items		${MyTicketTableInfo}
    ${last_page}=                       Get Last Page		${number_items}		${MyTicketsTableLength}
    ${random_page}=                     Evaluate            random.randint(1, ${last_page})              modules=random	    			
 	Input Text                         ${MyTicketsPageNumberInput}    ${random_page}   
 
 Add Comment to a Ticket Service Request
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2883:Add Comment to a Ticket Service Request
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCategory}
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings       	${FilterByCategory}   				${Filter_by}				
	Input text							${MyTicketsFilterBy}				${FilterByCategoryServiceRequest}
	Press Key                        	${MyTicketsFilterBy}          \\13 
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Tickets Available
	${TableRowCount}					Get Matching Xpath Count			${MyTicketRows}
	${RandomRow}						Evaluate                      random.randint(1, ${TableRowCount})        modules=random
	Click Element						${MyTicketsTable}//tr[${RandomRow}]/td[${ColTitle}]/a
	Wait Until Element is Enabled		${CommentIframe}
   	Select Frame						${CommentIframe}
	Input text  						tinymce					${ServiceRequestFollowup} 				
	Unselect Frame
	Click Element 						${AddFollowupButton}
	Wait Until Element is Enabled		${AddFollowupButton}
	Sleep                               3s
	Element Should Contain				${ActiveBreadcrumb}						${ServiceRequestSummary}
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${ServiceRequestSummary}
 	Page Should Contain Element			${Attachement}
 	Sleep								3s
 	${CommentNumber}=              		Get Matching Xpath Count                ${CommentCount}
 	Run Keyword If						${CommentNumber} == '2'					${CommentNumber}	evaluate 		${CommentNumber} + 1		
 	${IframeId}							Get Element Attribute					${CommentAccordion}/div[${CommentNumber}]/div[@class="panel-body"]/div[@class="followup well"]//iframe@id
	Select Frame						${Iframe}[@id="${IframeId}"]
	${data_id}=							Remove String			${IframeId}			_ifr			
	${count}=    						Get Matching Xpath Count    			//body[@id="tinymce" and @data-id="${data_id}"]/p		
	${Comment}=    						Create List
	:FOR    ${i}    IN RANGE    1    ${count}+1
	\	${name}=    		Get Text    xpath=//body[@id="tinymce" and @data-id="${data_id}"]/p[${i}]
	\    Append To List    	${Comment}	${name}    	
	Unselect Frame
	Should Contain						${Comment}				${ServiceRequestFollowup} 							 


 Add Comment to a Ticket Issue
	[Tags]                           	Service Desk    
	[Documentation]                  	CADR-2884:Add Comment to a Ticket Issue
	Click Element						${nav_bar_serviceDesk_locator}
	Click Element						${SideMenu_MyTickets}
	Element Should Contain				${ActiveBreadcrumb}					My Tickets
	Click Element						${MyTicketsFilterButton}
	Page Should Contain Element			${MyTicketsFilterButtonMenu}
	Click Link							${MyTicketsFilterByCategory}
	${Filter_by}		                Get Element Attribute               ${MyTicketsFilterBy}@placeholder
	Should Be Equal As Strings       	${FilterByCategory}   				${Filter_by}				
	Input text							${MyTicketsFilterBy}				${FilterByCategoryIssue}
	Press Key                        	${MyTicketsFilterBy}          \\13 
	Sleep                               2s
	${TableInfo}						Get Text							${MyTicketTableInfo}
	Run Keyword If						'${TableInfo}'=='Showing 0 Results'		Pass Execution		No Tickets Available
	${TableRowCount}					Get Matching Xpath Count			${MyTicketRows}
	${RandomRow}						Evaluate                      random.randint(1, ${TableRowCount})        modules=random
	Click Element						${MyTicketsTable}//tr[${RandomRow}]/td[${ColTitle}]/a
	Wait Until Element is Enabled		${CommentIframe}
   	Select Frame						${CommentIframe}
	Input text  						tinymce					${IssueFollowup}				 				
	Unselect Frame
	Click Element 						${AddFollowupButton}
	Wait Until Element is Enabled		${AddFollowupButton}
	Element Should Contain				${ActiveBreadcrumb}						${IssueSummary}
	${TicketHeaderText}					Get Text								${TicketHeader}
	Should Contain						${TicketHeaderText}						${IssueSummary}
 	Page Should Contain Element			${Attachement}
 	Sleep                               3s
 	${CommentNumber}=              		Get Matching Xpath Count                ${CommentCount}
 	Run Keyword If						${CommentNumber} == '2'					${CommentNumber}	evaluate 		${CommentNumber} + 1		
 	${IframeId}							Get Element Attribute					${CommentAccordion}/div[${CommentNumber}]/div[@class="panel-body"]/div[@class="followup well"]//iframe@id
	Select Frame						${Iframe}[@id="${IframeId}"]
	${data_id}=							Remove String			${IframeId}			_ifr			
	${count}=    						Get Matching Xpath Count    			//body[@id="tinymce" and @data-id="${data_id}"]/p		
	${Comment}=    						Create List
	:FOR    ${i}    IN RANGE    1    ${count}+1
	\	${name}=    		Get Text    xpath=//body[@id="tinymce" and @data-id="${data_id}"]/p[${i}]
	\    Append To List    	${Comment}	${name}    	
	Unselect Frame
	Should Contain						${Comment}				${IssueFollowup}							 
	
	