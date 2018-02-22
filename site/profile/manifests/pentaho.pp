class profile::pentaho{
  user { 'pentaho':
    ensure   => 'present',
    home     => '/home/pentaho',
    password => '!!',
  }
  # create a directory tree, list the directories in order
  # and puppet will 'do the right thing'.
  file { [  '/home/pentaho/', '/home/pentaho/server',
            '/home/pentaho/server/pentaho-server' ]:
    ensure => 'directory',
    owner  => 'pentaho',
    group  => 'pentaho',
  }
  file { '/home/pentaho/.pentaho':
    ensure => 'directory',
    owner  => 'pentaho',
    group  => 'pentaho',
  }
  package { 'java-1.8.0-openjdk':
    ensure => 'installed',
  }
  package { 'java-1.8.0-openjdk-devel':
    ensure => 'installed',
  }
  include postgresql::server
  package { 'xorg-x11-server-Xvfb':
    ensure => 'installed',
  }

  include '::archive' # NOTE: optional for posix platform
  archive { '/tmp/pentaho-server-ce-8.0.0.0-28.zip':
    ensure        => present,
    extract       => true,
    extract_path  => '/opt',
    source        => 'https://sourceforge.net/projects/pentaho/files/Pentaho%208.0/server/pentaho-server-ce-8.0.0.0-28.zip',
    checksum      => 'cf6c00ff8537c421c513818d978fc404e35078d0',
    checksum_type => 'sha1',
    creates       => '/opt/pentaho-server',
    cleanup       => true,
  }
  file { '/etc/environment':
    content => inline_template('PENTAHO_JAVA_HOME=/usr/lib/jvm/java'),
  }
}
