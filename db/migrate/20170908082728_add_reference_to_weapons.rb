class AddReferenceToWeapons < ActiveRecord::Migration[5.1]
  def change
    add_reference :weapons, :category
  end
end
