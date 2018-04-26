$SigFolders = Get-ChildItem \\rcobfs01\DeptSigs\

ForEach ($SigFolder in $SigFolders) {
    #Write-Host $SigFolder.FullName
    $TempSigFiles = Get-ChildItem -Path ($SigFolder.FullName + '\Temp\')
    ForEach ($TempSigFile in $TempSigFiles) {
        
        if ($TempSigFile.Name -Match '^([a-z]|[A-Z])+(?<!\.|_)') {
            $UserFolder = ($SigFolder.FullName + '\' + $Matches[0]).ToUpper()
            $NewSigPath = ($UserFolder + '\' + $TempSigFile.Name).ToUpper()
             #Write-Host $NewSigPath
             if(!(Test-Path -Path $UserFolder )){
                    New-Item -ItemType directory -Path $UserFolder
                }
             $TempSigFile.MoveTo($NewSigPath)

        }
    }


}