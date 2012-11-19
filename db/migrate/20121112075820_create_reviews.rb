class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :positive
      t.text :negative
      t.text :comments
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
