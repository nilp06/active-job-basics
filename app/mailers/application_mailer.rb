class ApplicationMailer < ActionMailer::Base
  default from: ENV['gmail_user']
  layout 'mailer'
end
