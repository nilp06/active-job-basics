class CreateJoinTableEmployeesEvents < ActiveRecord::Migration[7.0]
  def change
    create_join_table :employees, :events
  end
end
