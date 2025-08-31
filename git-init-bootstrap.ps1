# git-init-bootstrap.ps1
# Init git, set main, create feature/bootstrap, first commit.

function Require-Tool($n){ if(-not (Get-Command $n -ErrorAction SilentlyContinue)){ Write-Error "Missing: $n"; exit 1 } }
Require-Tool git

if (-not (Test-Path ".\.git")) { git init | Out-Null }

git checkout -B main      | Out-Null
git checkout -B feature/bootstrap | Out-Null

git add .
git commit -m "Bootstrap scaffold + populated files (index.html, .gitignore, docs/NEXT_ACTIONS.md, PROJECT_SNAPSHOT.md)"

Write-Host "✅ Git ready. Current branch: feature/bootstrap"
