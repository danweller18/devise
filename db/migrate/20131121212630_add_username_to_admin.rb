class AddUsernameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string
  end
end
