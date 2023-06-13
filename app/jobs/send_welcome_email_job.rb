class SendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.with(user:).welcome_email.deliver_now
  end
end
