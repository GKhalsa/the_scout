class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :name
      t.string :token
      t.string :refresh_token
      t.integer :expires_at
      t.boolean :expires

      t.timestamps null: false
    end
  end
end
