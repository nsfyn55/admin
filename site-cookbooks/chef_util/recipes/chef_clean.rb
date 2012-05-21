directory "/tmp/chef-solo" do
    owner   "ubuntu"
    group   "ubuntu"
    mode    0600
    recursive true
    action  :delete
end
