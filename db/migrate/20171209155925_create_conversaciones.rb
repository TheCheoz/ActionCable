class CreateConversaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :conversaciones do |t|
      t.integer :receptor_id
      t.integer :remitente_id

      t.timestamps
    end
    add_index :conversaciones, :receptor_id
    add_index :conversaciones, :remitente_id
    add_index :conversaciones, [:receptor_id, :remitente_id], unique: true
  end
end
