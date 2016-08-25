name             'linux-kernel-dev'
maintainer       'Chris Horton'
maintainer_email 'hortoncd@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures assorted packages required for linux kernel development'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'debian'
supports 'ubuntu'
supports 'centos'

depends 'apt'
depends 'yum-epel'
depends 'build-essential'
