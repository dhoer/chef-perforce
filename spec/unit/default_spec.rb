# Encoding: utf-8

require_relative 'spec_helper'

describe 'perforce::default' do
  describe 'rhel' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(::CENTOS_OPTS).converge(described_recipe)
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
      ChefSpec::ServerRunner.new(::UBUNTU_OPTS).converge(described_recipe)
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
      ChefSpec::ServerRunner.new(::WINDOWS_OPTS).converge(described_recipe)
    end

    it 'installs p4 command-line client package' do
      expect(chef_run).to install_windows_package('Perforce')
    end
  end
end
