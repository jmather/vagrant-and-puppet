if ($::hostname =~ /^web-/) {
  require server::httpd
}

if ($::hostname =~ /^db-/) {
  require server::db
}

file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}

$test = hiera('test_hiera_value', 'default_value')
file { "/tmp/hiera_test.txt":
	content => $test,
}

