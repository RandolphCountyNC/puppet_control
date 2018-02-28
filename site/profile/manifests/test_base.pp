class profile::test_base {
  if $facts['os']['family'] == 'windows' {
    include profile::test_wsus
    include profile::windows_basic
    #Test Chocolatey installer
    include chocolatey
    package { 'notepadplusplus':
      ensure   => installed,
      provider => 'chocolatey',
    }
    if $facts['iis_version'] {
        warning('Has IIS, including base IIS config')
        include profile::iis
    }
  }
  elsif $facts['os']['family'] == 'RedHat' {
    warning('WSUS not needed')
    package { 'htop':
      ensure => 'present',
      name   => 'htop'
    }
  }
  elsif $facts['osfamily'] == 'Debian' {
    warning('WSUS not needed')
    package { 'htop':
      ensure => 'present',
      name   => 'htop'
    }
  }
  else {
    #
  }
  service { 'puppet':
      ensure => 'running',
      enable => true,
    }
}
