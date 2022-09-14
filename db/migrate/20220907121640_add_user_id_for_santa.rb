class AddUserIdForSanta < ActiveRecord::Migration[7.0]
  def change
    change_table :relations do |t|
      t.integer :id_for_santa
    end
  end
end
