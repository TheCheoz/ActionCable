class CreatePerfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :perfiles do |t|
      t.references :usuario, foreign_key: true
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :apodo

      t.timestamps
    end
  end
end
