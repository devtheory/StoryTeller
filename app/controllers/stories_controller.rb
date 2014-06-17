class StoriesController < ApplicationController

  def index
    @stories = Story.all
    authorize @stories
  end
  
  def new
    @story = Story.new
    authorize @story
  end
  
  def create
    @story = current_user.stories.build(story_params)
    authorize @story
    if @story.save
      flash[:notice] = "Your story was created successfully"
      redirect_to @story
    else
      flash[:error] = "There was a problem creating your story. Please try again"
      render :new
    end
  end
  
  def edit
    @story = current_user.stories.find(params[:id])
    authorize @story
  end
  
  def update
    @story = current_user.stories.find(params[:id])
    authorize @story
    if @story.update_attributes(story_params)
      redirect_to @story
    else
      flash[:error] = "There was a problem updating your story. Please try again"
      render :edit
    end
  end
  
  def show
    @story = current_user.stories.find(params[:id])
    authorize @story
  end
  
  def destroy
    @story = current_user.stories.find(:id)
    title = @topic.title
    authorize @story
    if @story.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully"
      redirect_to @story
    else
      flash[:error] = "There was an error deleting the story"
      render :show
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :summary, :body)
  end

end