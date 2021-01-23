class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :location
      t.decimal :fee
      t.text :service_description
      t.array :tags
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
