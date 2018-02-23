class users::dmz_users {
  user {'itdgs':
      ensure     => present,
      name       => 'itdgs',
      groups     => ['Users','Administrators'],
      password   => 'plaintext_I_know_gross-use-hiera-or-blackbox',
      managehome => true,
  }
}
