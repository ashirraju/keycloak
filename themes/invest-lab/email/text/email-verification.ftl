<#import "template.ftl" as layout>
<@layout.emailLayout>
ACTIVATE YOUR INVESTLAB ACCOUNT

Hello <#if user??>${user.firstName!user.username!"Trader"}<#else>Trader</#if>,

Welcome to InvestLab! Please verify and activate your account by clicking the link below:

${link}

Link Expiration: ${msg("emailExpirationNotice", linkExpirationFormatter(linkExpiration))!"This link will expire soon."}

If you did not sign up for an InvestLab account, you can safely ignore this email.
</@layout.emailLayout>
