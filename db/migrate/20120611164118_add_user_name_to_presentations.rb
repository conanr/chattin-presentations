class CreateInvites < ActiveRecord::Migration
class AddUserNameToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :user_name, :string
  end
end