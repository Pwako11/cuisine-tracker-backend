class AddReferencesToDish < ActiveRecord::Migration[6.0]
  def change
    add_reference :dishes, :user, null: false, foreign_key: true
    add_reference :dishes, :region, null: false, foreign_key: true
  end
end
