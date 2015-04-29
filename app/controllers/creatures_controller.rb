class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.create(creature_params)
    redirect_to @creature
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def update
    @creature = Creature.find_by_id(params[:id]).update(creature_params)
    redirect_to creature_path(params[:id])
  end

  def edit
    @creature = Creature.find_by_id(params[:id])
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
