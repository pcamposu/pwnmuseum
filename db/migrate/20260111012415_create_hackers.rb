class CreateHackers < ActiveRecord::Migration[8.1]
  def change
    create_table :hackers do |t|
      t.string :handle, null: false
      t.boolean :team, default: false

      t.timestamps
    end

    add_index :hackers, :handle, unique: true
  end
end
