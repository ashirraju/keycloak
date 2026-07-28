<#import "template.ftl" as layout>
<@layout.emailLayout>
RESET YOUR PASSWORD

Hello <#if user??>${user.firstName!user.username!"Trader"}<#else>Trader</#if>,

We received a request to reset the password for your InvestLab account. Click the link below to set a new password:

${link}

Link Expiration: ${msg("emailExpirationNotice", linkExpirationFormatter(linkExpiration))!"This link will expire soon."}

If you didn't request a password reset, you can safely ignore this email. Your password will remain unchanged.
</@layout.emailLayout>
