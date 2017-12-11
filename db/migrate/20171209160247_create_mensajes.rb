class CreateMensajes < ActiveRecord::Migration[5.1]
  def change
    create_table :mensajes do |t|
      t.text :cuerpo
      t.references :usuario, foreign_key: true
      t.references :conversacion, foreign_key: { to_table: :conversaciones }

      t.timestamps
    end
  end
end
