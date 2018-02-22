class profile::base {
  if $facts['os']['family'] == 'windows' {
    include profile::prod_wsus
    include profile::windows_basic
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
    package { 'unzip':
      ensure => 'present',
      name   => 'unzip'
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
