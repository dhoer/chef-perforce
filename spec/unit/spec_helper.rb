# Encoding: utf-8
require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'

ChefSpec::Coverage.start!

::LOG_LEVEL = :warn
::REDHAT_OPTS = {
  platform: 'redhat',
  version: '6.5',
  log_level: ::LOG_LEVEL
}
::CENTOS_OPTS = {
  platform: 'centos',
  version: '6.6',
  log_level: ::LOG_LEVEL
}
::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '14.04',
  log_level: ::LOG_LEVEL
}
::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}
