case node['platform_family']
when 'rhel', 'fedora'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/packages/stable/rpm/$basearch/"
when 'debian'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/packages/unstable/ubuntu/"
end

