# Chef cookbook for Prometheus stack
This Cookbook is for installing and configuring following services on CentOS 7:
- Docker service
- Prometheus container
- cAdvisor container
- node_exporter container
- Grafana container

Prometheus is scraping node_exporter and cAdvisor metrics.
Grafana is prepared with two dashboards for `docker` containers and `node_exporter` metrics. Access to Grafana is left with default credentials. This should be improved when proper secret storage is available.

# How to use
Each service/container have their own attributes and recipes. 
For more confortable use with `chef-run` you can use `installnode.rb` recipe, which includes all needed recipes.
