class CreateInfoChanges < ActiveRecord::Migration[5.1]
  def change
    create_table :info_changes do |t|
      t.references :requester, foreign_key: { to_table: :members }
      t.references :receiver, foreign_key: { to_table: :members }
      t.references :user, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
