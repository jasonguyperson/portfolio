class CreateUsers < ActiveRecord::Migration[7.1]
  TABLE  = :users

  def up
    return nil if table_exists?(TABLE)

    create_table TABLE do |t|
      t.string  :email, index: { unique: true, name: 'unique_emails' }, null: false
      t.string  :uid
      t.string  :provider
      t.integer :role, default: 0
      t.boolean :active, default: true
      t.datetime :first_login_at
      t.datetime :last_login_at

      t.timestamps
    end
  end
  def down
    drop_table(TABLE) if table_exists?(TABLE)
  end
end
