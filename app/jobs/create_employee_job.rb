class CreateEmployeeJob < ApplicationJob
  queue_as :default

  def perform(user)
    employee = Employee.new(name: user.name, department: %w[Pthon Ruby Java].sample)
    user.employee = employee
  end
end
