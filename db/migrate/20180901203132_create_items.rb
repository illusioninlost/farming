class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.float :value
      t.integer :weight
      t.string :location

      t.timestamps
    end
  end
end
