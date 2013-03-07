class AddExtensionToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :extension, :string
  end
end
