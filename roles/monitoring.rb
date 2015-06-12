name 'monitoring'
description 'Monitoring server'

run_list 'recipe[nagios::default]', 'recipe[nagios-nodes]'

default_attributes 'nagios' => { 
  'server_auth_method' => 'htauth',
  'check_external_commands' => true
}