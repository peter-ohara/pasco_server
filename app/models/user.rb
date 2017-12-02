class User < ApplicationRecord
  has_secure_password

  has_many :purchases, inverse_of: :user, dependent: :destroy
  has_many :courses, through: :purchases

  has_many :gold_ledger_entries, inverse_of: :user, dependent: :destroy
  has_many :gold_purchases, inverse_of: :user, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save { |user| user.email = email.downcase }
  after_create :give_them_some_gold

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
      email
    end
  end

  private

  def give_them_some_gold
    gold_ledger_entries.build(
      amount: 100,
      notes: 'Initial 100 PG given to user for purchasing courses'
    )
    save!
  end
end
