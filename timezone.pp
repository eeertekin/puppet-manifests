class timezone-base {
    package { "tzdata":
        ensure => installed
    }

    file { "/etc/localtime":
    	require => Package["tzdata"],
        ensure => "/usr/share/zoneinfo/US/Eastern"
    }

    file {
        "/etc/timezone":
            content => "US/Eastern\n",
    }
}

node default {
     include timezone-base
}