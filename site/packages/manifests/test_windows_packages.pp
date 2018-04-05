class packages::test_windows_packages {
  file { 'WindowsAgentRandolph_x64.msi' :
    ensure => 'file',
    path   => 'C:/Ziptemp/WindowsAgentRandolph_x64.msi',
    source => 'puppet:///modules/msi/WindowsAgentRandolph_x64.msi',
    mode   => '0774',
  }
  package { 'Traps 5.0.0.34309' :
    ensure   => absent,
    provider => 'windows',
    source   => 'C:/Ziptemp/WindowsAgentRandolph_x64.msi',
    require  => File['WindowsAgentRandolph_x64.msi'],
  }
}
