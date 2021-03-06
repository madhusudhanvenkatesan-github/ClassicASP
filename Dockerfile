# escape=`
FROM microsoft/iis:windowsservercore-ltsc2016
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Install-WindowsFeature Web-ASP; `
    Remove-Website -Name 'Default Web Site'; `
    md C:\AspBB; `
    New-Website -Name web-app -Port 80 -PhysicalPath C:\AspBB
COPY .\src C:\AspBB 