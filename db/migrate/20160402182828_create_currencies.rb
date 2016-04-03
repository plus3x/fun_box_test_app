class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.float :value
      t.date :date, index: true

      t.timestamps null: false
    end
  end
end
