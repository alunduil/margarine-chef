current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "alunduil"
client_key               "#{current_dir}/alunduil.pem"
validation_client_name   "margarine-validator"
validation_key           "#{current_dir}/margarine-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/margarine"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
