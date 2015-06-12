# Perl dependencies for check_redis
apt_package 'gcc'

include_recipe 'cpan::bootstrap'

cpan_client 'PerlIO::utf8_strict' do
  action 'install'
  install_type 'cpan_module'
  user 'root'
  group 'root'
end

cpan_client 'Mixin::Linewise::Readers' do
  action 'install'
  install_type 'cpan_module'
  user 'root'
  group 'root'
end

cpan_client 'Redis' do
  action 'install'
  install_type 'cpan_module'
  user 'root'
  group 'root'
end