class profile::puppet_master{
  class { 'hiera':
    hierachy => [
      'secure',
      '%{fqdn}',
      '%{environment}',
      'common',
      'accounts',
      ],
    eyaml    =>  true,
  }
}
