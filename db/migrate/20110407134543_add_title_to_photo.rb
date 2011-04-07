class AddTitleToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :title, :string
    add_column :photos, :description, :text
    add_column :photos, :director_id, :integer
    add_column :photos, :country_id, :integer
    add_column :photos, :language, :string
    add_column :photos, :published_at, :datetime
    add_column :photos, :length, :decimal
    add_column :photos, :imdb, :string
    add_column :photos, :starring, :string
    add_column :photos, :screenwrite, :string
  end

  def self.down
    remove_column :photos, :screenwrite
    remove_column :photos, :starring
    remove_column :photos, :imdb
    remove_column :photos, :length
    remove_column :photos, :published_at
    remove_column :photos, :language
    remove_column :photos, :country_id
    remove_column :photos, :director_id
    remove_column :photos, :description
    remove_column :photos, :title
  end
end
