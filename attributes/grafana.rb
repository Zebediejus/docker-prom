default['grafana']['docker_image_repo'] = 'grafana/grafana'
default['grafana']['docker_image_tag'] = '7.1.3'
default['grafana']['docker_port'] = '3000:3000'
default['grafana']['dashboards'] = {
  'node_exporter' => { 'name' => 'node_exporter_full_rev21' },
  'cadvisor'      => { 'name' => 'docker_and_os_metrics_rev1' },
}
