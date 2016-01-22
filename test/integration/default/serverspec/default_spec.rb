# Encoding: utf-8
require 'serverspec'

if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
else
  set :backend, :cmd
  set :os, family: 'windows'
end

case os[:family]
when 'windows'
  describe command('cmd /c "C:\Program Files\Perforce\p4.exe"') do
    its(:stderr) { should match(/Perforce client/) }
  end
else # linux
  describe command('p4 2>&1') do
    its(:stdout) { should match(/Perforce client/) }
  end
end
