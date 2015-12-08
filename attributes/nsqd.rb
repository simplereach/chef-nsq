# encoding: UTF-8

# https://github.com/bitly/nsq/tree/master/nsqd/README.md

# User to run the nsqd service as
default['nsq']['nsqd']['user'] = 'nsqd'

# -auth-http-address=: <addr>:<port> to query auth server (may be given multiple times)
default['nsq']['nsqd']['auth_http_address'] = ''

# -deflate=true: enable deflate feature negotiation (client compression)
default['nsq']['nsqd']['deflate'] = true

# -max-deflate-level=6: max deflate compression level a client can negotiate (> values == > nsqd CPU usage)
default['nsq']['nsqd']['max_deflate_level'] = '6'

# -snappy=true: enable snappy feature negotiation (client compression)
default['nsq']['nsqd']['snappy'] = true

# -max-output-buffer-size=65536: maximum client configurable size (in bytes) for a client output buffer
default['nsq']['nsqd']['max_output_buffer_size'] = '65536'

# -max-output-buffer-timeout=1s: maximum client configurable duration of time between flushing to a client
default['nsq']['nsqd']['max_output_buffer_timeout'] = '1s'

# -max-req-timeout=1h0m0s: maximum requeuing timeout for a message
default['nsq']['nsqd']['max_req_timeout'] = '1h0m0s'

# -max-heartbeat-interval=1m0s: maximum duration of time between heartbeats that a client can configure
default['nsq']['nsqd']['max_heartbeat_interval'] = '1m0s'

# -data-path='': path to store disk-backed messages
default['nsq']['nsqd']['data_path'] = '/var/spool/nsq'

# -tls-cert='': path to tls certificate file
default['nsq']['nsqd']['tls_cert'] = ''

# -tls-key='': path to tls private key file
default['nsq']['nsqd']['tls_key'] = ''

# -tls-client-auth-policy="": client certificate auth policy ('require' or 'require-verify')
default['nsq']['nsqd']['tls_client_auth_policy'] = ''

# -tls-root-ca-file="": path to private certificate authority pem
default['nsq']['nsqd']['tls_root_ca_file'] = ''

# -tls-required=false: require TLS for client connections
default['nsq']['nsqd']['tls_required'] = false

# -http-address='0.0.0.0:4151': <addr>:<port> to listen on for HTTP clients
default['nsq']['nsqd']['http_address'] = '0.0.0.0:4151'

# -https-address="": <addr>:<port> to listen on for HTTPS clients
default['nsq']['nsqd']['https_address'] = '0.0.0.0:4152'

# -lookupd-tcp-address=[]: lookupd TCP address (may be given multiple times)
default['nsq']['nsqd']['lookupd_tcp_address'] = ['127.0.0.1:4160']

# -max-body-size=5123840: maximum size of a single command body
default['nsq']['nsqd']['max_body_size'] = '5123840'

# -max-bytes-per-file=104857600: number of bytes per diskqueue file before rolling
default['nsq']['nsqd']['max_bytes_per_file'] = '104857600'

# -max-message-size=1024768: (deprecated (0.2.27) use --max-msg-size) maximum size of a single message in bytes
default['nsq']['nsqd']['max_message_size'] = '1024768'

# -max-msg-size=1024768: maximum size of a single message in bytes
default['nsq']['nsqd']['max_msg_size'] = '1024768'

# -mem-queue-size=10000: number of messages to keep in memory (per topic/channel)
default['nsq']['nsqd']['mem_queue_size'] = '10000'

# -max-msg-timeout=15m0s: maximum duration before a message will timeout
default['nsq']['nsqd']['max_msg_timeout'] = '15m0s'

# -max-rdy-count=2500: maximum RDY count for a client (per topic/channel)
default['nsq']['nsqd']['max_rdy_count'] = '2500'

# -msg-timeout='60s': duration to wait before auto-requeing a message
default['nsq']['nsqd']['msg_timeout'] = '15m0s'

# -statsd-address='': UDP <addr>:<port> of a statsd daemon for writing stats
default['nsq']['nsqd']['statsd_address'] = '127.0.0.1:8125'

# -statsd-interval=30: seconds between pushing to statsd
default['nsq']['nsqd']['statsd_interval'] = '30'

# -statsd-mem-stats=true: toggle sending memory and GC stats to statsd
default['nsq']['nsqd']['statsd_mem_stats'] = true

# -statsd-prefix='': prefix for statsd keys
default['nsq']['nsqd']['statsd_prefix'] = 'nsq.%s'

# -sync-every=2500: number of messages between diskqueue syncs
default['nsq']['nsqd']['sync_every'] = '2500'

# -sync-timeout=2s: duration of time per diskqueue fsync
default['nsq']['nsqd']['sync_timeout'] = '2s'

# -tcp-address='0.0.0.0:4150': <addr>:<port> to listen on for TCP clients
default['nsq']['nsqd']['tcp_address'] = '0.0.0.0:4150'

# -verbose=false: enable verbose logging
default['nsq']['nsqd']['verbose'] = false

# -worker-id=0: unique identifier (int) for this worker (will default to a hash of hostname)
default['nsq']['nsqd']['worker_id'] = '0'

# -broadcast-address='': address that will be registered with lookupd, (default to the OS hostname)
default['nsq']['nsqd']['broadcast_address'] = ''

# -e2e-processing-latency-percentile:none message processing time percentiles to keep track of (can be specified multiple times or comma separated, default none)
default['nsq']['nsqd']['e2e_processing_latency_percentile'] = '1.0,0.99,0.95'

# -e2e-processing-latency-window-time=10m0s: calculate end to end latency quantiles for this duration of time (ie: 60s would only show quantile calculations from the past 60 seconds)
default['nsq']['nsqd']['e2e_processing_latency_window_time'] = '10m0s'
