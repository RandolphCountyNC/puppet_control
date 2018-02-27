class profile::puppet_master{
  class { 'hiera':
    hiera_version   =>  '5',
    hiera5_defaults =>  {'datadir' => '/etc/puppetlabs/code/environments/%{::environment}/hieradata', 'data_hash' => 'yaml_data'},
    hierarchy       =>  [
                          {'name' =>  'Virtual yaml', 'path'  =>  'virtual/%{::virtual}.eyaml'},
                          {'name' =>  'Nodes yaml', 'paths' =>  ['nodes/%{::trusted.certname}.yaml', 'nodes/%{::osfamily}.eyaml']},
                          {'name' =>  'Default yaml file', 'path' =>  'common.eyaml'},
                          {'name' =>  'Accounts', 'path' =>  'accounts.eyaml'},
                        ],
    eyaml           =>  true,
  }
}
