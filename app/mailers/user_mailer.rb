class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Application')
  end

  def send_events
    @user = params[:user]
    @events = params[:events]
    mail(to: @user.email, subject: 'Event List')
  end
end
