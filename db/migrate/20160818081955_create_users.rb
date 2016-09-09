class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :num
      t.string :major
      t.string :department
      t.string :password_digest
      t.string :remember_digest

      t.boolean :admin, default: false
      t.boolean :teacher,default: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true

  end
end
