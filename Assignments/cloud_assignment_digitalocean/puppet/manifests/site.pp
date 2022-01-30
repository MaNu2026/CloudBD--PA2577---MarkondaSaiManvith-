# Stage ensures it execuates baseconfig before performing any other execuations(i.e. baseconfig is added to pre run stage, hence it is execuated initially).
stage { 'pre':
	before => Stage['main']
}

# Class is a named entity/blocks.
class { 'baseconfig':
	stage => 'pre'
}

# include baseconfig explains importing a package that means all the nodes to include baseconfig package.
include baseconfig

# This defines name of the box i.e "appserver". include nodejs defines a package which contains instructions of provisioning appserver box.
node 'appserver' {
	include nodejs
}

# This defines name of the box i.e "dbserver". include dbserver defines a package which contains instructions of provisioning dbserver box.
node 'dbserver' {
	include mysql-server
}
# This defines name of the box i.e "web". include nginx defines a package which contains instructions of provisioning web box.
node 'web'{
	include nginx
}

# This commands defines the test servers 0,1,2. Which eventually requires to update because in the servers apt-get update command is written, by include baseconfig it updates. 
node /tst\d+$/{
	include baseconfig
}
