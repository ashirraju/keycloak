<#import "template.ftl" as layout>
<@layout.emailLayout>
<!-- Icon Badge Header -->
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 24px;">
  <tr>
    <td>
      <div style="display: inline-block; background: rgba(2, 150, 224, 0.12); border: 1px solid rgba(2, 150, 224, 0.3); border-radius: 12px; padding: 12px 16px;">
        <span style="font-size: 22px; line-height: 1;">⚡</span>
        <span style="color: #0296e0; font-weight: 700; font-size: 14px; margin-left: 8px; vertical-align: middle;">ACCOUNT SETUP</span>
      </div>
    </td>
  </tr>
</table>

<!-- Main Heading -->
<h1 style="color: #ffffff; font-size: 26px; font-weight: 700; margin: 0 0 16px 0; line-height: 1.3;">
  Complete Your InvestLab Account Setup
</h1>

<!-- Body Paragraphs -->
<p style="color: #cbd5e1; font-size: 15px; line-height: 1.6; margin: 0 0 16px 0;">
  Hello <strong style="color: #ffffff;"><#if user??>${user.firstName!user.username!"Trader"}<#else>Trader</#if></strong>,
</p>
<p style="color: #cbd5e1; font-size: 15px; line-height: 1.6; margin: 0 0 28px 0;">
  Your administrator has invited you to set up your <strong>InvestLab</strong> account. Click the button below to complete your account configuration and set your password:
</p>

<!-- CTA Button -->
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 28px;">
  <tr>
    <td align="center">
      <a href="${link}" class="cta-button" style="background: linear-gradient(135deg, #0296e0 0%, #0077b6 100%); color: #ffffff; font-size: 16px; font-weight: 700; text-decoration: none; padding: 16px 36px; border-radius: 10px; display: inline-block; box-shadow: 0 8px 20px rgba(2, 150, 224, 0.3); text-align: center;">
        Complete Account Setup →
      </a>
    </td>
  </tr>
</table>

<!-- Expiration Notice -->
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color: #0f172a; border-left: 4px solid #0296e0; border-radius: 6px; margin-bottom: 28px;">
  <tr>
    <td style="padding: 14px 18px; color: #94a3b8; font-size: 14px; line-height: 1.5;">
      ⏱️ <strong style="color: #f8fafc;">Link Expiration:</strong> ${msg("emailExpirationNotice", linkExpirationFormatter(linkExpiration))!"This link will expire soon."}
    </td>
  </tr>
</table>

<!-- Link Fallback Copy Box -->
<div style="background: #0f172a; border: 1px solid #1e293b; border-radius: 8px; padding: 16px; margin-bottom: 24px;">
  <p style="color: #64748b; font-size: 12px; margin: 0 0 8px 0; text-transform: uppercase; letter-spacing: 0.5px; font-weight: 600;">
    Or copy and paste this URL into your browser:
  </p>
  <p style="color: #0296e0; font-size: 13px; word-break: break-all; margin: 0; font-family: monospace;">
    <a href="${link}" style="color: #0296e0; text-decoration: underline;">${link}</a>
  </p>
</div>

<!-- Security Note -->
<p style="color: #64748b; font-size: 13px; line-height: 1.5; margin: 0; border-top: 1px solid #1e293b; padding-top: 20px;">
  🔒 <em>If you were not expecting this account invitation, please contact your administrator or ignore this email.</em>
</p>
</@layout.emailLayout>
