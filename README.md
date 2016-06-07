# etchosts

#### Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with etchosts](#setup)
    * [What etchosts affects](#what-etchosts-affects)
    * [Beginning with etchosts](#beginning-with-etchosts)
3. [Usage - Configuration options and additional functionality](#usage)

## Overview

Manage /etc/hosts.

## Module Description

The etchosts module lets you use Puppet to manage `/etc/hosts`.

Note: 
* Depends on `hostname` and `fqdn` facter facts.
* Only tested in Ubuntu.


## Setup

### What etchosts affects

* `/etc/hosts`

Note: This module will replace your existing `/etc/hosts`. 

### Beginning with etchosts

```puppet
	class { "etchosts": ensure => present }
```

## Usage

```puppet
	class { "etchosts": 
		ensure => present,
		add_ipv4_localhosts => true,
		add_ipv6_localhosts => true, 
		hosts => { 
			192.168.1.10 => ['fred.example.com'],
			192.168.1.11 => ['barney.example.com'],
		}
		template=> "mymodule/hosts.erb",
	}
```

### Configure with hiera

```yaml
etchosts::ensure: "present"
etchosts::hosts:
   192.168.10.1: 
      fred.example.com
      fred 
   192.168.10.2:
      barney.example.com
```

