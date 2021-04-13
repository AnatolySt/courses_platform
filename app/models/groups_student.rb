# == Schema Information
#
# Table name: groups_students
#
#  id         :integer          not null, primary key
#  student_id :integer          not null
#  group_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GroupsStudent < ApplicationRecord
  belongs_to :student
  belongs_to :group
end
