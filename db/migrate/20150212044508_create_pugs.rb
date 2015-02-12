class CreatePugs < ActiveRecord::Migration
  def change
    create_table :pugs do |t|
      t.string :url
      t.string :title
      t.text :self_text

      t.timestamps null: false
    end
  end
end
