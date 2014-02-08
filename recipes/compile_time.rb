#
# Install, configure, and start etcd in one go @ compile time
#


url = gh_bin_url
if node[:etcd][:url]
  url = node[:etcd][:url]
end

# hack to get compile time installation
a = ark "etcd" do
  has_binaries ["etcd", "etcdctl"]
  version node[:etcd][:version]
  url url
  checksum node[:etcd][:sha256]
  action :install
end

a.run_action :install

directory File.dirname node[:etcd][:state_dir]

args = node[:etcd][:args]
args << etcd_peers_arg

t = template "/etc/init/etcd.conf" do
  mode 0644
  variables(args: args)
  notifies :restart, "service[etcd]", :immediately
end

s = service "etcd" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

t.run_action :create
s.run_action :start
