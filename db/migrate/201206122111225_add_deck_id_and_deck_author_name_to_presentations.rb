class AddDeckIdAndDeckAuthorNameToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :deck_id, :string
    add_column :presentations, :deck_author_name, :string
  end
end
