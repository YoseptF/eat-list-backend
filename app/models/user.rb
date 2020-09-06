class User < ApplicationRecord
  after_create :default_values

  enum lifestyle: {
    sedentary: 1.2,
    lightly_active: 1.375,
    moderately_active: 1.55,
    very_active: 1.725,
    extra_active: 1.9
  }

  has_one :avatar, as: :owner, class_name: 'Image'
  has_many :food_lists
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def calories
    bmr = ((13.397 * weight.to_f) + (4.799 * height.to_f) - (5.677 * age.to_f) + 88.362)
    (bmr * read_attribute_before_type_cast(:lifestyle).to_f).to_i
  end

  def current_food_list
    food_lists.where('created_at >= ?', Time.zone.now.beginning_of_day).take || food_lists.create
  end

  def default_values
    create_avatar(alt: 'profile image')
    food_lists.create
  end
end
