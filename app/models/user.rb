class User < ApplicationRecord
  after_save :default_values

  has_one :avatar, as: :owner, class_name: 'Image'
  has_many :food_lists
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def safe
    {
      email: email,
      username: username,
      avatar: avatar,
      currentList: current_food_list
    }
  end

  def current_food_list
    food_lists.where('created_at >= ?', Time.zone.now.beginning_of_day).take || food_lists.create
  end

  def default_values
    create_avatar(alt: 'profile image')
    food_lists.create
  end
end
