class SendEventInviterJob < ApplicationJob
  queue_as :default

  def perform(user, event)
    UserMailer.with(user:,
                    event:).send_event_invite.deliver_now
  end
end
