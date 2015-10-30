# encoding: UTF-8
#
# Cookbook Name:: chef-nsq
# Recipe:: default
# Author:: Eric Lubow <elubow@simplereach.com>
# Author:: Matt Reiferson <snakes@gmail.com>
#
# Description:: Download and install NSQ
#

include_recipe 'ark'
include_recipe 'nsq::accounts'

nsq_version = node['nsq']['version']
nsq_arch    = node['nsq']['arch']
go_version  = node['nsq']['go_version']
release_url = node['nsq']['release_url']
download_url = "#{release_url}/nsq-#{nsq_version}.#{nsq_arch}.#{go_version}.tar.gz"
nsq_release = "nsq-#{nsq_version}-#{go_version}"
nsq_binaries = %w(
  bin/nsqadmin
  bin/nsqd
  bin/nsqlookupd
  bin/nsq_pubsub
  bin/nsq_stat
  bin/nsq_tail
  bin/nsq_to_file
  bin/nsq_to_http
  bin/nsq_to_nsq
)

# Install `to_nsq` if we're using a version that includes it
# This comparison isn't exactly correct, but should work since no one is using
# this cookbook with a version of NSQ before 0.2.10.
if nsq_version >= '0.2.30'
  nsq_binaries << 'bin/to_nsq'
end

ark 'nsq' do
  # ark is broken in the case of bumping versions
  # (it continues to use a cached download)
  # by adding the version to the name, this effectively fixes it
  name nsq_release
  action :install
  has_binaries nsq_binaries
  url download_url
  home_dir '/usr/local/nsq'
  only_if "test \"`/usr/local/bin/nsqd --version 2>&1`\" != \"nsqd v#{nsq_version} (built w/#{go_version})\""
end
