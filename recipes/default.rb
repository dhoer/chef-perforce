major_version = node['platform_version'].split('.')[0] # returns major version, e.g., version 6.4 would return 6

# https://www.perforce.com/perforce-packages
case node['platform_family']
when 'rhel', 'fedora'
  major_version = major_version.to_i < 19 ? raise('Only Fedora 19+ supported!') : '7' if node['platform'] == 'fedora'

  yum_repository 'Perforce' do
    description 'Perforce Repo'
    baseurl "http://package.perforce.com/yum/rhel/#{major_version}/x86_64"
    gpgkey 'https://package.perforce.com/perforce.pubkey'
    action :create
  end

  package 'perforce-cli'
when 'debian'
  case major_version
    when '7'
      dist = 'wheezy'
  when '12'
    dist = 'precise'
  else # Assume Ubuntu 14+ or Debian 8+
    dist = 'trusty'
  end

  apt_repository 'Perforce' do
    uri 'http://package.perforce.com/apt/ubuntu'
    distribution dist
    components ['release']
    key 'https://package.perforce.com/perforce.pubkey'
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
  raise("Platform #{node['platform']} not supported!")
end
