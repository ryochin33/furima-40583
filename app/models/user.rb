class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :items
   #has_many :orders

  validates :nickname, presence: true
  validates :last_name, presence: true,format: { with: /\A[^\x01-\x7E]+\z/, message: "は全角文字を使用してください" }
  validates :first_name, presence: true,format: { with: /\A[^\x01-\x7E]+\z/, message: "は全角文字を使用してください" }
  validates :last_name_kana, presence: true,format: { with: /\A[\p{katakana}\u30fc]+\z/, message: "は全角カタカナを使用してください" }
  validates :first_name_kana, presence: true,format: { with: /\A[\p{katakana}\u30fc]+\z/, message: "は全角カタカナを使用してください" }
  validates :birthday, presence: true

validate :password_complexity


  private 
  def password_complexity
    if password.present? && !password.match(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}\z/)
      errors.add :password, 'は6文字以上の半角英数字で、英字と数字の両方を含めて設定してください'
    end
  end
end
