class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.references :site, null: false, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end
