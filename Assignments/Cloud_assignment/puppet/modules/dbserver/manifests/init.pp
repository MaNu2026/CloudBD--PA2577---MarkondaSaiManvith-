# The code installs the latest version of mysql-server.
class dbserver{
    package { ['mysql-server']:   
    ensure => latest;
  }
  # After installing the software, this below code ensures that software is running.
    service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }
}
