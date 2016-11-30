name             "dataloop-agent"
maintainer       'Dataloop Software Limited'
maintainer_email 'support@dataloop.io'
license          'All rights reserved'
description      'Installs/Configures dataloop'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.5'

depends 'apt',      '~> 2.9.2'
depends 'yum',     '~> 3.8.2'
