class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
    @tags = Tag.all
  end

  def create
    @creature = Creature.create(creature_params)
    params[:creature][:tag_ids].each do |t|
      @creature.tags << Tag.find_by_id(t) unless t.blank?
    end
    redirect_to @creature
  end

  def show
    @creature = Creature.find(params[:id])
    @tags = Tag.joins(:creatures).where(creatures: {id: params[:id]})
  end

  def update
    @creature = Creature.find_by_id(params[:id])
    @creature.update(creature_params)
    params[:creature][:tag_ids].each do |t|
      @creature.tags << Tag.find_by_id(t) unless t.blank?
    end
    # @creature.tags.clear

    # render :json => params
    redirect_to creature_path(params[:id])
  end

  def edit
    @creature = Creature.find_by_id(params[:id])
    @tags = Tag.all
  end

  def destroy
    @creature = Creature.find_by_id(params[:id]).destroy
    redirect_to root_path
  end


  private

  def creature_params
    params.require(:creature).permit(:name,:desc)
  end

end
