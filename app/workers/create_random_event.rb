class CreateRandomEvent
  include Sidekiq::Worker

  def perform
    Event.create(name: "test_event#{(50..100).to_a.sample}", event_date: Time.now + (10..20).to_a.sample)
  end
end
