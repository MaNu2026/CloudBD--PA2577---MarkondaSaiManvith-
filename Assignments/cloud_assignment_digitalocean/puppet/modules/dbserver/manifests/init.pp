# The code installs the latest version of mysql-server.
class mysql-server {

	package { ['mysql-server']:
    ensure => latest;
  }
  
  # After installing the software, this below code ensures that software is running
    service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }
}
