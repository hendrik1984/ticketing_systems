class UpdateEventStatus < ActiveRecord::Migration[8.0]
  def change
    # Ensure the status column only allows 'active' or 'inactive'
    change_column :events, :status, :string, default: 'inactive', null:false
    add_index :events, :status
  end
end
