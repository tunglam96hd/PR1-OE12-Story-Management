source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.6"
gem "bootstrap-sass", "~> 3.3.7"
gem "bcrypt", "~> 3.1.12"
gem "ffaker", "~> 2.7.0"
gem "carrierwave", "~> 1.2.2"
gem "mini_magick", "~> 4.7.0"
gem "kaminari", "~> 1.1.1"
gem "bootstrap-kaminari-views", "~>0.0.5"
gem "bootstrap-sass", "~> 3.3.7"
gem "puma", "~> 3.9.1"
gem "sass-rails", "~> 5.0.6"
gem "uglifier", "~> 3.2.0"
gem "jquery-rails", "~> 4.3.1"
gem "turbolinks", "~> 5.0.1"
gem "jbuilder", "~> 2.7.0"
gem "i18n", "~> 0.7.0"
gem "config", "~> 1.4.0"

group :development, :test do
  gem "mysql2", "~> 0.4.4"
  gem "byebug",  "~> 9.0.6", platform: :mri
end

group :development do
  gem "web-console", "~> 3.5.1"
  gem "listen", "~> 3.1.5"
  gem "spring", "~> 2.0.2"
  gem "spring-watcher-listen", "~> 2.0.1"
end

group :test do
  gem "rails-controller-testing", "~> 1.0.2"
  gem "minitest", "~> 5.10.3"
  gem "minitest-reporters", "~> 1.1.14"
  gem "guard", "~> 2.14.1"
  gem "guard-minitest", "~> 2.4.6"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
