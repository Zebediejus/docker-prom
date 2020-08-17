describe port(8080) do
  it { should be_listening }
end

describe command('curl -XGET -s http://localhost:8080/docker/') do
  its('stdout') { should match /.*>prometheus .*/ }
  its('stdout') { should match /.*>grafana .*/ }
  its('stdout') { should match /.*>cadvisor .*/ }
end
