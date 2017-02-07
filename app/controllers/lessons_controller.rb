class LessonsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:id])
    render :show
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.new
  end

def create
  @course = Course.find(params[:course_id])
  @lesson = @course.lessons.new(lesson_params)
  if @lesson.save
    redirect_to course_path(@lesson.course)
  else
    render :new
  end
end

def destroy
  @lesson = Lesson.find(params[:id])
  @lesson.destroy
  redirect_to course_path(@lesson.course)
end

def edit
  @lesson = Lesson.find(params[:id])
  @course = @lesson.course
  render :edit
end

def update
  @lesson = Lesson.find(params[:id])
  @course = Course.find(params[:course_id])
  if @lesson.update(lesson_params)
    redirect_to course_path(@lesson.course)
  else
    render :edit
  end
end


private
  def lesson_params
    params.require(:lesson).permit(:name, :week)
  end
end
