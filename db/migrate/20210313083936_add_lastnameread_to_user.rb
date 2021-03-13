class AddLastnamereadToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name_read, :string
  end
end
