class User < ApplicationRecord
  has_secure_password

  has_many :purchases, inverse_of: :user, dependent: :destroy
  has_many :courses, through: :purchases

  has_many :gold_ledger_entries, inverse_of: :user, dependent: :destroy
  has_many :gold_purchases, inverse_of: :user, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save { |user| user.email = email.downcase }
  after_create :buy_them_comm_skills

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

  def buy_them_comm_skills
    # Give them some gold to start with
    gold_ledger_entries.build(
      amount: 99,
      notes: 'Initial 99 pasco_gold given to user for purchasing courses'
    )
    save!

    # Purchase ENGL157 (Communication Skills) on their behalf
    purchases.build(
      course: Course.find_by(code: 'ENGL157')
    )
    save!
  end
end
