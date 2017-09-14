class CreateNeedsAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :needs_assessments do |t|
      t.references :requester, foreign_key: { to_table: :members }
      t.references :receiver, foreign_key: { to_table: :members }
      t.references :user, foreign_key: true
      t.string :relationship
      t.boolean :is_known
      t.text :needs
      t.string :time_frame

      t.timestamps
    end
  end
end
