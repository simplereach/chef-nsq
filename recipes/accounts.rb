#
# Cookbook Name:: chef-nsq
# Recipe:: accounts
# Author:: Eric Lubow <elubow@simplereach.com>
# Author:: Matt Reiferson <snakes@gmail.com>
#
# Description:: Set up the accounts for NSQ
#

ohai "reload_passwd" do
    action :nothing
    if Ohai::VERSION >= '7.0.0'
        plugin "etc"
    else
        plugin "passwd"
    end
end

user "nsqd" do
    action :create
    system true
end

user "nsqlookupd" do
    action :create
    system true
end

user "nsqadmin" do
    action :create
    system true
end

ohai "reload_passwd"
