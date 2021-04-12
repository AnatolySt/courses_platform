# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
  has_many :groups

  validates :title, :description, presence: true
  validates :title, uniqueness: true
end
