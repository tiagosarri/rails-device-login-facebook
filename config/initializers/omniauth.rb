# get credentials from YML file
if (Rails.env != 'production')
  SOCIAL_NETWORK_CONFIG = YAML::load(File.open("#{::Rails.root.to_s}/config/social_network.yml"))[Rails.env]
else
  SOCIAL_NETWORK_CONFIG = JSON.parse(ENV['SOCIAL_NETWORK'])
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, SOCIAL_NETWORK_CONFIG['facebook_application_id'], SOCIAL_NETWORK_CONFIG['facebook_secret_key'], {:scope => 'offline_access,email'}
end

OmniAuth.config.on_failure = Proc.new do |env| new_path = "/auth/failure"
  [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
end