class AddFileDataToImages < ActiveRecord::Migration
  def change
    add_column :images, :file_data, :text
  end
end
