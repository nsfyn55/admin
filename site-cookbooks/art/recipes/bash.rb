cookbook_file "/home/#{node[:user]}/.bash_profile" do
  source  "bash_profile"
  owner   node[:user]
  group   node[:user]
end

