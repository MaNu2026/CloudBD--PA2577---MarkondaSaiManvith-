# This below code execuates the command i.e. updating the latest system settings.
class baseconfig {
  exec { 'apt-get update':
  command => '/usr/bin/apt-get update -y'
}
}
