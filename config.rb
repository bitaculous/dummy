activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = true
  config.inline   = false
  config.ignore   = []
end

activate :wundertuete

set :css_dir,    'assets/stylesheets'
set :fonts_dir,  'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

set :logging, ENV['RACK_ENV'] != 'production'

page '*', layout: 'default'

configure :development do
  require 'middleman-livereload'

  activate :livereload, host: '0.0.0.0', port: '35729'

  set :debug_assets, true
end

configure :build do # Build-specific configuration
  # activate :relative_assets
  activate :asset_hash, ignore: %r{^*fonts/.*}
  activate :minify_css
  activate :minify_javascript
  activate :gzip
end

after_configuration do
  set :haml, {
    format: :xhtml,
    attr_wrapper: '"',
    ugly: false
  }
end

# Ignore Photoshop documents
ignore 'assets/images/**/*.psd'