class CreatePlatforms < ActiveRecord::Migration[8.1]
  def change
    create_table :platforms do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :manufacturer
      t.date :release_date
      t.integer :generation

      t.timestamps
    end

    add_index :platforms, :slug, unique: true
  end
end
