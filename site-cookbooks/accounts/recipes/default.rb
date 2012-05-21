gem_package "ruby-shadow" do
  action  :install
end

node[:accounts][:users].each_pair do |username, params|
  user username do
    home      "/home/#{username}"
    shell     params[:shell] || "/bin/bash"
    password  params[:password_hash]
    supports  :manage_home => true
  end

  directory "/home/#{username}/.ssh" do
    owner   username
    group   username
    mode    0700
    action  :create
  end

  cookbook_file "/home/#{username}/.ssh/config" do
    source  "ssh/config"
    owner   username
    group   username
    mode    0600
  end

  cookbook_file "/home/#{username}/.ssh/authorized_keys2" do
    source  params[:public_key]
    owner   username
    group   username
    mode    0600
  end
end

group 'admin' do
  members   node[:accounts][:users].keys
  append    true
end
