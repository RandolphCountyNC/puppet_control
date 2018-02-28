class profile::dmz {
  if $facts['os']['family'] == 'windows' {
    if $facts['domain_membership_custom'] != 'co.randolph.nc.us' {
      include users::dmz_users
    }
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
      ensure => 'abenst',
      path   => 'C:/Ziptemp/Puppet',
      force  => true,
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
