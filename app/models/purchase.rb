class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validate :user_has_enough_pasco_gold
  after_create :update_users_pasco_gold

  def user_has_enough_pasco_gold
    if user.pasco_gold < course.price
      errors.add(:user,
                 'does not have enough pasco gold to purchase this course')
    end
  end

  def update_users_pasco_gold
    user.pasco_gold = user.pasco_gold - course.price
    unless user.save
      raise ActiveRecord::Rollback
    end
  end
end
