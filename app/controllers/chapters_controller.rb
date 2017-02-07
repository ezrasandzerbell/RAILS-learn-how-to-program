class ChaptersController < ApplicationController

  def show
    @chapter = Chapter.find(params[:id])
    render :show
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @chapter = @lesson.chapters.new
  end

def create
  @lesson = Lesson.find(params[:lesson_id])
  @chapter = @lesson.chapters.new(chapter_params)
  if @chapter.save
    redirect_to lesson_path(@chapter.lesson)
  else
    render :new
  end
end

def destroy
  @chapter = Chapter.find(params[:id])
  @chapter.destroy
  redirect_to lesson_path(@chapter.lesson)
end

def edit
  @chapter = Chapter.find(params[:id])
  @lesson = @chapter.lesson
  render :edit
end

def update
  @chapter = Chapter.find(params[:id])
  @lesson = Lesson.find(params[:lesson_id])
  if @chapter.update(chapter_params)
    redirect_to lesson_path(@chapter.lesson)
  else
    render :edit
  end
end


private
  def chapter_params
    params.require(:chapter).permit(:name, :week)
  end
end
