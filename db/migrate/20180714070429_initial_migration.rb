class InitialMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest, null: false
      t.timestamps

      t.index :email, unique: true
    end

    create_table :projects do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :description
      t.timestamps
    end

    create_table :assets do |t|
      t.references :project, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
