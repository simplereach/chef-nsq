# encoding: UTF-8
#
# Cookbook Name:: chef-nsq
# Recipe:: nsqadmin
# Author:: Eric Lubow <elubow@simplereach.com>
# Author:: Matt Reiferson <snakes@gmail.com>
#
# Description:: installs the NSQ Admin tool
#

include_recipe 'nsq'

nsq_release = "nsq-#{node['nsq']['version']}-#{node['nsq']['go_version']}"

template '/etc/init/nsqadmin.conf' do
  action :create
  source 'upstart.nsqadmin.conf.erb'
  mode '0644'
  # need to stop/start in order to reload config
  notifies :stop, 'service[nsqadmin]', :immediately
  notifies :start, 'service[nsqadmin]', :immediately
end

service 'nsqadmin' do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
  supports stop: true, start: true, restart: true, status: true
  subscribes :restart, "ark[#{nsq_release}]", :delayed
end
