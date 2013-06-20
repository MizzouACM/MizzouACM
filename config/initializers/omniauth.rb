Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], :scope => 'user:email'
  else
    provider :developer unless Rails.env.production?
  end
end