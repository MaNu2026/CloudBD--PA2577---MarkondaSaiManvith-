# Stage ensures it execuates baseconfig before performing any other execuations(i.e. baseconfig is added to pre run stage, hence it is execuated initially).
stage { 'pre':
	before => Stage['main']
}

# Class is a named entity/blocks.
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
