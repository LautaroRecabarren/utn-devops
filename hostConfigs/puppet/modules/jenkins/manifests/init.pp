class jenkins {
  package { ['curl','gnupg','ca-certificates','lsb-release','openjdk-17-jre']:
    ensure => installed,
  }

  exec { 'jenkins-keyring':
    command => '/usr/bin/curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | /usr/bin/tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null',
    creates => '/usr/share/keyrings/jenkins-keyring.asc',
    path    => ['/usr/bin','/usr/sbin','/bin','/usr/local/bin'],
    require => Package['curl','gnupg','ca-certificates'],
  }

  file { '/etc/apt/sources.list.d/jenkins.list':
    ensure  => file,
    source  => 'puppet:///modules/jenkins/jenkins.list',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Exec['jenkins-keyring'],
    notify  => Exec['apt-update'],
  }

  exec { 'apt-update':
    command     => '/usr/bin/apt-get update',
    refreshonly => true,
    path        => ['/usr/bin','/usr/sbin','/bin','/usr/local/bin'],
  }

  package { 'jenkins':
    ensure  => installed,
    require => Exec['apt-update'],
  }

  service { 'jenkins':
    ensure    => running,
    enable    => true,
    require   => Package['jenkins'],
    subscribe => Package['jenkins'],
  }
}
