class CreateFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :feelings do |t|
      t.string :adjective
      t.references :scale, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
