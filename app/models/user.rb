# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  password   :string           not null
#  auth_token :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :email, :password, presence: true
  validates :email, format: { with: /\A[\S.]+@[\S.]+\z/ }, uniqueness: true

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    # генерируем токен, пока он не станет уникальным
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(column.to_s => token)
    end
  end
end
