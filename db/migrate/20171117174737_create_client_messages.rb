class CreateClientMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :client_messages do |t|
		t.integer :user_id
		t.integer :trainer_id
		t.text :message_content
		t.string :email_user
		t.string :email_trainer
		t.timestamps
    end
  end
end
