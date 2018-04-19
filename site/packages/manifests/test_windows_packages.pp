class packages::test_windows_packages {
  file { 'installer_vista_win7_win8-64-3.1.0.150.msi' :
    ensure => 'file',
    path   => 'C:/Ziptemp/installer_vista_win7_win8-64-3.1.0.150.msi',
    source => 'puppet:///modules/msi/installer_vista_win7_win8-64-3.1.0.150.msi',
    mode   => '0774',
  }
  package { 'Cb Defense Sensor 64-bit' :
    ensure          => absent,
    provider        => 'windows',
    source          => 'C:/Ziptemp/installer_vista_win7_win8-64-3.1.0.150.msi',
    require         => File['installer_vista_win7_win8-64-3.1.0.150.msi'],
    install_options => [{'COMPANY_CODE' => '9IYUL2XTWV6CJFP4V#S'}],
  }
}
