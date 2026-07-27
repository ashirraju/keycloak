<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>${properties.pageTitle!properties.brandName!"InvestLab"} - Error</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
    <style>
      :root{
        --bg1:${properties.colorBackgroundStart!"#0b0f13"};
        --bg2:${properties.colorBackgroundEnd!"#071018"};
        --card:${properties.colorCard!"rgba(255, 255, 255, 0.03)"};
        --muted:${properties.colorMuted!"#9aa5b1"};
        --accent:${properties.colorAccent!"#00c853"};
      }
    </style>
  </head>
  <body>
    <div style="padding:40px;max-width:720px;margin:40px auto;background:rgba(0,0,0,0.5);border-radius:8px;color:#fff;">
      <h1>Something went wrong</h1>
      <#if message?default('') != ''>
        <div class="kc-feedback-text">${message}</div>
      <#elseif error?default('') != ''>
        <div class="kc-feedback-text">${error}</div>
      <#else>
        <div class="kc-feedback-text">An unexpected error occurred.</div>
      </#if>
      <p><a href="${url.loginUrl}">Return to login</a></p>
    </div>
  </body>
</html>
