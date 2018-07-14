class InitialMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest, null: false
      t.timestamps

      t.index :email, unique: true
    end

    # dummy table
    # TODO: It will be removed
    create_table :hoges do |t|
      t.references :user, null: false
      t.string :value
      t.timestamps
    end
  end
end
