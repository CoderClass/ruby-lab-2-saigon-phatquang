OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '376834262519185', 'ee338bf8111152d252f5af406d6b5bae'
end