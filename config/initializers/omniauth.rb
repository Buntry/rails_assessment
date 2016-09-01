Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '1257973500888535', '309a0ed2ee580e4297d4129afd6f8dfc'
end