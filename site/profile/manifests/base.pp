class profile::base {
  if $facts['os']['family'] == 'windows' {
    include profile::prod_wsus
    include profile::windows_basic
    if $facts['iis_version'] {
        warning('Has IIS, including base IIS config')
        include profile::iis
    }
    include packages::basic_windows_packages
  }
  elsif $facts['os']['family'] == 'RedHat' {
    warning('WSUS not needed')
    include packages::basic_linux_packages
  }
  elsif $facts['osfamily'] == 'Debian' {
    warning('WSUS not needed')
    include packages::basic_linux_packages
  }
  else {
    #
  }
  service { 'puppet':
      ensure => 'running',
      enable => true,
    }
}
