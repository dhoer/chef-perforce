# Encoding: utf-8

require_relative 'spec_helper'

describe 'perforce::default' do
  describe 'rhel' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos',
                                 version: '6.6',
                                 log_level: ::LOG_LEVEL).converge(described_recipe)
    end

    it 'adds p4 repo' do
      expect(chef_run).to create_yum_repository('Perforce')
    end

    it 'installs p4 cli package' do
      expect(chef_run).to install_package('perforce-cli')
    end
  end

  describe 'debian' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu',
                                 version: '14.04',
                                 log_level: ::LOG_LEVEL).converge(described_recipe)
    end

    it 'adds p4 repo' do
      expect(chef_run).to add_apt_repository('Perforce')
    end

    it 'installs p4 command-line client package' do
      expect(chef_run).to install_package('perforce-cli')
    end
  end

  describe 'windows' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'windows',
                                 version: '2012R2',
                                 log_level: ::LOG_LEVEL).converge(described_recipe)
    end

    it 'installs p4 command-line client package' do
      expect(chef_run).to install_windows_package('Helix P4 Command-Line Client')
    end
  end

  describe 'mac_os_x' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'mac_os_x',
                                 version: '10.11.1',
                                 log_level: ::LOG_LEVEL).converge(described_recipe)
    end

    it 'creates perforce directory' do
      expect(chef_run).to create_directory('/opt/perforce').with(
        user: 'root',
        group: 'wheel'
      )
    end
    it 'installs p4 command-line client package' do
      expect(chef_run).to create_remote_file('/opt/perforce/p4')
    end
    it 'creates PATH extension directory' do
      expect(chef_run).to create_directory('/etc/paths.d').with(
        user: 'root',
        group: 'wheel'
      )
    end
    it 'installs PATH extension file' do
      expect(chef_run).to create_file('/etc/paths.d/perforce').with(
        user: 'root',
        group: 'wheel'
      )
    end
  end
end
