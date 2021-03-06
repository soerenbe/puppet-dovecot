Dovecot Puppet Module
=====================

This module is based on https://github.com/mxhero/puppet-dovecot 0.1.1 (dev)

This module was developed with the orginal config files from Debian Jessie's Dovecot 2.2.18 and was tested
with Ubuntu Trusty 14.04. Other Debian Versions only MAY work.

Install, enable and configure the Dovecot IMAP server.
This module relies heavily on the conf.d structure adopted by dovecot 2.x.

* `dovecot` : Main class
* `dovecot::file` : Definition to manage configuration file snippets
* `dovecot::plugin` : Definition to install plugin sub-packages

Example Configuration
---------------------

    class { 'dovecot':
        plugins                    => [ 'mysql', 'pigeonhole' ],
        protocols                  => 'imap pop3 sieve',
        verbose_proctitle          => 'yes',
        auth_include               => 'sql',
        mail_location              => 'maildir:~/Maildir',
        auth_listener_userdb_mode  => '0660',
        auth_listener_userdb_group => 'vmail',
        auth_listener_postfix      => true,
        ssl_cert                   => '/etc/pki/tls/certs/wildcard.example.com.crt',
        ssl_key                    => '/etc/pki/tls/private/wildcard.example.com.key',
        postmaster_address         => 'postmaster@example.com',
        hostname                   => 'mail.example.com',
        lda_mail_plugins           => '$mail_plugins sieve',
        auth_sql_userdb_static     => 'uid=vmail gid=vmail home=/home/vmail/%d/%n',
        log_timestamp              => '"%Y-%m-%d %H:%M:%S "',
    }

    dovecot::file { 'dovecot-sql.conf.ext':
        source => 'puppet:///modules/example/dovecot-sql.conf.ext',
    }
