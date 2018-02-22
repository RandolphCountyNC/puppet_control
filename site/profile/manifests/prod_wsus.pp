class profile::prod_wsus {
  class { 'wsus_client':
    server_url                          => 'http://rcupdate01.co.randolph.nc.us:8530',
    auto_update_option                  => 'AutoNotify',
    scheduled_install_day               => 'Tuesday',
    scheduled_install_hour              => 2,
    enable_status_server                => true,
    detection_frequency_hours           => 4,
    target_group                        => 'Production Servers',
    no_auto_reboot_with_logged_on_users => false,
  }
  contain wsus_client
}
