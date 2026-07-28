<#macro emailLayout>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>${msg("emailTitle")!properties.brandName!"InvestLab"}</title>
  <style type="text/css">
    /* Email Reset & Base Styles */
    body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }
    table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }
    img { -ms-interpolation-mode: bicubic; border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }
    table { border-collapse: collapse !important; }
    body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; background-color: #0b0f17; color: #f8fafc; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; }
    
    /* Responsive Breakpoints */
    @media screen and (max-width: 600px) {
      .email-container { width: 100% !important; padding: 10px !important; }
      .email-card { padding: 24px 18px !important; }
      .cta-button { width: 100% !important; text-align: center !important; box-sizing: border-box !important; }
    }
  </style>
</head>
<body style="margin: 0; padding: 0; background-color: #0b0f17; color: #f8fafc; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;">
  <!-- Main Background Wrapper -->
  <table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color: #0b0f17; min-height: 100vh; padding: 40px 0;">
    <tr>
      <td align="center" valign="top">
        <!-- Center Container (600px max) -->
        <table border="0" cellpadding="0" cellspacing="0" width="600" class="email-container" style="max-width: 600px; width: 100%; margin: 0 auto;">
          
          <!-- Header / Brand Logo -->
          <tr>
            <td align="center" style="padding: 0 0 32px 0;">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center">
                    <a href="#" style="text-decoration: none; display: inline-block;">
                      <span style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; font-size: 32px; font-weight: 800; letter-spacing: -0.5px;">
                        <span style="color: #0296e0;">Invest</span><span style="color: #25c293;">Lab</span>
                      </span>
                    </a>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <!-- Main Email Card -->
          <tr>
            <td align="left" style="background-color: #161e2e; border: 1px solid #26334d; border-radius: 16px; padding: 40px; box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);" class="email-card">
              <#nested>
            </td>
          </tr>

          <!-- Footer Section -->
          <tr>
            <td align="center" style="padding: 32px 20px 0 20px; color: #64748b; font-size: 13px; line-height: 20px; text-align: center;">
              <p style="margin: 0 0 8px 0; color: #94a3b8; font-weight: 500;">
                InvestLab – Learn, Practice, Analyze, Then Invest.
              </p>
              <p style="margin: 0 0 16px 0;">
                This email was sent automatically by ${realmName!properties.brandName!"InvestLab"}. Please do not reply directly to this email.
              </p>
              <p style="margin: 0;">
                © 2026 ${properties.companyName!"InvestLab Inc."}. All rights reserved.
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>
</#macro>
