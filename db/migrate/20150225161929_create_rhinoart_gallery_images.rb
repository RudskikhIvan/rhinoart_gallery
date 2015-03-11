class CreateRhinoartGalleryImages < ActiveRecord::Migration
  def change
    create_table :rhinogallery_images, :force => true do |t|
      t.string :name, null: false
      t.text :description
      t.string :image, null: false
      t.string :alt
      t.integer :position
      t.boolean :active
      t.integer :gallery_id, index: true
      t.datetime :created_at, null: false
    end
  end
end
