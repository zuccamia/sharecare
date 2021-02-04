class AddUsersToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :user, null: false, foreign_key: true
    add_reference :reviews, :listing, null: false, foreign_key: true
    remove_column :reviews, :nickname, :string
  end
end
