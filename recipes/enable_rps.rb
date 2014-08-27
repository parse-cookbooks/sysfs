include_recipe "sysfs::default"

# Enable Receive Packet Steering(RPS) on eth0 receive queues
# The value is hex for the number of CPUs with RPS affinity
# 'f' will enable RPS affinity for up to 16 CPUs
sysfs 'class/net/eth0/queues/rx-0/rps_cpus' do
  value 'f'
  only_if { File.exist?('/sys/class/net/eth0/queues/rx-0/rps_cpus') }
end
