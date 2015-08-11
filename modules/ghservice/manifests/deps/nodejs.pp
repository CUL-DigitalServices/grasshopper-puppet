class ghservice::deps::nodejs () {

    # Apply the nodejs class which will configure the apt repo and install nodejs
    class { '::nodejs': }

    # This next section is necessary to ensure the above class is actually
    # contained within the surrounding class because by default puppet will let
    # that nodejs declaration float freely in the dependency graph, resulting in
    # commands like npm install trying to run too early.
    # https://docs.puppetlabs.com/puppet/latest/reference/lang_containment.html#anchor-pattern-containment-for-compatibility-with-puppet--340

    anchor { 'nodejs_begin': } ->
    Class ['::nodejs'] ->
    anchor { 'nodejs_end': }
}
