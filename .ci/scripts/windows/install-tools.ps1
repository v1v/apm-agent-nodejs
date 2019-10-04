# Abort with non zero exit code on errors
$ErrorActionPreference = "Stop"

Write-Host "Getting latest Nodejs version..."
$Version = $(choco list nodejs --by-id-only --all) | Select-String -Pattern "nodejs $env:VERSION" | %{$_.ToString().split(" ")[1]} | sort {[version] $_} | Select-Object -Last 1

Write-Host "Installing Nodejs..."
& choco install nodejs --no-progress -y --version "$Version"

Write-Host "Installing JDK8..."
& choco install adoptopenjdk8jre --no-progress -y --force -params 'installdir=c:\\java'
