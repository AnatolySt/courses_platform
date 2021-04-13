class StudentsController < ApplicationController
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :ok
    else
      render json: @student.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:full_name, :email, :group_ids)
  end
end