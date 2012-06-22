cookbook_file "/home/#{node[:user]}/.bash_profile" do
  source  "bash_profile"
  owner   node[:user]
  group   node[:user]
end

cookbook_file "/home/#{node[:user]}/.bashrc" do
  source  "bashrc"
  owner   node[:user]
  group   node[:user]
end

cookbook_file "/home/#{node[:user]}/.bash_aliases" do
  source  "bash_aliases"
  owner   node[:user]
  group   node[:user]
end

