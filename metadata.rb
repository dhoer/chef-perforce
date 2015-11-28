# Encoding: utf-8
name 'perforce'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Installs Perforce CLI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.0'

supports 'centos', '~> 6'
supports 'redhat', '~> 6'
supports 'debian', '~> 7.0'
supports 'ubuntu', '~> 12'

depends 'apt', '~> 2.9'
depends 'yum', '~> 3.8'

source_url 'https://github.com/dhoer/chef-perforce' if respond_to?(:source_url)
issues_url 'https://github.com/dhoer/chef-perforce/issues' if respond_to?(:issues_url)
