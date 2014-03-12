class server::db {
  package { "mysql-server":
    ensure => present,
  }

  service { "mysqld":
    ensure => running,
    enable => true,
    require => Package["mysql-server"],
  }
}
