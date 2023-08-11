class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.string :tipe
      t.integer :body
      t.text :learn
      t.integer :user_id

      t.timestamps
    end
  end
end
