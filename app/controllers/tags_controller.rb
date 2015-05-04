class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to @tag
  end

  def show
    @tag = Tag.find_by_id(params[:id])
    @creatures = Creature.joins(:tags).where(tags: { id: params[:id]})
    # render :json => @creatures
  end

  def edit
    @tag = Tag.find_by_id(params[:id])
  end

  def update
    @tag = Tag.find_by_id(params[:id])
    @tag.update(tag_params)
    redirect_to tag_path(params[:id])
  end

  def destroy
    @tag = Tag.find_by_id(params[:id])
    @creatures = Creature.joins(:tags).where(tags: {id: params[:id]})
    if @creatures.length > 0
      flash[:danger] = "Cannot delete. Tag is associated with one or more creatures"
      redirect_to tags_path
    else
      @tag.destroy
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end