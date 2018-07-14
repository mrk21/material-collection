class InitialMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :hoges do |t|
      t.string :value
      t.timestamps
    end
  end
end
