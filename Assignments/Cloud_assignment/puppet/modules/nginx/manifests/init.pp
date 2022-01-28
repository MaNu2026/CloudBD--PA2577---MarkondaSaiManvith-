# This code installs the current version of nginx. 
class nginx {
  package { 'nginx':
    ensure => present;
  }
# Require package should be execuated initially in order to run the service. 
  service { 'nginx':
    ensure  => running,
    require => Package['nginx'];
  }
  
 }
