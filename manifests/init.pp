if ($::hostname =~ /^web-/) {
  require server::httpd
}

if ($::hostname =~ /^db-/) {
  require server::db
}
