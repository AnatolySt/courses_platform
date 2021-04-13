ActiveAdmin.register Group do
  permit_params :course_id, :title, :start_date, :end_date, students_attributes: %i[id first_name last_name email]

  form do |f|
    f.inputs 'Details' do
      f.input :course, as: :select, collection: Course.pluck(:title, :id)
      f.input :title
      f.input :start_date
      f.input :end_date
    end
    f.inputs do
      f.has_many :students,
                 allow_destroy: true do |a|
        a.input :first_name
        a.input :last_name
        a.input :email
      end
    end
    f.actions
  end
end
