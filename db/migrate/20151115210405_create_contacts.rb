class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :apt
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
