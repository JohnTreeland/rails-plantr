class Sitter < ApplicationRecord
  belongs_to :user
  validates :start_date, :end_date, :city, presence: true
  has_one_attached :photo

end
