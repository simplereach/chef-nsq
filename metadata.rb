name 'nsq'
maintainer 'SimpleReach'
maintainer_email 'elubow@simplereach.com'
license 'All rights reserved'
description 'Installs/Configures nsqd, nsqlookupd, and nsqadmin'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.2.1'

supports 'debian', '>= 6.0'
supports 'ubuntu', '>= 10.04'

depends 'ark', '>= 0.1.0'
depends 'users', '>= 0.1.5'

provides 'nsq::nsqadmin'
provides 'nsq::nsqlookupd'
provides 'nsq::nsqd'
provides 'nsq::install'
provides 'service::nsqd'
provides 'service::nsqlookupd'
provides 'service::nsqadmin'
