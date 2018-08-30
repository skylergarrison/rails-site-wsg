require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MySite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    def download
      file = "#{Rails.root}/skyler-resume.pdf"
      if File.exists?(file)
        send_file file, :type=>"application/pdf", :x_sendfile=>true
      else
        flash[:notice] = 'File not found'
        redirect_to :index
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
