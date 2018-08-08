class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # paperclip
  has_attached_file :avatar, styles: { medium: "700x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  #gem money-rails
  monetize :price_cents
end
