class BonusAccount < ApplicationRecord
end

# == Schema Information
#
# Table name: bonus_accounts
#
#  id                 :bigint           not null, primary key
#  bonus_score        :integer
#  incoming_timestamp :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
