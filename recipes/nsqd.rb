# encoding: UTF-8
#
# Cookbook Name:: chef-nsq
# Recipe:: nsqd
# Author:: Eric Lubow <elubow@simplereach.com>
# Author:: Matt Reiferson <snakes@gmail.com>
#
# Description:: Installs nsqd
#

include_recipe 'nsq'

chef_gem 'semantic'
require 'semantic'

nsq_release = "nsq-#{node['nsq']['version']}-#{node['nsq']['go_version']}"

# Create path for the on-disk queue files are stored
directory node['nsq']['nsqd']['data_path'] do
  action :create
  mode '0770'
  owner 'nsqd'
  group 'nsqd'
end

if node['nsq']['setup_services']
  template '/etc/init/nsqd.conf' do
    action :create
    source 'upstart.nsqd.conf.erb'
    mode '0644'
    # need to stop/start in order to reload config
    notifies :stop, 'service[nsqd]', :immediately
    notifies :start, 'service[nsqd]', :immediately
  end

  service 'nsqd' do
    provider Chef::Provider::Service::Upstart
    action [:enable, :start]
    supports stop: true, start: true, restart: true, status: true
    subscribes :restart, "ark[#{nsq_release}]", :delayed
  end
end
