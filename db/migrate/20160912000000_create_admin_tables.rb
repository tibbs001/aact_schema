class CreateAdminTables < ActiveRecord::Migration

  def change

    create_table "admin.public_announcements", force: :cascade do |t|
      t.string   "description"
      t.boolean  "is_sticky"
    end

    create_table "admin.load_events", force: :cascade do |t|
      t.string   "event_type"
      t.string   "status"
      t.text     "description"
      t.text     "problems"
      t.integer  "should_add"
      t.integer  "should_change"
      t.integer  "processed"
      t.string   "load_time"
      t.datetime "completed_at"
      t.timestamps null: false
    end

    create_table "admin.user_events", force: :cascade do |t|
      t.string   "email"
      t.string   "event_type"
      t.text     "description"
      t.string   "file_names"
      t.timestamps null: false
    end

    create_table "admin.sanity_checks", force: :cascade do |t|
      t.string   'table_name'
      t.string   'nct_id'
      t.integer  'row_count'
      t.text     'description'
      t.boolean  'most_current'
      t.timestamps null: false
    end

    create_table "admin.study_xml_records", force: :cascade do |t|
      t.string   "nct_id"
      t.xml      "content"
      t.datetime "created_study_at"
      t.timestamps null: false
    end

    create_table "admin.data_definitions" do |t|
      t.string 'db_section'
      t.string 'table_name'
      t.string 'column_name'
      t.string 'data_type'
      t.string 'source'
      t.text   'ctti_note'
      t.string 'nlm_link'
      t.integer 'row_count'
      t.json   'enumerations'
      t.timestamps null: false
    end

    create_table "admin.use_cases" do |t|
      t.string 'status'
      t.string 'title'
      t.string 'brief_summary'
      t.text   'detailed_description'
      t.string 'url'
      t.string 'submitter_name'
      t.string 'contact_info'
      t.string 'email'
      t.binary 'image'
      t.string 'remote_image_url'
      t.timestamps null: false
    end

    create_table "admin.use_case_attachments" do |t|
      t.integer 'use_case_id'
      t.string 'file_name'
      t.binary 'payload'
      t.timestamps null: false
    end

    create_table "admin.users" do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :first_name
      t.string   :last_name
      t.string   :username
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end

    create_table "admin.removed_users" do |t|
      t.string   :email
      t.string   :encrypted_password
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :first_name
      t.string   :last_name
      t.string   :username
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.timestamps null: false
    end

    add_index :users, :username, unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :removed_users, :email, unique: false
    add_index :removed_users, :username, unique: false
    add_foreign_key "use_case_attachments",       "use_cases", column: 'use_case_id', primary_key: 'id', name: "use_case_attach_use_case_id_fkey"

  end

end
