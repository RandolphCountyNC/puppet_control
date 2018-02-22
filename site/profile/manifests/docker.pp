class profile::docker {
  class { 'selinux':
  mode => 'permissive',
  type => 'targeted',
  }
  contain 'selinux'

  include 'docker'
  docker::run { 'nginx-proxy':
  image            => 'jwilder/nginx-proxy',
  ports            => ['80:80', '443:443'],
  #expose           => ['80', '443'],
  #links            => ['mysql:db'],
  #net              => 'my-user-def-net',
  volumes          => ['/var/run/docker.sock:/tmp/docker.sock:ro'],
  #volumes_from     => '6446ea52fbc9',
  #memory_limit     => '10m', # (format: '<number><unit>', where unit = b, k, m or g)
  #cpuset           => ['0', '3'],
  #username         => 'example',
  #hostname         => 'example.com',
  #env              => ['FOO=BAR', 'FOO2=BAR2'],
  #env_file         => ['/etc/foo', '/etc/bar'],
  #dns              => ['8.8.8.8', '8.8.4.4'],
  restart_service  => true,
  privileged       => true,
  pull_on_start    => false,
  #before_stop      => 'echo "So Long, and Thanks for All the Fish"',
  #before_start     => 'echo "Run this on the host before starting the Docker container"',
  #after            => [ 'container_b', 'mysql' ],
  #depends          => [ 'container_a', 'postgres' ],
  extra_parameters => [ '--restart=always' ],
  }
}
