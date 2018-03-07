class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  # validates :status, inclusion: hjhj

  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat

  def over_lapping_requests
    # rentals_for_our_cat = CatRentalRequest.all.where(cat_id: self.cat_id)
    rentals_for_our_cat = self.cat.cat_rental_requests

    valid_cat = our_cats.where.not('start_date > :end_date OR end_date < :start_date',start_date: start_date, end_date: end_date)
  end
end
