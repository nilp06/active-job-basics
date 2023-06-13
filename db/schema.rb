ActiveRecord::Schema[7.0].define(version: 20_230_612_083_626) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'employees', force: :cascade do |t|
    t.string 'name'
    t.string 'department'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_employees_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.datetime 'event_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
  end

  create_table 'events_users', id: false, force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'event_id', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'employees', 'users'
end
