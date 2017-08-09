class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :email
      t.timestamps
    end
  end
end
