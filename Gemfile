#!/usr/bin/env bundle

source 'https://rubygems.org'

# === Middleman ===

gem 'middleman',              '~> 3.3.12'
gem 'middleman-autoprefixer', '~> 2.5.0'
gem 'middleman-wundertuete',  github: 'bitaculous/middleman-wundertuete'

# === Assets ===

gem 'assetify', github: 'bitaculous/assetify'

# === Misc ===

gem 'andand', '~> 1.3.3'

group :development do
  # === Middleman ===

  gem 'middleman-livereload', '~> 3.3.4'
end

group :production do
  # === Assets ===

  gem 'therubyracer', '~> 0.12.1', require: RUBY_PLATFORM.include?('linux') && 'v8'
end