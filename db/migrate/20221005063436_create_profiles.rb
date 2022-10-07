class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :gender
      t.integer :age
      t.string :house_no
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
