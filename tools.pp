class tools {
    $packageList = ["subversion","zip","sysstat","lynx-cur","curl","denyhosts","python-software-properties","libpcre3","libpcre3-dev","ntp","rsync","g++","libssl-dev","build-essential","git-core","git-doc","xfsprogs"]

    package { $packageList:
        ensure  => installed,
        require  => Exec['apt-update'],
    }

    exec { "apt-update":
        command => "/usr/bin/apt-get update"
    }
}

node default {
    include tools
}