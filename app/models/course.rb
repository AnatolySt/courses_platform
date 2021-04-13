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
  has_many :groups, dependent: :destroy
  has_many :students, through: :groups

  accepts_nested_attributes_for :groups, allow_destroy: true

  validates :title, :description, presence: true
  validates :title, uniqueness: true

  def closest_start
    groups.minimum(:starts_at)
  end

  def students_count
    students.count
  end
end
