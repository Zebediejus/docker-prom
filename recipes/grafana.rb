# Recipe for grafana installation

# Create directories and place config files
directory '/etc/grafana/provisioning/datasources' do
  recursive true
  mode '0755'
  action :create
end

directory '/etc/grafana/provisioning/dashboards' do
  recursive true
  mode '0755'
  action :create
end

directory '/var/lib/grafana/dashboards' do
  recursive true
  mode '0755'
  action :create
end

template '/etc/grafana/provisioning/datasources/datasource.yaml' do
  source 'grafana/datasource.erb'
  mode '0755'
end

template '/etc/grafana/provisioning/dashboards/dashboards.yaml' do
  source 'grafana/dashboards.erb'
  mode '0755'
end

# Predefined dashboards
node['grafana']['dashboards'].each do |_dash, properties|
  template "/var/lib/grafana/dashboards/#{properties['name']}.json" do
    source "grafana/#{properties['name']}.erb"
    mode '0755'
  end
end

# Get docker image
docker_image 'grafana' do
  repo node['grafana']['docker_image_repo']
  tag node['grafana']['docker_image_tag']
  action :pull
end

# Create container
docker_container 'grafana' do
  repo node['grafana']['docker_image_repo']
  tag node['grafana']['docker_image_tag']
  action :run
  restart_policy 'always'
  port node['grafana']['docker_port']
  volumes ['/etc/grafana/provisioning:/etc/grafana/provisioning', '/var/lib/grafana/dashboards:/var/lib/grafana/dashboards']
end
