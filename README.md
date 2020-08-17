# Chef cookbook for Prometheus stack
This Cookbook is installing and configuring following services on CentOS 7:
- Docker service
- Prometheus container
- cAdvisor container
- node_exporter container
- Grafana container

Prometheus is scraping node_exporter and cAdvisor metrics.
Grafana is prepared with two dashboards for `docker` containers and `node_exporter` metrics. 

# How to use
Each service/container have their own attributes and recipes. 
You can use `installnode.rb` recipe, which includes all needed recipes.

# Things to consider
Grafana comes with two predefined dashboards. If more dashboards will be created later, it's worth considering persistent storage for grafana container.
Access to Grafana is left with default credentials. This should be improved when proper secret storage is available.
