class CreateCredits < ActiveRecord::Migration[8.1]
  def change
    create_table :credits do |t|
      t.references :exploit, null: false, foreign_key: true
      t.references :hacker, null: false, foreign_key: true

      t.timestamps
    end

    add_index :credits, [ :exploit_id, :hacker_id ], unique: true
  end
end
