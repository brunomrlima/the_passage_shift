# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => Rails.application.credentials.sendgrid_username,
    :password => Rails.application.credentials.sendgrid_api_key,
    :domain => 'the-passage-shift.herokuapp.com/',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}