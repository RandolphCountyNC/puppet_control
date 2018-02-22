#Script for cleaning up IIS logs and retain 14 days.  All IIS logs are stored in Graylog or should be.

forfiles /p "C:\inetpub\logs\" /s /m *.* /c "cmd /c Del @path" /d -14