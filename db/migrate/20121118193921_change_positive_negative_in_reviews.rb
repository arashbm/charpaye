class ChangePositiveNegativeInReviews < ActiveRecord::Migration
  def change
    rename_column :reviews, :positive, :form
    rename_column :reviews, :negative, :content
  end
end
