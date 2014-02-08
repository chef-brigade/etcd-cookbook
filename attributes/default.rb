#
default[:etcd][:install_method] = "binary"

# cluster options
default[:etcd][:seed_node] = nil

# if you wrap this cookbook you should use your wrappers cook name here
default[:etcd][:search_cook] = "etcd"

# set to false if you don't want environment scoped searching
default[:etcd][:env_scope] = true

# service start args to pass
default[:etcd][:args] = " -addr #{ipaddress}:4001 -peer-addr #{ipaddress}:7001"

# v0.3.0 API cluster discovery
default[:etcd][:discovery] = ""

# nodes in cluster
default[:etcd][:nodes] = []

# Activate snapshoting
default[:etcd][:snapshot] = true

# Allow locally
default[:etcd][:local] = true

# restart etcd when the config file is updated
default[:etcd][:trigger_restart] = true

# Upstart parameters for starting/stopping etcd service
default[:etcd][:upstart][:start_on] = "started networking"
default[:etcd][:upstart][:stop_on] = "shutdown"


# Release to install
default[:etcd][:version] = "0.3.0"

# Sha for github tarball Linux by default
default[:etcd][:sha256] = "18be476ba59db42c573ee23fbe00f4a205830ac54f752c0d46280707603c9192"

# Use this to supply your own url to a tarball
default[:etcd][:url] = nil

default[:etcd][:state_dir] = "/var/cache/etcd/state"

# Used for source_install method
default[:etcd][:source][:repo] = "https://github.com/coreos/etcd"
default[:etcd][:source][:revision] = "HEAD"
default[:etcd][:source][:go_ver] = "1.1.2"
default[:etcd][:source][:go_url] = nil
default[:etcdctl][:source][:repo] = "https://github.com/coreos/etcdctl"
default[:etcdctl][:source][:revision] = "HEAD"
