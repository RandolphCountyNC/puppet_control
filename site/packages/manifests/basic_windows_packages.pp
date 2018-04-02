class packages::basic_windows_packages {
  #Test Chocolatey installer
  #include chocolatey
  class {'chocolatey':
    log_output => true,
  }
  package { 'notepadplusplus':
    ensure   => installed,
    provider => 'chocolatey',
  }
  package { 'treesizefree':
    ensure   => installed,
    provider => 'chocolatey',
  }
  #Include NXLog and Graylog sidecar
  include packages::nxlog_package
}
