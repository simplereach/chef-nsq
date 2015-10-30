# encoding: UTF-8

# Versions
default['nsq']['version'] = '0.3.0'
default['nsq']['go_version'] = 'go1.3.3'

# Architecture
default['nsq']['arch'] = 'linux-amd64'

# Common directories
default['nsq']['data_path'] = '/var/spool/nsq'

# Should we setup upstart services?
default['nsq']['setup_services'] = true

# Release URL. Defaults to bitly upstream
default['nsq']['release_url'] = 'https://s3.amazonaws.com/bitly-downloads/nsq'
