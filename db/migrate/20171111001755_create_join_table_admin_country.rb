class CreateJoinTableAdminCountry < ActiveRecord::Migration[5.1]
  def change
    create_join_table :admins, :countries do |t|
      t.index [:admin_id, :country_id]
      # t.index [:country_id, :admin_id]
    end
  end
end
