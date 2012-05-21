package 'git-core'

remote_file '/tmp/gitflow-installer.sh' do
  source    'https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh'
  mode      0775
  notifies  :run, 'execute[install-gitflow]', :immediately
end

execute 'install-gitflow' do
  command '/tmp/gitflow-installer.sh'
  action  :nothing
end
