class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :employee, dependent: :destroy
  has_and_belongs_to_many :events

  after_create :send_email, :create_employee

  private

  def send_email
    SendWelcomeEmailJob.set(wait: 1.minute).perform_later(self)
  end

  def create_employee
    CreateEmployeeJob.set(wait: 2.minute).perform_later(self)
  end
end
