class users::dmz_users {
  create_resources('user', lookup('dmz_users'))
  user { 'dpdgs':
    ensure => 'absent',
  }
  user { 'dpmtr':
    ensure => 'absent',
  }
  user { 'dpjcm':
    ensure => 'absent',
  }
  user { 'dptom':
    ensure => 'absent',
  }
}
