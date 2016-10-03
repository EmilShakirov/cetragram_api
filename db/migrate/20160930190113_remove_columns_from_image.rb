class RemoveColumnsFromImage < ActiveRecord::Migration
  def change
    remove_columns :images, :link, :name
  end
end
