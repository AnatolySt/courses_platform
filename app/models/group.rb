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
  validates :title, presence: true
end
