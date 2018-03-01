class packages::basic_linux_packages {
  package { 'htop':
    ensure => 'present',
    name   => 'htop'
  }
  package { 'net-tools':
    ensure => 'present',
    name   => 'net-tools'
  }
  package { 'nano':
    ensure => 'present',
    name   => 'nano'
  }
  package { 'wget':
    ensure => 'present',
    name   => 'wget'
  }
  package { 'git':
    ensure => 'present',
    name   => 'git'
  }
  package { 'unzip':
    ensure => 'present',
    name   => 'unzip'
  }
  package { 'open-vm-tools':
    ensure => 'present',
    name   => 'open-vm-tools'
  }
  service { 'vmtoolsd':
      ensure => 'running',
      enable => true,
    }

}
