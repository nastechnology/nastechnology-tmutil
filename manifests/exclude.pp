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
  exec { 'TmutilExclude':
    command => "/usr/bin/tmutil addexclusion ${name}",
  }
}