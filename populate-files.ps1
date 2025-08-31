# populate-files.ps1
# Populates .gitignore, index.html (bare shell), and docs/NEXT_ACTIONS.md

# 1) .gitignore
@"
# System
.DS_Store
Thumbs.db
*.log

# Envs (future-proof)
node_modules/
venv/

# Project-specific
archive/
"@ | Set-Content -Path ".\.gitignore"

# 2) index.html (barebones shell)
@"
<!DOCTYPE html>
<html lang=""en"">
<head>
  <meta charset=""utf-8"" />
  <meta name=""viewport"" content=""width=device-width, initial-scale=1"" />
  <title>IssueSmith (MVP shell)</title>
  <style>
    body { margin:0; font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell;
           background:#0b0d10; color:#e8eef6; }
    .app { max-width: 1100px; margin: 0 auto; padding: 16px; }
    .panel { background:#12161b; border:1px solid #1c232b; border-radius:14px; padding:12px; }
    input, button, textarea { background:#0c1116; color:#e8eef6; border:1px solid #243140; border-radius:8px; padding:8px 10px; }
  </style>
</head>
<body>
  <div class=""app"">
    <h1>IssueSmith <span style=""font-size:12px;color:#9aa4af;"">MVP shell</span></h1>
    <div class=""panel"">
      <p>This is a placeholder UI shell. In the full build, you’ll upload a list of issues and generate GitHub issues via script.</p>
    </div>
  </div>
</body>
</html>
"@ | Set-Content -Path ".\index.html"

# 3) docs/NEXT_ACTIONS.md (seed list)
if (!(Test-Path ".\docs")) { New-Item -ItemType Directory -Path ".\docs" | Out-Null }
@"
# Next Actions — IssueSmith (V1)

## Repo polish
- [ ] Create GitHub README.md (features, usage, roadmap)
- [ ] Add license (MIT/Apache)
- [ ] Add screenshot/GIF to \`assets/\`

## QA & Testing
- [ ] Define sample input formats for issue lists
- [ ] Dry-run mode for issue creation
- [ ] Error handling + logs

## Process / RoleOS meta
- [ ] Capture bootstrap steps for automation
"@ | Set-Content -Path ".\docs\NEXT_ACTIONS.md"

Write-Host "✅ Files populated: .gitignore, index.html, docs/NEXT_ACTIONS.md"
