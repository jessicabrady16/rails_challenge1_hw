class CreateCalculations < ActiveRecord::Migration[6.0]
  def change
    create_table :calculations do |t|
      t.string :input
      t.boolean :output
      t.timestamps
    end
  end
end

