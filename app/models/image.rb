class Image < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :alt, presence: true
end
