class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
<<<<<<< HEAD
    # add_column :users, :password_digest, :string
=======
    add_column :users, :password_digest, :string
>>>>>>> 6075bef... Chapter 5: Filling the layout
  end
end
