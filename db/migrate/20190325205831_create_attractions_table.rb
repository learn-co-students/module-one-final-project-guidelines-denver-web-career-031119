class CreateAttractionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.text :artist
      t.text :genre
      t.text :sub_genre
    end 
  end
end
