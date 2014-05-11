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
download_url = "https://s3.amazonaws.com/bitly-downloads/nsq/nsq-#{nsq_version}.#{nsq_arch}.#{go_version}.tar.gz"
nsq_release = "nsq-#{nsq_version}-#{go_version}"

ark 'nsq' do
  # ark is broken in the case of bumping versions
  # (it continues to use a cached download)
  # by adding the version to the name, this effectively fixes it
  name nsq_release
  action :install
  has_binaries %w(bin/nsqadmin bin/nsqd bin/nsqlookupd bin/nsq_pubsub bin/nsq_stat bin/nsq_tail bin/nsq_to_file bin/nsq_to_http)
  url download_url
  home_dir '/usr/local/nsq'
  only_if "test \'`/usr/local/bin/nsqd --version 2>&1`\' != \'nsqd v#{nsq_version} (built w/#{go_version})\'"
end
