class profile::document_imaging{
  #Code for docproc03
  node 'docproc03.co.randolph.nc.us' {
    $movesigscript = 'MoveSigFiles.ps1'
    $powershellexe = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
    $movesigpath = "C:/Scripts/${movesigscript}"
    # Copy MoveSigFiles.ps1 to C:\Scripts
    file { 'move_sig_files':
          ensure => file,
          path   => $movesigpath,
          source => "puppet:///modules/scripts/${movesigscript}"
    }
    scheduled_task { 'MoveSigFiles_Task':
      ensure    => present,
      enabled   => true,
      command   => $powershellexe,
      arguments => $movesigpath,
      trigger   => {
        schedule         => daily,
        every            => 1, # Specifies every other day. Defaults to 1 (every day).
        #start_date      => '2011-08-31', # Defaults to 'today'
        start_time       => '04:00', # Must be specified
        minutes_interval => '60', # Repeat this task every 60 minutes
        minutes_duration => '300', # The task will run for a total of five hours
    }
  }
}
