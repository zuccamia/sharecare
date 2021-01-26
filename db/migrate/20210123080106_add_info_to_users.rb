class AddInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :languages, :string, array: true
    add_column :users, :age_range, :string
    add_column :users, :description, :text
  end
end
