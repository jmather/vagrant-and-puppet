class server::httpd {
  package { "httpd":
    ensure => present
  }

  service { "httpd":
    ensure => running,
    enabled => true,
    require => Package["httpd"],
  }
}
