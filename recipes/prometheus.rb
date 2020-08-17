# Recipe for prometheus installation

# Restart on config change
execute 'prometheus-restart' do
  command 'docker restart prometheus'
  action :nothing
end

# Create volume for prometheus
docker_volume 'prometheusdata' do
  action :create
end

# Create folder for config
directory '/etc/prometheus' do
  mode '0755'
  action :create
end

# Config file
template '/etc/prometheus/prometheus.yml' do
  source 'prometheus/prometheus.erb'
  mode '0755'
  notifies :run, 'execute[prometheus-restart]', :delayed
end

# Get docker image
docker_image 'prometheus' do
  repo node['prometheus']['docker_image_repo']
  tag node['prometheus']['docker_image_tag']
  action :pull
end

# Create container
docker_container 'prometheus' do
  repo node['prometheus']['docker_image_repo']
  tag node['prometheus']['docker_image_tag']
  action :run
  restart_policy 'always'
  port node['prometheus']['docker_port']
  volumes ['/etc/prometheus/:/etc/prometheus/', 'prometheusdata:/prometheus']
end
