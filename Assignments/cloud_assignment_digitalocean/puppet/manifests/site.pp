stage { 'pre':
	before => Stage['main']
}

class { 'baseconfig':
	stage => 'pre'
}

include baseconfig

node 'appserver' {
	include nodejs
}

node 'dbserver' {
	include mysql-server
}

node 'web'{
	include nginx
}

node /tst\d+$/{
	include baseconfig
}