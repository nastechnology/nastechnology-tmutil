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
  exec { "TmutilExclude${name}":
    command => "/usr/bin/tmutil addexclusion ${name}",
    unless  => "/usr/bin/tmutil isexcluded ${name} | if [ `grep -c [Excluded].*${name}` == 1 ]; then exit 0; fi;"
  }
}
