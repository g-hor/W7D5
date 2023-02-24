# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User,
    inverse_of: :subs
end
