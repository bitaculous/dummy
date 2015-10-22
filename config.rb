# === Variables ===

configuration = Confstruct::Configuration.new(
  build: {
    asset_host: '/'
  }
)

# === Settings ===

set :environment, ENV['ENVIRONMENT'] || config[:environment]

set :css_dir,    'assets/stylesheets'
set :fonts_dir,  'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

page '*', layout: 'default'

# === Extensions ===

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = true
  config.inline   = false
  config.ignore   = []
end

activate :wundertuete

# === Development ===

configure :development do
  set :logging,      true
  set :debug_assets, true

  activate :livereload, host: '0.0.0.0', port: '35729' unless environment == 'deployment'
end

# === Build ===

configure :build do
  # activate :directory_indexes

  # activate :relative_assets
  activate :asset_hash, ignore: %r(^*fonts/*)
  activate :minify_css
  activate :minify_javascript
  # activate :gzip

  # activate :asset_host

  # set :asset_host, configuration.build.asset_host

  # set :asset_host do |asset|
  #  configuration.build.asset_host % (asset.hash % 4)
  # end

  # activate :favicon_maker do |config|
  #   config.template_dir = File.join root, 'source/assets'
  #   config.output_dir   = File.join root, 'build/assets'
  #
  #   config.icons = {
  #     'favicon.png' => [
  #       { icon: 'android-chrome-36x36.png',   size: '36x36' },
  #       { icon: 'android-chrome-48x48.png',   size: '48x48' },
  #       { icon: 'android-chrome-72x72.png',   size: '72x72' },
  #       { icon: 'android-chrome-96x96.png',   size: '96x96' },
  #       { icon: 'android-chrome-144x144.png', size: '144x144' },
  #       { icon: 'android-chrome-192x192.png', size: '192x192' },
  #
  #       { icon: 'apple-touch-icon-57x57.png',   size: '57x57' },
  #       { icon: 'apple-touch-icon-60x60.png',   size: '60x60' },
  #       { icon: 'apple-touch-icon-72x72.png',   size: '72x72' },
  #       { icon: 'apple-touch-icon-76x76.png',   size: '76x76' },
  #       { icon: 'apple-touch-icon-114x114.png', size: '114x114' },
  #       { icon: 'apple-touch-icon-120x120.png', size: '120x120' },
  #       { icon: 'apple-touch-icon-144x144.png', size: '144x144' },
  #       { icon: 'apple-touch-icon-152x152.png', size: '152x152' },
  #       { icon: 'apple-touch-icon-180x180.png', size: '180x180' },
  #
  #       { icon: 'favicon-16x16.png',   size: '16x16' },
  #       { icon: 'favicon-32x32.png',   size: '32x32' },
  #       { icon: 'favicon-96x96.png',   size: '96x96' },
  #       { icon: 'favicon-192x192.png', size: '192x192' },
  #       { icon: 'favicon.ico',         size: '48x48,32x32,16x16' },
  #
  #       { icon: 'mstile-70x70.png',   size: '70x70' },
  #       { icon: 'mstile-144x144.png', size: '144x144' },
  #       { icon: 'mstile-150x150.png', size: '150x150' },
  #       { icon: 'mstile-310x310.png', size: '310x310' },
  #       { icon: 'mstile-310x150.png', size: '310x150' }
  #     ]
  #   }
  # end
end

# === Misc ===

after_configuration do
  set :haml, format: :xhtml, attr_wrapper: '"', ugly: false
end

# Ignore Photoshop documents
ignore 'assets/images/**/*.psd'

# Ignore Favicon
ignore 'assets/favicon.png'