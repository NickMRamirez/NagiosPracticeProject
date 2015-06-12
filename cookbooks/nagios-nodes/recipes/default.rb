#
# Cookbook Name:: nagios-nodes
# Recipe:: default
#
# Copyright (c) Nick Ramirez, All Rights Reserved.

def return_if_path_contains(cookbook_files, look_for)
  cookbook_files.select { |f| f['path'] =~ /#{look_for}/ }
end

conf_dir = '/etc/nagios3/conf.d'
all_cookbook_files = run_context.cookbook_collection[cookbook_name].manifest['files']

# -------------Define hosts--------------
hosts_dir = File.join(conf_dir, 'hosts')
directory hosts_dir do
  owner 'nagios'
  group 'nagios'
end

hosts_files = return_if_path_contains(all_cookbook_files, '/default/hosts')
hosts_files.each do |file|
  cookbook_file File.join(hosts_dir, file['name']) do
    source file['path'].sub('files/default/', '')
    owner 'nagios'
    group 'nagios'
  end
end

# --------------Define hostgroups--------------
hostgroups_dir = File.join(conf_dir, 'hostgroups')
directory hostgroups_dir do 
  owner 'nagios'
  group 'nagios'
end

hostgroups_files = return_if_path_contains(all_cookbook_files, '/default/hostgroups')
hostgroups_files.each do |file|
  cookbook_file File.join(hostgroups_dir, file['name']) do
    source file['path'].sub('files/default/', '')
    owner 'nagios'
    group 'nagios'
  end
end

# --------------Define commands--------------
commands_dir = File.join(conf_dir, 'commands')

directory commands_dir do
  owner 'nagios'
  group 'nagios'
end

commands_files = return_if_path_contains(all_cookbook_files, '/default/commands')

commands_files.each do |file|
  cookbook_file File.join(commands_dir, file['name']) do
    source file['path'].sub('files/default/', '')
    owner 'nagios'
    group 'nagios'
  end
end

# --------------Define services--------------
services_dir = File.join(conf_dir, 'services')

directory services_dir do
  owner 'nagios'
  group 'nagios'
end

services_files = return_if_path_contains(all_cookbook_files, '/default/services')

services_files.each do |file|
  cookbook_file File.join(services_dir, file['name']) do
    source file['path'].sub('files/default/', '')
    owner 'nagios'
    group 'nagios'
  end
end

# --------------Restart Nagios--------------
service 'nagios3' do
  action :restart
end


