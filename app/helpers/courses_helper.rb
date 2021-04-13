module CoursesHelper
  def sort_direction
    sort_param == 'ASC' ? 'DESC' : 'ASC'
  end

  def normalize_datetime(datetime)
    datetime.strftime("%d/%m/%Y %k:%M")
  end
end
