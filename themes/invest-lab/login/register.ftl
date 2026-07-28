<#-- InvestLab Keycloak Registration Template -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${properties.pageTitle!properties.brandName!"InvestLab"} - ${msg("registerTitle")!"Register"}</title>
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
            <h2 class="sub_title_1 mb-2">${msg("registerTitle")!"Create Account"}</h2>
            <p class="paragraph mb-4">Join <span class="brand-invest">Invest</span><span class="brand-lab">Lab</span> to start trading smarter</p>

            <#if (message?default('') != '')>
              <div class="kc-feedback-text">${message}</div>
            <#elseif (formMessage?default('') != '')>
              <div class="kc-feedback-text">${formMessage}</div>
            <#elseif (errors?default([])?size?number > 0)>
              <#list errors as e>
                <div class="kc-feedback-text">${e}</div>
              </#list>
            </#if>

            <form id="kc-register-form" action="${url.registrationAction}" method="post">
              <div class="form-group">
                <label for="firstName" class="required">First Name</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                      <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                  </span>
                  <input id="firstName" name="firstName" type="text" value="${(register.formData.firstName!'')}" required placeholder="First name" />
                </div>
              </div>

              <div class="form-group">
                <label for="lastName" class="required">Last Name</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                      <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                  </span>
                  <input id="lastName" name="lastName" type="text" value="${(register.formData.lastName!'')}" required placeholder="Last name" />
                </div>
              </div>

              <div class="form-group">
                <label for="email" class="required">Email Address</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                      <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                  </span>
                  <input id="email" name="email" type="email" value="${(register.formData.email!'')}" required placeholder="you@example.com" autocomplete="email" />
                </div>
              </div>

              <div class="form-group">
                <label for="username" class="required">Username</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <circle cx="12" cy="12" r="10"></circle>
                      <path d="M12 8v4M12 16h.01"></path>
                    </svg>
                  </span>
                  <input id="username" name="username" type="text" value="${(register.formData.username!'')}" required placeholder="Choose a username" autocomplete="username" />
                </div>
              </div>

              <div class="form-group">
                <label for="password" class="required">Password</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                      <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                  </span>
                  <input id="password" name="password" type="password" required placeholder="Create a strong password" autocomplete="new-password" />
                </div>
              </div>

              <div class="form-group">
                <label for="password-confirm" class="required">Confirm Password</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                      <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                  </span>
                  <input id="password-confirm" name="password-confirm" type="password" required placeholder="Confirm your password" autocomplete="new-password" />
                </div>
              </div>

              <button class="btn btn_primary w_100 btn_lg" type="submit" style="margin-top: 10px;">${msg("doRegister")!"Create Account"}</button>

              <p class="paragraph text_center" style="margin-top: 24px;">
                Already have an account? <a class="link" href="${url.loginUrl}">Log in</a>
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
