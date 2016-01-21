# Encoding: utf-8
name 'perforce'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Installs Perforce Command-Line Client (p4)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.2.3'

supports 'centos', '>= 6.0'
supports 'redhat', '>= 6.0'
supports 'debian', '~> 7.0'
supports 'ubuntu', '>= 12.04'
supports 'windows'

depends 'apt', '~> 1.0'
depends 'yum', '~> 1.0'
depends 'windows', '~> 1.0'

source_url 'https://github.com/dhoer/chef-perforce' if respond_to?(:source_url)
issues_url 'https://github.com/dhoer/chef-perforce/issues' if respond_to?(:issues_url)
