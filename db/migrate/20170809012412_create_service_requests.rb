class CreateServiceRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :service_requests do |t|
      t.references :requester, foreign_key: { to_table: :members }
      t.references :receiver, foreign_key: { to_table: :members }
      t.references :user, foreign_key: true
      t.string :service_needed
      t.text :comments
      t.date :date1
      t.date :date2
      t.string :service_address

      t.timestamps
    end
  end
end
