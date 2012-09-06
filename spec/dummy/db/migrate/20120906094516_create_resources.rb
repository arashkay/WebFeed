class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string    :url
      t.string    :name
      t.integer   :frequency
      t.timestamp :checked_at

      t.timestamps
    end
  end
end
