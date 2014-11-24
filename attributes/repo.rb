case node['platform_family']
when 'rhel', 'fedora'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/packages/unstable/rpm/centos/#{node['platform_version'].to_i}/$basearch/"
when 'debian'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/packages/unstable/ubuntu/"
end

