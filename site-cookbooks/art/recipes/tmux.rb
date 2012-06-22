package "tmux"

cookbook_file "/home/#{node[:user]}/.tmux.conf" do
  source  "tmux.conf"
  owner   node[:user]
  group   node[:user]
end

