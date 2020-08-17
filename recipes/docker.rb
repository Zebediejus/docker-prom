# Recipe for Docker install

# Setup yum repo
yum_repository 'docker-ce-stable' do
  baseurl   'https://download.docker.com/linux/centos/7/$basearch/stable'
  gpgkey    'https://download.docker.com/linux/centos/gpg'
  gpgcheck  true
  enabled   true
  action    :create
end

# Install package
yum_package 'docker-ce' do
  action :install
end

# Enable service
service 'docker' do
  action [:enable, :start]
end
