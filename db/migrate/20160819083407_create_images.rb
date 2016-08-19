class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption
      t.string :link, null: false
      t.string :name, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps null: false
    end
  end
end
