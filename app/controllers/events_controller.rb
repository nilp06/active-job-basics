class EventsController < ApplicationController
    before_action :set_event, only: [ :enroll ]
    def index
        @events = Event.all
    end

    def enroll
        if current_user.events.include? @event
            flash[:danger] = "You have alredy enrolled in this event."
        else
            current_user.events << @event
            flash[:success] = "Enrolled in event."
        end
        redirect_to events_path
    end

    def set_event
        @event = Event.find(params[:id])
    end
end
