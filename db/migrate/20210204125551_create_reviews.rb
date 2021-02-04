class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :nickname
      t.text :comment

      t.timestamps
    end
  end
end
