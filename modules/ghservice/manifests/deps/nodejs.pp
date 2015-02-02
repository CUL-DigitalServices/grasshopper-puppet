class ghservice::deps::nodejs (
    $nodejs_version = "0.10.35-1nodesource1~trusty"
    ) {

    # Apply the nodejs class which will configure the apt repo and install nodejs
    class { '::nodejs':
        # "before" line IS VITAL to ensure that things that depend on the parent class will actually wait for ::nodejs to finish first
        # otherwise e.g. npm install would try to run before npm was installed
        # not sure if there is a better way to do this
        before => Class['::ghservice::deps::nodejs'],
        version => $nodejs_version,
        manage_repo => true
    }
}
