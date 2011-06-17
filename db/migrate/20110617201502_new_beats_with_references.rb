class NewBeatsWithReferences < ActiveRecord::Migration
  def self.up
    drop_table :beats
    create_table :beats do |t|
      t.references :artist
      t.references :song
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :beats
    create_table :beats do |t|
      t.string :artist
      t.string :song
      t.references :user

      t.timestamps
    end
  end
end
