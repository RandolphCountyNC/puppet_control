REM Commands to run to reset WSUS client after Clone
net stop wuauserv
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v PingID /f
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v AccountDomainSid /f
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v SusClientId /f
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v SusClientIDValidation /f
net start wuauserv
wuauclt.exe /resetauthorization /detectnow
REM Leave a breadcrumb for Puppet to check for next run
copy /y nul C:\.wsusreset
