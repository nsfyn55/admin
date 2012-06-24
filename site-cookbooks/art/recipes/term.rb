package "ncurses-term"
package "ttf-inconsolata"
package "x11-xserver-utils"

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

cookbook_file "/home/#{node[:user]}/.Xdefaults" do
  source  "Xdefaults"
  owner   node[:user]
  group   node[:user]
end

cookbook_file "/home/#{node[:user]}/.Xresources" do
  source  "Xresources"
  owner   node[:user]
  group   node[:user]
end

 directory "/home/#{node[:user]}/.terminfo" do
  owner   node[:user]
  group   node[:user]
  mode    0700
  action  :create
 end

cookbook_file "/home/#{node[:user]}/.terminfo/xterm-256color.ti" do
  source  "xterm-256color.ti"
  owner   node[:user]
  group   node[:user]
end

package "tmux"

cookbook_file "/home/#{node[:user]}/.tmux.conf" do
  source  "tmux.conf"
  owner   node[:user]
  group   node[:user]
end



