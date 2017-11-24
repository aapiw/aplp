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
	attr_accessor :scoring
	# attr_accessor :scoring_pidato

  belongs_to :user

  validates_presence_of :plot, :content, :fluency, :gesture, :sound, :duration, :media, :note, :kind, if: :scoring
  validates_presence_of :bahasa, :interlude, if: ->  { scoring and kind == "pidato" }
  validates_presence_of :showing, if: ->  { scoring and kind == "bercerita" }
 
  enum kind: [ :pidato, :bercerita ]

end
