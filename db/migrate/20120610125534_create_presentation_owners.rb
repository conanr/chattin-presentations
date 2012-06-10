class CreatePresentationOwners < ActiveRecord::Migration
  def change
    create_table :presentation_owners do |t|
      t.integer :user_id
      t.integer :presentation_id
      t.timestamps
    end
  end
end
