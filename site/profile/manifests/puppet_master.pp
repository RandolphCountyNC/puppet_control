class profile::puppet_master{
  class { 'hiera':
    hierarchy => [
      'secure',
      '%{fqdn}',
      '%{environment}',
      'common',
      'accounts',
      ],
    eyaml     =>  true,
  }
}
