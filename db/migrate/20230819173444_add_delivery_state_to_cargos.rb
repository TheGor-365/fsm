class AddDeliveryStateToCargos < ActiveRecord::Migration[7.0]
  def change
    add_column :cargos, :delivery_state, :string
  end
end
