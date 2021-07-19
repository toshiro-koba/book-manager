class ChangeColumnsAddNotnullOnBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :user_id, :integer, null: false
  end
end
