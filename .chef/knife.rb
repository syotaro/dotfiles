log_level                :info
log_location             STDOUT
node_name                'yamamoto'
client_key               '/Users/yamamoto/.chef/yamamoto.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef/validation.pem'
chef_server_url          'http://yamamoto-office-imac:4000'
syntax_check_cache_path  '/Users/yamamoto/.chef/syntax_check_cache'
knife[:solo_path] = '/tmp/chef-solo'

