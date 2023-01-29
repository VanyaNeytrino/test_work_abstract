class CreateBonusAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bonus_accounts do |t|
      t.integer :bonus_score
      t.integer :incoming_timestamp

      t.timestamps
    end
  end
end
