OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, '1964457013797700', '548c99a95ccf6253d2fcd2e9b9931050',{:provider_ignores_state => true}
  provider :google_oauth2, '1058339180581-et1k3u81ll6ji8q27bs3q777u1do8tdc.apps.googleusercontent.com', 'vn-Aa97wDFInTxxz7cAgl6RD', {  verify_iss: 'false',grant_type: 'authorization_code',access_type: 'offline',prompt: 'consent' ,scope: ['https://www.googleapis.com/auth/calendar','https://mail.google.com/', 'https://www.googleapis.com/auth/userinfo.email','email'],client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end