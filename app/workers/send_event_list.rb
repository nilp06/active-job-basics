class SendEventList
  include Sidekiq::Worker

  def perform
    events = Event.all
    User.find_each do |user|
      UserMailer.with(user: user, events: events).send_events.deliver_now
    end
  end
end
