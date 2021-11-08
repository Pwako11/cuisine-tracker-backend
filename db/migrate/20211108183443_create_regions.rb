class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :continent
      t.string :country
      t.string :state

      t.timestamps
    end
  end
end
