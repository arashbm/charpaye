Airbrake.configure do |config|
  config.api_key = '39d3e101c90d66cae9db3e5ced349872'
  config.host    = 'charpaye-exceptions.herokuapp.com'
  config.port    = 443
  config.secure  = config.port == 443
end
