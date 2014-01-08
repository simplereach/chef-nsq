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
    plugin "passwd"
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
