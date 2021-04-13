module CoursesHelper
  def sort_direction
    sort_param == 'ASC' ? 'DESC' : 'ASC'
  end
end