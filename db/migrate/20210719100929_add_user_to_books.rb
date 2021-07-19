class AddUserToBooks < ActiveRecord::Migration[6.1]
  def up
    add_reference :books, :user, index: true
  end

  def down
    remove_reference :books, :user, index: true
  end
end
