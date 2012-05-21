package 'g++'

PROTOBUF_SRC="http://protobuf.googlecode.com/files/protobuf-#{node[:protobuf][:version]}.tar.bz2"
PROTOBUF_DIR="/usr/local/src/protobuf/#{node[:protobuf][:version]}"

script "build_protobuf" do
  interpreter  "bash"
  cwd          PROTOBUF_DIR
  action       :nothing

  code <<-EOF
  wget #{PROTOBUF_SRC}
  tar -xjvf protobuf-#{node[:protobuf][:version]}.tar.bz2
  cd protobuf-#{node[:protobuf][:version]}
  sh ./configure
  make
  make install
  EOF
end

directory PROTOBUF_DIR do
  recursive true
  owner     node[:user]
  notifies  :run, resources(:script => "build_protobuf")
end

# blah. Whatever
link "/usr/lib/libprotobuf.so.7" do
  to "/usr/local/lib/libprotobuf.so.7"
end
link "/usr/lib/libprotoc.so.7" do
  to "/usr/local/lib/libprotoc.so.7"
end
