class ghservice::deps::package::nodejs ($nodejs_version) {
  include ::ghservice::deps::ppa::nodejs
  package { 'nodejs': ensure  => $nodejs_version }
}
