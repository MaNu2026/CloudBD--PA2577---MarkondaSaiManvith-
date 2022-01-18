stage { 'pre':
	before => Stage['main']
}

class { 'baseconfig':
	stage => 'pre'
}

include baseconfig

node 'appserver.local' {
	include nodejs
}

node 'dbserver.local' {
	include dbserver
}

node 'web.local'{
	include nginx
}

node /tst\d+.local$/{
	include baseconfig
}