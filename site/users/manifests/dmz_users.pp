class users::dmz_users {
  create_resources('user', lookup('dmz_users'))
}
