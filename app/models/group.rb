# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  starts_at  :datetime
#  ends_at    :datetime
#  course_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
  belongs_to :course
  has_many :groups_students
  has_many :students, through: :groups_students

  accepts_nested_attributes_for :students, allow_destroy: true

  validates :title, presence: true
end
