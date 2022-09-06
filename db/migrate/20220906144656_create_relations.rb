class CreateRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :relations do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.timestamps
    end
  end
end
