# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  plot       :decimal(, )
#  content    :decimal(, )
#  bahasa     :decimal(, )
#  fluency    :decimal(, )
#  interlude  :decimal(, )
#  gesture    :decimal(, )
#  sound      :decimal(, )
#  duration   :decimal(, )
#  showing    :decimal(, )
#  type       :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Score < ApplicationRecord
  belongs_to :user

  validates_presence_of :plot, :content, :bahasa, :fluency, :interlude, :gesture, :sound, :duration, :showing, :type

  enum type: [ :pidato, :cerita]

end
