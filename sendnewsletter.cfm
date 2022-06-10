<CFIF IsDefined("Message")>

<CFQUERY NAME="GetMembers" DATASOURCE="Your DSN">
Select *
From Newsletter
<CFIF Form.EmailType EQ "1">
WHERE EmailType = 1
<CFELSE>
WHERE EmailType = 0
</CFIF>
Order By MemberID
</CFQUERY>


<CFLOOP QUERY="GetMembers">
<!--- Determine if email going out will be in HTML format or not --->
<CFIF #Form.EmailType# EQ "1">
<CFMAIL To="#GetMembers.Email#"
From="newsletter@menofvisionent.com"
Subject="This Week's Newsletter!">
#GetMembers.Message#
Sent: #DateFormat(Now(), 'ddd. mmmm dd, yyyy')#
to Unsubcribe visit: http://www.menofvisionent.com/unsubscribe.cfm
</CFMAIL>
<CFELSE>
<CFMAIL To="#GetMembers.Email#"
From="newsletter@menofvisionent.com"
Subject="This Week's Newsletter!"
type="HTML">
#GetMembers.Message#
Sent: #DateFormat(Now(), 'ddd. mmmm dd, yyyy')#
to Unsubcribe visit: http://www.menofvisionent.com/unsubscribe.cfm
</CFMAIL>
</CFIF>
</CFLOOP>


<CFELSE>
<form action="sendnewsletter.cfm" method="post">
The Message: <Textarea Name="Message"></textarea><BR>
Send as:
Text <input type="Radio" name="EmailType" value="1">
HTML <input type="Radio" name="EmailType" value="0"><br>
<input type="Submit" Value="Mail Newsletter">
</FORM>
</CFIF>