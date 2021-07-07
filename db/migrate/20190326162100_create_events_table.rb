class CreateEventsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :name
      t.text :date
      t.integer :price
      t.integer :popularity
      t.references :attraction
      t.references :venue
    end 
  end
end
