class packages::test_windows_packages {
  file { 'WindowsAgentRandolph_x64.msi' :
    ensure => 'file',
    path   => 'C:\\Ziptemp\\WindowsAgentRandolph_x64.msi',
    source => 'puppet:///modules/scripts/files/WindowsAgentRandolph_x64.msi',
    mode   => '0774',
  }
  package { 'traps' :
    ensure   => present,
    provider => 'windows',
    source   => 'C:\\Ziptemp\\WindowsAgentRandolph_x64.msi',
    require  => File['WindowsAgentRandolph_x64.msi'],
  }
}