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

  validates_presence_of :plot, :content, :fluency, :gesture, :sound, :duration, :kind, :showing, :media, if: :scoring
  validates_presence_of :bahasa, if: :contest_pidato #:interlude
  validates_presence_of :giver, :note


  before_update :clear_datas_before

  validates :plot, numericality: { less_than_or_equal_to: 20}, if: :scoring
  validates :content, numericality: { less_than_or_equal_to: 20}, if: :scoring
  validates :fluency, numericality: { less_than_or_equal_to: 15}, if: :scoring
  validates :gesture, numericality: { less_than_or_equal_to: 10}, if: :scoring
  validates :sound, numericality: { less_than_or_equal_to: 5}, if: :scoring
  validates :duration, numericality: { less_than_or_equal_to: 5}, if: :scoring
  validates :media, numericality: { less_than_or_equal_to: 10}, if: :scoring
  validates :showing, numericality: { less_than_or_equal_to: 15}, if: :scoring
  validates :bahasa, numericality: { less_than_or_equal_to: 15}, if: :contest_pidato
  # validates :interlude, numericality: { less_than_or_equal_to: 15}, if: :contest_pidato

  enum kind: [ :pidato, :bercerita ]

  def contest_pidato
    if scoring == "true"
      eval(scoring) and kind == "pidato"
    end
  end
  
  def contest_bercerita
    if scoring == "true"
      eval(scoring) and kind == "bercerita" if scoring == "true"
    end
  end

  def clear_datas_before
    if kind and scoring.blank?
      self.media = nil
      self.plot = nil
      self.content = nil
      self.fluency = nil
      self.gesture = nil
      self.sound = nil
      self.duration = nil
      self.showing = nil
      self.bahasa = nil
      # self.interlude = nil
      self.note = nil
      self.giver = nil
    end
  end

  def counting
    sum_all(self.media, self.plot, self.content, self.fluency, self.gesture, self.sound, self.duration , self.showing, self.bahasa)#, self.interlude)
  end

  def sum_all *val
    sum = 0
    val.each do |data|
      sum = sum+data if data.present? and data.class == BigDecimal
    end
    sum
  end
end
