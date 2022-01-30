# The below code installs nodejs and curl. 
class nodejs {
	package{ 'nodejs':
			ensure => 'present',
			require => Exec['nn']
	}

	package{ 'curl':
			ensure => 'installed',               # This command installs curl 
			require => Exec['aptget']
	}

	exec { 'aptget':                                     # This is an update command
		command => '/usr/bin/apt-get update -y'
	}

	exec { 'nn':                                         # This command ensures that latest version of nodejs is installed.
		command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
		require => Exec['aptget']
	}
}	
