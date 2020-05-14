class CreateScales < ActiveRecord::Migration[6.0]
  def change
    create_table :scales do |t|
      t.string :root
      t.string :mode

      t.timestamps
    end
  end
end
