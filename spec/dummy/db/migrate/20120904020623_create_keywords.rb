class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :phrase
      t.boolean :is_negative, :default => false

      t.timestamps
    end
  end
end
