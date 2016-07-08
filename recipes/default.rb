major_version = node['platform_version'].split('.')[0] # returns major version e.g. version 6.4 would return 6
fail_msg = "Platform #{node['platform']} not supported!"

# https://www.perforce.com/perforce-packages
case node['platform_family']
when 'rhel'
  yum_repository 'Perforce' do
    description 'Perforce Repo'
    baseurl "http://package.perforce.com/yum/rhel/#{major_version}/x86_64"
    gpgkey 'https://package.perforce.com/perforce.pubkey'
    action :create
  end

  package 'perforce-cli'
when 'debian'
  case major_version
  when '14'
    dist = 'trusty'
  when '12'
    dist = 'precise'
  when '7'
    dist = 'wheezy'
  else
    fail(fail_msg)
  end

  apt_repository 'Perforce' do
    uri 'http://package.perforce.com/apt/ubuntu'
    distribution dist
    components ['release']
    key 'https://package.perforce.com/perforce.pubkey'
  end

  package 'perforce-cli'
when 'fedora'
  yum_repository 'Perforce' do
    description 'Perforce Repo'
    baseurl "http://package.perforce.com/yum/rhel/7/x86_64"
    gpgkey 'https://package.perforce.com/perforce.pubkey'
    action :create
  end
  package 'perforce-cli'

when 'windows'
  bit = node['kernel']['machine'] == 'x86_64' ? 'x64' : 'x86'

  windows_package 'Helix P4 Command-Line Client' do
    source "#{node['perforce']['download_url']}/#{node['perforce']['release']}/bin.nt#{bit}/helix-p4-#{bit}.exe"
    options '/v"/qn"'
    installer_type :custom
  end
else
  fail(fail_msg)
end
