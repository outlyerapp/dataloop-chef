default['dataloop']['package_gpg_key'] = 'https://download.dataloop.io/pubkey.gpg'
default['dataloop']['package_gpg_id'] = '113E2B8D'
default['dataloop']['package_distribution'] = 'stable'
case node['platform_family']
when 'rhel', 'fedora'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/packages/#{node['dataloop']['package_distribution']}/el$releasever/$basearch/"
when 'debian'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/deb"
end
