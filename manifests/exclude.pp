# == Definition: tmutil::exclude
#
# Manage TimeMachine exclusions
#
# === Parameters
#
# None
#
# === Examples
#
#  tmutil::exclude { '/Applications': }
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2014 Napoleon Area City Schools, unless otherwise noted.
#
define tmutil::exclude {
  $tmutil = '/usr/bin/tmutil'

  exec { "TmutilExclude${name}":
    command => "${tmutil} addexclusion ${name}",
    unless  => "${tmutil} isexcluded ${name} | if [ `grep -c [Excluded].*${name}` == 1 ]; then exit 0; fi;"
  }
}
