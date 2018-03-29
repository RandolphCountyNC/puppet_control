class packages::nxlog_package {
  file { 'nxlog-ce-2.9.1716.msi' :
    ensure => 'file',
    path   => 'C:/Ziptemp/nxlog-ce-2.9.1716.msi',
    source => 'puppet:///modules/msi/nxlog-ce-2.9.1716.msi',
    mode   => '0774',
  }
  file { 'collector_sidecar_installer_0.1.5-1.exe' :
    ensure => 'file',
    path   => 'C:/Ziptemp/collector_sidecar_installer_0.1.5-1.exe',
    source => 'puppet:///modules/exe/collector_sidecar_installer_0.1.5-1.exe',
    mode   => '0774',
  }
  file { 'collector_sidecar.yml' :
    ensure  => 'file',
    path    => 'C:/Program Files/graylog/collector-sidecar/collector_sidecar.yml',
    source  => 'puppet:///modules/config_files/collector_sidecar.yml',
    mode    => '0774',
    require => Package['Graylog Collector Sidecar'],
  }
  package { 'NXLog-CE' :
    ensure   => present,
    provider => 'windows',
    source   => 'C:/Ziptemp/nxlog-ce-2.9.1716.msi',
    require  => File['nxlog-ce-2.9.1716.msi'],
    notify   => Package['Graylog Collector Sidecar'],
  }
  exec { 'nxlog-service':
    command => '"C:/Program Files (x86)/nxlog/nxlog.exe" -u',
    require => Package['NXLog-CE'],
    onlyif  => "C:\\Windows\\System32\\cmd.exe /c reg query HKLM\\SYSTEM\\CurrentControlSet\\Services\\nxlog",
  }
  package { 'Graylog Collector Sidecar' :
    ensure          => present,
    provider        => 'windows',
    source          => 'C:/Ziptemp/collector_sidecar_installer_0.1.5-1.exe',
    require         => File['collector_sidecar_installer_0.1.5-1.exe'],
    install_options => ['/S'],
  }
  exec { 'sidecar-service':
    command => '"C:/Program Files/graylog/collector-sidecar/graylog-collector-sidecar.exe" -service install',
    require => File['collector_sidecar.yml'],
    unless  => "C:\\Windows\\System32\\cmd.exe /c reg query HKLM\\SYSTEM\\CurrentControlSet\\Services\\collector-sidecar",
  }
  service { 'collector-sidecar':
    ensure  => 'running',
    require => File['collector_sidecar.yml'],
  }
}
