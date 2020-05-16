class AddCountToFeelings < ActiveRecord::Migration[6.0]
  def change
    add_column :feelings, :count, :integer
  end
end
