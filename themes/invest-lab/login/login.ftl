<#-- InvestLab Keycloak Login Template -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${properties.pageTitle!properties.brandName!"InvestLab"} - ${msg("loginTitle")!"Login"}</title>
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
          <img src="${url.resourcesPath}/img/logo.svg" alt="${properties.brandName!"InvestLab"}" />
        </div>
        <button type="button" class="theme-toggle-btn" id="themeToggle" aria-label="Toggle dark/light theme">
          <span class="theme-icon light-icon" aria-hidden="true">☀️ Light</span>
          <span class="theme-icon dark-icon" aria-hidden="true" style="display:none;">🌙 Dark</span>
        </button>
      </header>

      <main class="main_wrapper">
        <div class="layout-grid">
          <!-- Left Promo Section -->
          <aside class="promo-section">
            <div class="promo-content">
              <span class="tagline-badge">${properties.brandTagline!"InvestLab – Learn, Practice, Analyze, Then Invest."}</span>
              <h1>${properties.heroTitle!"Trade Smarter."} <span>${properties.heroTitleAccent!"Invest Better."}</span></h1>
              <p>${properties.heroSubtitle!"Your all-in-one platform for real-time market data, smart analysis, and seamless trading."}</p>
            </div>
            <ul class="promo-features">
              <li>
                <div class="feature-badge" aria-hidden="true">
                  <svg viewBox="0 0 24 24">
                    <path d="M3 17l6-6 4 4 8-8" />
                    <path d="M14 7h7v7" />
                  </svg>
                </div>
                <div class="feature-text">
                  <strong>${properties.featureOneTitle!"Real-time Data"}</strong>
                  <span>${properties.featureOneBody!"Live market updates at your fingertips."}</span>
                </div>
              </li>
              <li>
                <div class="feature-badge" aria-hidden="true">
                  <svg viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="9" />
                    <path d="M12 7v5l3 3" />
                  </svg>
                </div>
                <div class="feature-text">
                  <strong>${properties.featureTwoTitle!"Smart Analytics"}</strong>
                  <span>${properties.featureTwoBody!"Powerful tools for better decision making."}</span>
                </div>
              </li>
              <li>
                <div class="feature-badge" aria-hidden="true">
                  <svg viewBox="0 0 24 24">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
                  </svg>
                </div>
                <div class="feature-text">
                  <strong>${properties.featureThreeTitle!"Secure & Reliable"}</strong>
                  <span>${properties.featureThreeBody!"Bank-grade security for your peace of mind."}</span>
                </div>
              </li>
            </ul>
          </aside>

          <!-- Right Login Card -->
          <section class="auth-card">
            <h2 class="sub_title_1 mb-2">${msg("welcome")!"Welcome"}</h2>
            <p class="paragraph mb-4">Login to continue to <span class="brand-invest">Invest</span><span class="brand-lab">Lab</span></p>

            <#if (message?default('') != '')>
              <div class="kc-feedback-text">${message}</div>
            <#elseif (formMessage?default('') != '')>
              <div class="kc-feedback-text">${formMessage}</div>
            <#elseif (errors?default([])?size?number > 0)>
              <#list errors as e>
                <div class="kc-feedback-text">${e}</div>
              </#list>
            <#elseif (auth?default({}).error?default('') != '')>
              <div class="kc-feedback-text">${auth.error}</div>
            </#if>

            <form id="kc-form-login" action="${url.loginAction}" method="post">
              <input type="hidden" name="session_code" value="${sessionCode?default('')}" />
              <input type="hidden" name="client_id" value="${clientId?default('')}" />
              <input type="hidden" name="tab_id" value="${tabId?default('')}" />

              <div class="form-group">
                <label for="username" class="required">Email or Username</label>
                <div class="input-shell">
                  <span class="input-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24">
                      <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                      <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                  </span>
                  <input id="username" name="username" type="text" value="${username!}" autocomplete="username" placeholder="you@example.com" required />
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
                  <input id="password" name="password" type="password" autocomplete="current-password" placeholder="Enter your password" required />
                </div>
              </div>

              <div class="form-row">
                <label class="remember-label">
                  <input type="checkbox" name="rememberMe" />
                  <span>Remember me</span>
                </label>
                <a class="link small" href="${url.loginResetCredentialsUrl}">Forgot Password?</a>
              </div>

              <button class="btn btn_primary w_100 btn_lg" type="submit">${msg("doLogIn")!"Login"}</button>

              <div class="divider-or"><span>or</span></div>

              <button type="button" class="btn btn_outline_secondary w_100" style="display:flex;align-items:center;justify-content:center;gap:10px;">
                <svg width="18" height="18" viewBox="0 0 24 24">
                  <path fill="#4285F4" d="M21.8 12.2c0-.8-.1-1.6-.2-2.3H12v4.3h5.5a4.7 4.7 0 0 1-2 3.1v2.6h3.3c1.9-1.8 3-4.4 3-7.7z" />
                  <path fill="#34A853" d="M12 22c2.7 0 4.9-.9 6.6-2.5l-3.3-2.6c-.9.6-2 .9-3.3.9-2.5 0-4.6-1.7-5.3-4H3.3v2.7A10 10 0 0 0 12 22z" />
                  <path fill="#FBBC05" d="M6.7 13.8A6 6 0 0 1 6.4 12c0-.6.1-1.2.3-1.8V7.5H3.3A10 10 0 0 0 2.2 12c0 1.6.4 3.1 1.1 4.5l3.4-2.7z" />
                  <path fill="#EA4335" d="M12 6.2c1.5 0 2.8.5 3.9 1.5l2.9-2.9A9.8 9.8 0 0 0 12 2a10 10 0 0 0-8.7 5.5l3.4 2.7c.7-2.3 2.8-4 5.3-4z" />
                </svg>
                <span>Continue with Google</span>
              </button>

              <p class="paragraph text_center" style="margin-top: 24px;">
                Don't have an account? <a class="link" href="${url.registrationUrl}">Sign up</a>
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
