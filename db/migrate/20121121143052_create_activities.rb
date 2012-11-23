class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :subject_id
      t.integer :thing_id
      t.string :thing_type
      t.string :action
      t.text :data

      t.timestamps
    end
  end
end
