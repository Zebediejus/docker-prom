# Recipe for preparing Centos 7 host

# Disable firewalld
service 'firewalld' do
  action [:disable, :stop]
end
