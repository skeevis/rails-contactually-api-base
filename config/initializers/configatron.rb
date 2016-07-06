require 'configatron'
#Configatron::Rails.init
config_file = ERB.new(File.read("#{Rails.root}/config/config.yml")).result
configuration_hash = YAML.load(config_file)[Rails.env] || {}
configatron.configure_from_hash(configuration_hash)

puts "Test String: #{configatron.test_string}"