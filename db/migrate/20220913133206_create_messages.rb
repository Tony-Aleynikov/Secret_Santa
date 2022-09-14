class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :body, limit: 500
      t.integer :event_id
      t.bigint :sender_id, index: true, foreign_key: true
      t.bigint :recipient_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
