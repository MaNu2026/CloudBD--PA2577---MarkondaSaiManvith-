package{ 'curl':
        ensure => 'installed',
        require => Exec['apt-get_curl']
}

package{ 'nodejs':
        ensure => 'present',
        require => Exec['man']
}

exec { 'aptget':
    command => '/usr/bin/apt-get update -y'
}

exec { 'apt-get_curl':
    command => '/usr/bin/apt-get install -y curl git'
}

exec { 'man':
    command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
    require => Exec['aptget']
}

exec { 'aptget build':
    command => '/usr/bin/apt-get install -y build-essential'
}
