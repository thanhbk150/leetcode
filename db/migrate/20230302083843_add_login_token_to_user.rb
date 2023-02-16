class AddLoginTokenToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login_token, :string, null: true, after: :last_sign_in_ip
  end
end
