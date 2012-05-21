package "vim-nox"
package "exuberant-ctags"

directory "/home/#{node[:user]}/bin" do
  owner node[:user]
  group node[:user]
  mode  "0755"
  action :create
end

cookbook_file "/home/#{node[:user]}/.gitconfig" do
  source  "gitconfig"
  owner   node[:user]
  group   node[:user]
  mode    "0755"
end

cookbook_file "/home/#{node[:user]}/bin/git_diff_wrapper" do
  source  "git_diff_wrapper"
  owner   node[:user]
  group   node[:user]
  mode    "0755"
end

cookbook_file "/home/#{node[:user]}/.vimrc" do
  source  "vim/vimrc"
  owner   node[:user]
  group   node[:user]
end

remote_directory "/home/#{node[:user]}/.vim" do
  source      "vim/vim"
  files_owner node[:user]
  files_group node[:user]
  files_mode  0664
end

script "change_ownership_of_plugins_dir" do
  interpreter "bash"
  user "root"
  cwd "/home/#{node[:user]}"
  code <<-EOH
    chown -R #{node[:user]}:#{node[:user]} .vim 
  EOH
end
