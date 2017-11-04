class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validate :user_has_enough_pasco_gold

  def user_has_enough_pasco_gold
    if user.pasco_gold < course.price
      errors.add(:user,
                 'does not have enough pasco gold to purchase this course')
    end
  end
end
