class AddUserIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user
    # user_id -> post
  end
end
