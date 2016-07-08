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
end
