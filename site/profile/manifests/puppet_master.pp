class profile::puppet_master{
  class { 'hiera':
    hiera_version   =>  '5',
    hiera5_defaults =>  {'datadir' => '/etc/puppetlabs/code/environments/%{::environment}/hieradata', 'data_hash' => 'yaml_data'},
    hierarchy       =>  [
                          {'name'        => 'Nodes yaml', 'paths' => ['nodes/%{::trusted.certname}.yaml', 'nodes/%{::osfamily}.yaml']},
                          {'name'        => 'Default yaml file', 'path' => 'common.yaml'},
                          {'name'        => 'Accounts',
                            'path'       => 'accounts.eyaml',
                            'lookup_key' => 'eyaml_lookup_key',
                            'options'    => {
                              'pkcs7_private_key' => '/etc/puppetlabs/puppet/keys/private_key.pkcs7.pem',
                              'pkcs7_public_key'  => '/etc/puppetlabs/puppet/keys/public_key.pkcs7.pem'
                              },
                          },
                        ],
    eyaml           =>  true,
  }
}
