# All recipes in one for easy chef-run

include_recipe 'docker-prom::base'
include_recipe 'docker-prom::docker'
include_recipe 'docker-prom::prometheus'
include_recipe 'docker-prom::cadvisor'
include_recipe 'docker-prom::nodeexporter'
include_recipe 'docker-prom::grafana'
