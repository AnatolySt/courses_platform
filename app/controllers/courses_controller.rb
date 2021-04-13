class CoursesController < ApplicationController
  helper_method :sort_param

  def index
    @courses = Course.joins(:groups).left_outer_joins(groups: [:students]).distinct
                     .order('groups.starts_at' => sort_param)
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
