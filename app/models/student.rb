# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  full_name  :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ApplicationRecord
  has_many :groups_students
  has_many :groups, through: :groups_students

  validates :email, :full_name, presence: true
  validates :email, uniqueness: true
end
