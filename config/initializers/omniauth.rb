OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "741855324571-iign1o1nm9ql6ffiskcoq0rdidndrk68.apps.googleusercontent.com", "rA0rt4MFDwi_ZLGnFyIyxaXX"
end
