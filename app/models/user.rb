class User < ApplicationRecord
  has_secure_password

  has_many :purchases, inverse_of: :user
  has_many :courses, through: :purchases
  has_many :gold_ledger_entries, inverse_of: :user
  has_many :gold_purchases, inverse_of: :user

  def pasco_gold
    gold_ledger_entries.sum(:amount)
  end

  rails_admin do
    object_label_method do
      :custom_label_method
    end
  end

  User.class_eval do
    def custom_label_method
      self.email
    end
  end
end
