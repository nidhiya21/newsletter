<CFIF IsDefined("Email")>
<CFQUERY DATASOURCE="YourDSN" NAME="Unsubscribe">
DELETE *
From Newsletter
Where Email = '#Email#'
</CFQUERY>

<CFOUTPUT>
<CFIF Unsubscribe.recordcount GTE "1">
Thank you #Name#,
Your email address [#Email#] Has been removed from our mailing list. You'll never receive mailing again!
<CFELSE>
We're sorry, your email address could not be found! <a href="Javascript:history.go(-1)">try again</a>?
</CFIF>
</CFOUTPUT>

<CFELSE>

<form action="unsubscribe.cfm" method="post">
Name: <input type="Text" Value="" Name="Name"><BR>
Email: <input type="Text" Value="" Name="Email"><BR>
<input type="Submit" Value="Join">
</FORM>

</CFIF>