class SubjectsController < ApplicationController

   layout "student"

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

 def create
  @subject = Subject.new(subject_params)
  if @subject.save
    flash[:notice] = "subject created successfully."
    redirect_to(:action => 'index')
  else
    render('new')
  end
 end


  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "subject updated successfully."
       redirect_to(:action => 'index')
     else
      render('edit')
    end
  end

  def delete
     @subject = Subject.find(params[:id])
  end

  def destroy
      @subject = Subject.find(params[:id])
      @subject.destroy
      flash[:notice] = "subject destroyed successfully."
     redirect_to(:action => 'index')
  end

private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
