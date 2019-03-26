class CreateVenuesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.text :name
      t.text :location
      t.text :parking_details
    end 
  end
end
