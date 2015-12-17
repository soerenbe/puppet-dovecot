define dovecot::ldap (
  $auth_bind    = 'yes',
  $uris         = undef,
  $base         = undef,
  $dn           = undef,
  $dnpass       = undef,
  $pass_filter  = undef,
  $user_filter  = undef,
  $pass_attrs   = undef,
  $ldap_version = 3,
  $scope        = 'subtree'

) {
  file { "${dovecot::directory}/dovecot-ldap-${name}.conf.ext":
    content => template('dovecot/dovecot-ldap.conf.ext.erb'),
  }
}
