class RemoveUserIdFromEnquiries < ActiveRecord::Migration[6.1]
  def change
    remove_reference :enquiries, :user, null: false, foreign_key: true
  end
end
