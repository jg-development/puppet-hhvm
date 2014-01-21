class hhvm (
  $nightly = false
) {
  validate_bool($nightly)
  if ($::osfamily != 'debian') {
    fail('Only Ubuntu 12.04 and 13.10 is supported')
  }

  apt::source { 'hhvm':
    location          => 'http://dl.hiphop-php.com/ubuntu',
    release           => 'precise',
    repos             => 'main',
    required_packages => 'debian-keyring debian-archive-keyring',
    include_src       => false,
  } ->
  file { '/etc/apt/apt.conf.d/hhvm':
    owner     => root,
    group     => root,
    content   => "APT::Get::AllowUnauthenticated yes;",
    mode      => 644;
  }

  if ($nightly == true) {
    package { 'hhvm-nightly':
      ensure  => installed,
      require => [ Apt::Source['hhvm'], File['/etc/apt/apt.conf.d/hhvm'] ],
    }
  } else {
    package { 'hhvm':
      ensure  => installed,
      require => [ Apt::Source['hhvm'], File['/etc/apt/apt.conf.d/hhvm'] ],
    }
  }

  package { 'hhvm-fastcgi':
    ensure  => installed,
    require => [ Apt::Source['hhvm'], File['/etc/apt/apt.conf.d/hhvm'] ],
  }
}
