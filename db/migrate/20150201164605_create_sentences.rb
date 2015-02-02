class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :content
      t.integer :position
      t.integer :story_id
      t.timestamps
    end
  end
end
