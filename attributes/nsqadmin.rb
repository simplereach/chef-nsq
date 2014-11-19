# encoding: UTF-8

# https://github.com/bitly/nsq/tree/master/nsqadmin

default['nsq']['nsqadmin']['graphite_url'] = ''
default['nsq']['nsqadmin']['proxy_graphite'] = true
default['nsq']['nsqadmin']['http_address'] = '0.0.0.0:4171'
default['nsq']['nsqadmin']['notification_http_endpoint'] = nil
default['nsq']['nsqadmin']['nsqd_http_address'] = []
default['nsq']['nsqadmin']['nsqd_template_dir'] = '/usr/local/share/nsq/templates'
default['nsq']['nsqadmin']['use_statsd_prefixes'] = true
default['nsq']['nsqadmin']['verbose'] = false
default['nsq']['nsqadmin']['statsd_interval'] = '30s'

# Typically set in your environment configuration
default['nsq']['nsqadmin']['lookupd_http_address'] = ['127.0.0.1:4161']
