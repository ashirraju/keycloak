<#-- InvestLab Keycloak Password Reset Template -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${properties.pageTitle!properties.brandName!"InvestLab"} - ${msg("emailForgotTitle")!"Reset Password"}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
    <script>
      (function() {
        var storedTheme = localStorage.getItem('investlab_theme');
        if (!storedTheme) {
          storedTheme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
        }
        document.documentElement.setAttribute('data-theme', storedTheme);
      })();
    </script>
  </head>
  <body>
    <div class="page-shell">
      <header class="header-top">
        <div class="brand-logo-wrap">
          <span class="brand-logo-text"><span class="logo-invest">Invest</span><span class="logo-lab">Lab</span></span>
        </div>
        <button type="button" class="theme-toggle-btn" id="themeToggle" aria-label="Toggle dark/light theme">
          <span class="theme-icon light-icon" aria-hidden="true">☀️ Light</span>
          <span class="theme-icon dark-icon" aria-hidden="true" style="display:none;">🌙 Dark</span>
        </button>
      </header>

      <main class="main_wrapper">
        <div class="layout-grid single-card-grid">
          <section class="auth-card">
            <h2 class="sub_title_1 mb-2">${msg("emailForgotTitle")!"Forgot Password?"}</h2>
            <p class="paragraph mb-4">Enter your username or email address and we'll send you instructions to reset your password.</p>

            <#if (message?default('') != '')>
              <div class="kc-feedback-text">${message}</div>
            <#elseif (formMessage?default('') != '')>
              <div class="kc-feedback-text">${formMessage}</div>
            <#elseif (errors?default([])?size?number > 0)>
              <#list errors as e>
                <div class="kc-feedback-text">${e}</div>
              </#list>
            </#if>

            <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
              <div class="form-group">
                <label for="username" class="required">Username or Email</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                      <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                  </span>
                  <input id="username" name="username" type="text" value="${(auth.attemptedUsername!'')}" required placeholder="you@example.com" autofocus autocomplete="username" />
                </div>
              </div>

              <button class="btn btn_primary w_100 btn_lg" type="submit" style="margin-top: 12px;">${msg("doSubmit")!"Send Reset Instructions"}</button>

              <p class="paragraph text_center" style="margin-top: 24px;">
                Remembered your password? <a class="link" href="${url.loginUrl}">Back to Login</a>
              </p>
            </form>
          </section>
        </div>
      </main>

      <footer class="page-footer">
        <span>&copy; 2026 <span class="brand-invest">Invest</span><span class="brand-lab">Lab</span> – Learn, Practice, Analyze, Then Invest. All rights reserved.</span>
      </footer>
    </div>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var toggleBtn = document.getElementById('themeToggle');
        var lightIcon = toggleBtn.querySelector('.light-icon');
        var darkIcon = toggleBtn.querySelector('.dark-icon');

        function updateToggleDisplay(theme) {
          if (theme === 'dark') {
            lightIcon.style.display = 'none';
            darkIcon.style.display = 'inline';
          } else {
            lightIcon.style.display = 'inline';
            darkIcon.style.display = 'none';
          }
        }

        var currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
        updateToggleDisplay(currentTheme);

        toggleBtn.addEventListener('click', function() {
          var activeTheme = document.documentElement.getAttribute('data-theme') || 'light';
          var nextTheme = activeTheme === 'dark' ? 'light' : 'dark';
          document.documentElement.setAttribute('data-theme', nextTheme);
          localStorage.setItem('investlab_theme', nextTheme);
          updateToggleDisplay(nextTheme);
        });
      });
    </script>
  </body>
</html>
