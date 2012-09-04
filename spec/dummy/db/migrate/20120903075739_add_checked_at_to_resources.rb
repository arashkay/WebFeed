class AddCheckedAtToResources < ActiveRecord::Migration
  def change
    add_column :resources, :checked_at, :timestamp, :null => false
  end
end
