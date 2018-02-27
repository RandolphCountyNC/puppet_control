class users::dmz_users {
  create_resources('user', hiera('dmz_users'))
}
