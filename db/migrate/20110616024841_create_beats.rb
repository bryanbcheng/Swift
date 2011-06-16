class CreateBeats < ActiveRecord::Migration
  def self.up
    create_table :beats do |t|
      t.string :artist
      t.string :song
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :beats
  end
end
