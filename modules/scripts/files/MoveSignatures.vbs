Set FSO = CreateObject("Scripting.FileSystemObject")

ArrFolderName = Array("Administration","BuildingInspections","ComputerServices","DRC","SocialServices","Elections","EmergencyServices","Finance","HealthDepartment","Library","Maintenance","Personnel","Planning","PublicWorks","RCSO","Tax")

For Each FolderName In ArrFolderName

Folder = "\\rcimage01\d$\Signatures\" & FolderName & "\Temp\"


	For Each Sig In FSO.GetFolder(Folder).Files

		OrigFile = FSO.GetAbsolutePathName(Sig)
		OrigFileName = FSO.GetFileName(Sig)

		UserName = Replace(OrigFileName, ".BMP", "",1,1,1)

		POS1 = InStr(1, UserName, "_")

		If POS1 > 0 Then
			UserName = Left(UserName, POS1 - 1)
		End If

		On Error Resume Next

		strDestFolder = "\\rcimage01\d$\Signatures\" & FolderName & "\" & UCase(UserName)
'		Create the signature folder
		If Not FSO.FolderExists(strDestFolder) Then
			If UserName <> "Thumbs.db" Then
				'Wscript.Echo UserName
				'Wscript.Echo "Folder doesn't exist: " & strDestFolder

				FSO.CreateFolder(strDestFolder)

				Set oShell = CreateObject("Wscript.Shell")

				oShell.Run "C:\WINDOWS\SYSTEM32\xcacls.exe " & strDestFolder & " /P ""RCOB\Domain Admins"":F /Y",0,True

				oShell.Run "C:\WINDOWS\SYSTEM32\xcacls.exe " & strDestFolder & " /E /G RCOB\" & UserName & ":R /Y",0,True

				Set oShell = Nothing
			End If
		End If
		FSO.CopyFile OrigFile, "\\rcimage01\d$\Signatures\" & FolderName & "\" & UserName & "\" & OrigFileName

		If Err Then
		Else
			FSO.DeleteFile OrigFile
		End If

		If Err Then
			PrettyDate = Replace(Date, "/", "_")

			FSO.MoveFile "\\rcimage01\d$\Signatures\" & FolderName & "\" & UserName & "\" & OrigFileName, "\\rcimage01\d$\Signatures\" & FolderName & "\" & UserName & "\Bak-" & PrettyDate & "-" & OrigFileName
			FSO.CopyFile OrigFile, "\\rcimage01\d$\Signatures\" & FolderName & "\" & UserName & "\" & OrigFileName
			FSO.DeleteFile
		End If

'		Set Permissions on files - Domain Admin: Full - User: Read
'		Set oShell = CreateObject("Wscript.Shell")
'		oShell.Run "C:\WINDOWS\SYSTEM32\xcacls.exe " & strDestFolder & OrigFileName & " /P ""RCOB\Domain Admins"":F /Y",0,True

'		oShell.Run "C:\WINDOWS\SYSTEM32\xcacls.exe " & strDestFolder & OrigFileName & " /E /G RCOB\" & UserName & ":R /Y",0,True

'		oShell.Run "cscript.exe c:\windows\system32\xcacls.vbs \\rcimage01\d$\Signatures\" & FolderName & "\" & UserName & "\" & OrigFileName & " /G ""RCOB\Domain Admins"":F /S",0,True

'		oShell.Run "cscript.exe c:\windows\system32\xcacls.vbs \\rcimage01\d$\Signatures\" & FolderName & "\" & UserName & "\" & OrigFileName & "  /E /G RCOB\" & UserName & ":R",0,True

'		oShell.Run "cscript.exe c:\windows\system32\xcacls.vbs \\rcimage01\d$\Signatures\" & FolderName & "\" & UserName & "\" & OrigFileName & "  /E /G RCOB\" & UserName & ":L",0,True

'		Set oShell = Nothing

	Next


Next

Set FSO = Nothing

Wscript.Quit
