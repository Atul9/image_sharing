class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :image
      t.string :tag_line
      t.belongs_to :album
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
