class CreateContactNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_numbers do |t|
      t.bigint :number
      t.boolean :available, default: true

      t.timestamps
    end
    add_index :contact_numbers, :number, unique: true
  end
end
