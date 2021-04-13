class CoursesController < ApplicationController
  helper_method :sort_param

  def index
    @courses = Course.select('courses.*, min(groups.starts_at) as closest_start')
                     .joins(:groups).left_outer_joins(groups: [:students])
                     .group(:id).distinct.order('closest_start' => sort_param)
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def sort_param
    sort = params[:sort]&.upcase
    sort == 'DESC' ? sort : 'ASC'
  end
end
