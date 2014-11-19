# encoding: UTF-8
#
# Cookbook Name:: chef-nsq
# Recipe:: nsqlookupd
# Author:: Eric Lubow <elubow@simplereach.com>
# Author:: Matt Reiferson <snakes@gmail.com>
#
# Description:: Installs nsqlookupd
#

include_recipe 'nsq'

nsq_release = "nsq-#{node['nsq']['version']}-#{node['nsq']['go_version']}"

if node['nsq']['setup_services']
  template '/etc/init/nsqlookupd.conf' do
    action :create
    source 'upstart.nsqlookupd.conf.erb'
    mode '0644'
    # need to stop/start in order to reload config
    notifies :stop, 'service[nsqlookupd]', :immediately
    notifies :start, 'service[nsqlookupd]', :immediately
  end

  service 'nsqlookupd' do
    provider Chef::Provider::Service::Upstart
    action [:enable, :start]
    supports stop: true, start: true, restart: true, status: true
    subscribes :restart, "ark[#{nsq_release}]", :delayed
  end
end
