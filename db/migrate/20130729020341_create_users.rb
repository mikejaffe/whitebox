class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email
    	t.string :password_digest
    	t.string :token
    	t.string :first_name
    	t.string :last_name
    	t.string :address1
    	t.string :address2
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.string :phone
      t.timestamps
    end
  end
end
