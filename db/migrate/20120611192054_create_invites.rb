class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :presentation_id
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
