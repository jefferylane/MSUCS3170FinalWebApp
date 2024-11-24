class CreateThreeDFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :three_d_files do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
