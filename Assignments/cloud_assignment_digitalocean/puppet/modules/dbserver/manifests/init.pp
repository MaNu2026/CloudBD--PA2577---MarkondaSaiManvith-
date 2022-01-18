class mysql-server {

	package { ['mysql-server']:
    ensure => latest;
  }
    service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }
}