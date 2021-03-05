class Tweet < ApplicationRecord
  validates :text, presence:true
  validates :text, length: {maximum: 280}

  belongs_to :user
end
