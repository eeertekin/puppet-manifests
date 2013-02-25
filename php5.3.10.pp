class php5-3-10 {
    
    $packageList = ["php-pear","php5-cgi","php5-fpm","php5-cli","php5-common","php5-curl","php5-mysql","php5-suhosin","php-apc","php5-gd","php5-dev"]

    package { $packageList:
        ensure  => installed
    }

    file { '/etc/php5/cli/php.ini': 
      ensure  => file, 
      source => "puppet:///modules/php5-3-10/cli/php.ini", 
    }

    file { '/etc/php5/fpm/php.ini': 
      ensure  => file, 
      source => "puppet:///modules/php5-3-10/fpm/php.ini", 
    } 

    service { 'php5-fpm':
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}

node default {
    include php5-3-10
}