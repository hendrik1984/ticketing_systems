class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :banner_image
      t.string :status
      t.integer :max_allocation

      t.timestamps
    end
  end
end
