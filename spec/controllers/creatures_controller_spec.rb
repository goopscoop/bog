require 'rails_helper'

RSpec.describe CreaturesController, type: :controller do

  before(:context) do
    Creature.delete_all
  end

  def creature_params
    {:name => "Fake creature", :description => "fake creture"}
  end

  describe "GET index" do
    it "assign @creature and resters show page" do
      creature Creature.create
      get :index
      expect(assigns(:creatures)).to eq([creature])
      expect(response).to render_template("index")
    end
  end

  describe "GET Show" do
    it "assign @creature and renders show template"

  end

  describe "GET new" do
    it "renders page to add new creature"
  end

  describe "POST create" do
    it ""
  end

  describe "POST "

end
