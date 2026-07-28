<#import "template.ftl" as layout>
<@layout.emailLayout>
COMPLETE YOUR INVESTLAB ACCOUNT SETUP

Hello <#if user??>${user.firstName!user.username!"Trader"}<#else>Trader</#if>,

Your administrator has invited you to set up your InvestLab account. Click the link below to complete your account setup and set your password:

${link}

Link Expiration: ${msg("emailExpirationNotice", linkExpirationFormatter(linkExpiration))!"This link will expire soon."}

If you were not expecting this account invitation, please contact your administrator or ignore this email.
</@layout.emailLayout>
