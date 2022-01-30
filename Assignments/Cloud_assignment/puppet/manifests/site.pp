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

# This defines name of the box i.e "appserver" which runs in the local machine. include nodejs defines a package which contains instructions of provisioning appserver box.
node 'appserver.local' {
	include nodejs
}
# This defines name of the box i.e "dbserver" which runs in the local machine. include dbserver defines a package which contains instructions of provisioning dbserver box.
node 'dbserver.local' {
	include dbserver
}
# This defines name of the box i.e "web" which runs in the local machine. include nginx defines a package which contains instructions of provisioning web box.
node 'web.local'{
	include nginx
}

# This commands defines the test servers 0,1,2.
node /tst\d+.local$/{
	include baseconfig
}
