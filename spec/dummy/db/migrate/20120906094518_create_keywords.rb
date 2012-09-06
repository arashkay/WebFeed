class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :phrase
      t.boolean :is_negative

      t.timestamps
    end
  end
end
