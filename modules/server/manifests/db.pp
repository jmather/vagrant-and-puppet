class server::db {
  package { "mysql-server":
    ensure => present,
  }

  service { "mysqld":
    ensure => running,
    enabled => true,
    require => Package["mysql-server"],
  }
}
