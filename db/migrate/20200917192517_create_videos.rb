class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.text :url
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
