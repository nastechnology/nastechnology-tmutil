# == Class: tmutil
#
# Manage TimeMachine backups for a certain user
#
# === Parameters
#
# [user]
#   The User that you want to backup data for
# [password]
#   The password for the user to connect to the server
# [server]
#   The TimeMachine server to backup to
#
# === Examples
#
#  class { tmutil:
#    user     => '100XXXX',
#    password => 'password',
#    server   => 'xserve.example.com',
#  }
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2014 Napoleon Area City Schools, unless otherwise noted.
#
class tmutil (
  $user     = '',
  $password = '',
  $server   = '',
  $share    = 'TimeMachines'
){

  $tmutil = '/usr/bin/tmutil'
  $fullserver = "afp://${user}:${password}@${server}/${share}"

  exec { 'EnableTmutil':
    command => "${tmutil} enable",
  }

  exec { "Set${user}BackupDestination":
    command => "${tmutil} setdestination ${fullserver}",
    require => Exec['EnableTmutil'],
  }

}
