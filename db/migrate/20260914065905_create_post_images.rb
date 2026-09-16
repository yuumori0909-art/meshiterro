class CreatePostImages < ActiveRecord::Migration[8.0]
  def change
    create_table :post_images do |t|
      t.timestamps
      t.string :shop_name
      t.text :caption
      t.integer :user_id
    end
  end
end
