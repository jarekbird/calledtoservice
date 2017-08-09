class CreateServers < ActiveRecord::Migration[5.1]
  def change
    create_table :servers do |t|
      t.references :member, foreign_key: true
      t.string :service

      t.timestamps
    end
  end
end
