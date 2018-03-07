# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birthdate   :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS =  %w(black white brown fushcia orange)

  validates :name, :birthdate, :color, :sex, presence: true

  validates :sex, inclusion: { in: %w(M F),
    message: "must be M or F" }

  validates :color, inclusion: COLORS



  def age
    bday_year = self.birthdate.year
    year_now = Time.now.year
    year_now - bday_year
  end

  has_many :cat_rental_requests,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy

end
