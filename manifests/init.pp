# == Class: etchosts
# === Examples
#
#  class { 'etchosts':
#    ensure => present,
#    hosts => { 
#		'192.168.10.1' => [ 'fred.example.com', 'fred' ],
#     },
#  }
#
# === Authors
#
# Craig Balfour <craig.balfour@gmail.com>
#
# === Copyright
#
# Copyright 2016 Craig Balfour, unless otherwise noted.
#
class etchosts (
	$ensure = undef,
	$add_ipv4_localhosts = true, 
	$add_ipv6_localhosts = true,
	$hosts = undef,
	$template = "${module_name}/hosts.erb",
) { 

	if $ensure == "present" { 

		file { "/etc/hosts":
			content => template($template),
			mode => 644,
			owner => "root",
			group => "root",	
		}
	}

}
