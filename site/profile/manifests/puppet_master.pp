class profile::puppet_master{
  class { 'hiera':
    hierarchy => [
      '%{fqdn}',
      '%{osfamily}',
      '%{environment}',
      'common',
      'accounts',
      ],
    eyaml     =>  true,
  }
}
