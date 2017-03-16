require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.filter_sensitive_data('<RIOTAPIKEY>') { ENV['RIOT_API_KEY'] }
end
