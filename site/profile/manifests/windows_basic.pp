class profile::windows_basic {
  # create Scripts directory
  file { 'C:/Scripts':
    ensure => 'directory',
  }
  $drive = 'C:'
  exec { 'disable-c-indexing':
    provider =>  powershell,
    command  =>  "\$wmi_volume = Get-WmiObject -Class Win32_Volume -Filter 'DriveLetter=\"${drive}\"'; if (\$wmi_volume.IndexingEnabled -ne \$True) { return }; \$wmi_volume | Set-WmiInstance -Arguments @{IndexingEnabled = \$False}",
    unless   =>  "if ((Get-WmiObject -Class Win32_Volume -Filter 'DriveLetter=\"${drive}\"').IndexingEnabled) { exit 1 }",
  }
}
