package "openjdk-6-jdk"
package "gedit"
package "maven2"
package "protobuf-compiler"

directory "/home/#{node[:user]}/opt/" do
	owner   node[:user] 
	group   node[:user] 
	mode    0755
	action  :create
end

directory "/home/#{node[:user]}/bin/" do
	owner   node[:user] 
	group   node[:user] 
	mode    0755
	action  :create
end

bash "Download and Install Eclipse" do
  user    node[:user]
	code <<-EOH
	cd /home/#{node[:user]}//opt
  wget http://www.gtlib.gatech.edu/pub/eclipse/technology/epp/downloads/release/indigo/SR2/eclipse-java-indigo-SR2-linux-gtk.tar.gz
  tar -xzf eclipse-java-indigo-SR2-linux-gtk.tar.gz
  cd /home/#{node[:user]}/bin
	EOH
  not_if  "test -d /home/#{node[:user]}/opt/eclipse"
end
