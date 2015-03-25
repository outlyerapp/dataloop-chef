case node['platform_family']
when 'rhel', 'fedora'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/packages/unstable/rpm/$basearch/"
when 'debian'
  default['dataloop']['package_repository'] = "https://download.dataloop.io/deb"
  default['dataloop']['package_gpg_key'] = 'https://download.dataloop.io/pubkey.gpg'
  default['dataloop']['package_distribution'] = 'unstable'
end
