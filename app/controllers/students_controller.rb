class StudentsController < ApplicationController

  layout 'student'

  before_action :confirm_logged_in

  def index
    @students = Student.sorted
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "student is created"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:notice] = "student has updated"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def delete
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "student is destroyed."
    redirect_to(:action => 'index')
  end
end

private

def student_params
  params.require(:student).permit(:first_name, :last_name, :email, :username, :password)
  end