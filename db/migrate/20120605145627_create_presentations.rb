class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title
      t.string :deck_url
      t.integer :user_id
      t.timestamps
    end
  end
end
