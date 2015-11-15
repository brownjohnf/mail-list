class CreateContactsEvents < ActiveRecord::Migration
  def change
    create_table :contacts_events do |t|
      t.belongs_to :contact, index: true, foreign_key: true, null: false
      t.belongs_to :event, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
