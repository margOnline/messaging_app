class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :phone
      t.text :body

      t.timestamps
    end
  end
end
