# Encoding: utf-8
require 'serverspec'

set :backend, :exec

describe command('p4') do
  its(:stderr) { should match(/Perforce client/) }
end
