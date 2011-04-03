class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.belongs_to :user
      t.boolean :is_avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
