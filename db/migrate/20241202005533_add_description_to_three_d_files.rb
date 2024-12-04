class AddDescriptionToThreeDFiles < ActiveRecord::Migration[7.1]
  def change
    add_column :three_d_files, :description, :text
  end
end
