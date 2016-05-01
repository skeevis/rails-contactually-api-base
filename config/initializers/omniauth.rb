Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :contactually, ENV['CONTACTUALLY_APP_ID'], ENV['CONTACTUALLY_APP_SECRET'], :scope=>"all:manage", :strategy_class => "OmniAuth::Strategies::Contactually"
end