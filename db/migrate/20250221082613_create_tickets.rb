class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
