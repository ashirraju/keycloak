<#import "template.ftl" as layout>
<@layout.emailLayout>
TEAM INVITATION

Hello <#if user??>${user.firstName!user.username!"Trader"}<#else>Trader</#if>,

You have been invited to join <#if organization??>${organization.name}<#else>an organization</#if> on InvestLab.

Click the link below to accept your invitation:

${link}

Link Expiration: ${msg("emailExpirationNotice", linkExpirationFormatter(linkExpiration))!"This link will expire soon."}

If you were not expecting an invitation, you can safely ignore this email.
</@layout.emailLayout>
