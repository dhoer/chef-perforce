# https://www.perforce.com/perforce-packages
case node['platform_family']
when 'rhel'
  version = node['platform_version'].split('.')[0] # returns major version e.g. version 6.4 would return 6

  yum_repository 'Perforce' do
    description 'Perforce Repo'
    baseurl "http://package.perforce.com/yum/rhel/#{version}/x86_64"
    gpgkey 'https://package.perforce.com/perforce.pubkey'
    action :create
  end

  package 'perforce-cli'
else
  fail("Platform #{node['platform']} not supported!")
end
