class server::httpd {
  package { "httpd":
    ensure => present
  }

  service { "httpd":
    ensure => running,
    enable => true,
    require => Package["httpd"],
  }
}
