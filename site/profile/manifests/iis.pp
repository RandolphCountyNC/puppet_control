class profile::iis {
  if $facts['os']['family'] == 'windows' {
        $iislogcleanup = 'CleanIISLogs.ps1'
        $powershellexe = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
        $iislogcleanuppath = "C:/Scripts/${iislogcleanup}"
        # Copy CleanIISLogs.ps1 to C:\Scripts
        file { 'clean_iis_logs':
              ensure => file,
              path   => $iislogcleanuppath,
              source => "puppet:///modules/scripts/${iislogcleanup}"
        }
        scheduled_task { 'CleanIISLogs_Task':
          ensure    => present,
          enabled   => true,
          command   => $powershellexe,
          arguments => $iislogcleanuppath,
          trigger   => {
            schedule         => daily,
            every            => 1, # Specifies every other day. Defaults to 1 (every day).
            #start_date      => '2011-08-31', # Defaults to 'today'
            start_time       => '04:00', # Must be specified
            #minutes_interval=> '60', # Repeat this task every 60 minutes
            minutes_duration => '300', # The task will run for a total of five hours
        }
      }
  }
}
