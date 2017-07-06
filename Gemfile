source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'

gem 'pg'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
  gem 'guard'
  gem 'guard-minitest'
  gem 'libnotify'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'minitest-reporters-json_reporter'
  gem 'capybara'
  gem 'rack-test'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
