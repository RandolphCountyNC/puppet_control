class profile::management_base {
  include test_wsus
  service { 'puppet':
      ensure => 'running',
      enable => true,
    }
}
