class profile::dmz {
  include users::dmz_users
  if $facts['os']['family'] == 'windows' {
    #disable RDP
    service { 'TermService':
      ensure => 'stopped',
      enable => false,
    }
    #clean up from install
    file { 'C:/Zimptemp/Puppet':
      ensure  => 'abenst',
      path    => 'C:/Zimptemp/Puppet',
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
