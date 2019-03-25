# == Schema Information
#
# Table name: forums
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Forum < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy
end
