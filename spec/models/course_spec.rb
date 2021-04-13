require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:today) { Time.zone.today }
  let(:course) { create :course }
  let!(:today_group) { create :group, :with_students, course: course, starts_at: today }
  let!(:incoming_group) { create :group, :with_students, course: course, starts_at: today + 1.week }

  it { should have_many(:groups).dependent(:destroy) }
  it { should have_many(:students).through(:groups) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:description) }

  it '.closest_start should return closest starts date of group' do
    expect(course.closest_start).to eq(today_group.starts_at)
  end

  it '.students_count should return sum of students in course groups' do
    expect(course.students_count).to eq(course.students.count)
  end
end