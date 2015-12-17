Changelog
=========

2015-12-17
----------
* Fork from https://github.com/mxhero/puppet-dovecot
* Converted to current Jessie configuration (Dovecot 2.2.13)
* Purge configuration directories
* Added more advanced LDAP configuration
  * Added `dovecot::ldap` ressource that generates a LDAP configuration file
  * Added variable `$userdb_ldap_name` and `$passdb_ldap_name` to `dovecot` modul that reference a `dovecot::ldap` ressource

```puppet
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
)
```
This commit was mainly to fit my purposes. The modul still should fix basic setup but is far away from feature-complete.
