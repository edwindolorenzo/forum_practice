# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  forum_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :forum
end
