# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.2]
  def up
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :subdomain, null: false, limit: 63

      t.timestamps

      t.index :subdomain, unique: true
    end
  end

  def down
    drop_table :accounts
  end
end
