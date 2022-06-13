<CFIF IsDefined("Email")>

<!--- Insert Member Information Into Database --->
<CFINSERT DATASOURCE="YourDSN" TABLENAME="Newsletter" Formfields="Name, Email, Subscribe, EmailType">

<CFOUTPUT>
Thank you #Name#,
Your email address [#Email#] Has been entered into our mailing list. You'll receive the next mailing!
</CFOUTPUT>

<CFELSE>
 
<!--- Prompt User To Enter information --->

<form action="Subscribe.cfm" method="post">
Name: <input type="Text" Value="" Name="Name"><BR>
Email: <input type="Text" Value="" Name="Email"><BR>
Receive in: Text <input type="Radio" name="EmailType" value="1"> HTML <input type="Radio" name="EmailType" value="0">
<input type="Submit" Value="Join Newsletter">
</FORM>

</CFIF>