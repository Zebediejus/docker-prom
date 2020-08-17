# Recipe for cadvisor installation

# Get docker image
docker_image 'cadvisor' do
  repo node['cadvisor']['docker_image_repo']
  tag node['cadvisor']['docker_image_tag']
  action :pull
end

# Create container
docker_container 'cadvisor' do
  repo node['cadvisor']['docker_image_repo']
  tag node['cadvisor']['docker_image_tag']
  action :run
  restart_policy 'always'
  port node['cadvisor']['docker_port']
  privileged true
  volumes ['/:/rootfs:ro', '/var/run:/var/run:rw', '/sys:/sys:ro', '/var/lib/docker/:/var/lib/docker:ro', '/cgroup:/cgroup:ro']
end
