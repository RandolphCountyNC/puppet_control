class profile::dmz {
  include users::dmz_users
  if $facts['os']['family'] == 'windows' {
    #disable RDP
    service { 'UmRdpService':
      ensure => 'stopped',
      enable => false,
    }
    service { 'TermService':
      ensure => 'stopped',
      enable => false,
    }
    #clean up from install
    file { 'C:/Ziptemp/Puppet':
      ensure  => 'abenst',
      path    => 'C:/Ziptemp/Puppet',
      recurse => true,
    }
  }
  elsif $facts['os']['family'] == 'RedHat' {

  }
  elsif $facts['osfamily'] == 'Debian' {

  }
  else {
    #
  }
}
