class ChangeDepartment < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :department, :string
  end
end
