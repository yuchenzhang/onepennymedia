source :rubygems

gem 'pg' 
gem 'rails', '3.0.19'
gem 'require_relative'
gem 'htmlentities'
gem 'json'
gem 'bluecloth', '>= 2.0.5'
gem 'coderay', '~> 0.9'
gem 'kaminari'
gem 'RedCloth', '~> 4.2.8'
gem 'addressable', '~> 2.1.0', :require => 'addressable/uri'
gem 'mini_magick', '1.3.3', :require => 'mini_magick'
gem 'uuidtools', '~>2.1.1'
gem 'flickraw-cached'
gem 'rubypants', '~> 0.2.0'
gem 'rake', '>= 0.9.2'
gem 'acts_as_list'
gem 'acts_as_tree_rails3'
gem 'recaptcha', :require => 'recaptcha/rails', :branch => 'rails3'
gem 'squeel'

gem 'unicorn'
gem 'whenever', :require => false

group :development, :test do
  gem 'ruby-debug19'
  gem 'factory_girl', '2.2.0'
  gem 'webrat'
  gem 'rspec-rails', '>= 2.0.0.beta.20'
  gem 'simplecov', :require => false
  gem 'pry'
  gem 'sass'
end

group :deploy do
  # Use edge capistrano for bug fix in normalize_asset_timestamps untile the new version is released (> 2.13.5)
  gem 'capistrano', :git => 'git://github.com/capistrano/capistrano.git'
  # Use edge capistrano-unicorn for bug fixes.
  gem 'capistrano-unicorn', :require => false, :git => 'git://github.com/sosedoff/capistrano-unicorn.git'
end
