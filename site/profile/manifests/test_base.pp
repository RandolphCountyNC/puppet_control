class profile::test_base {
  ## This is the default profile for Test machines applied from Foreman
  if $facts['os']['family'] == 'windows' {
    include profile::test_wsus
    include profile::windows_basic
    if $facts['iis_version'] {
        warning('Has IIS, including base IIS config')
        include profile::iis
    }
    include packages::basic_windows_packages
    include packages::test_windows_packages
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
