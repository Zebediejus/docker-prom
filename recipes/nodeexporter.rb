# Recipe for node-exporter installation

# Setup yum repo
yum_repository  'prometheus-rpm_release' do
  baseurl       'https://packagecloud.io/prometheus-rpm/release/el/7/$basearch'
  gpgkey        'https://packagecloud.io/prometheus-rpm/release/gpgkey'
  gpgcheck      false
  repo_gpgcheck true
  enabled       true
  action        :create
end

# Install package
yum_package 'node_exporter' do
  action :install
end

# Enable service
service 'node_exporter' do
  action [:enable, :start]
end
