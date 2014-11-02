activate :wundertuete

set :css_dir,    'assets/stylesheets'
set :fonts_dir,  'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

page '*', layout: 'default'

configure :development do
  require 'middleman-livereload'

  activate :livereload

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
    attr_wrapper: "\"",
    ugly: false
  }
end