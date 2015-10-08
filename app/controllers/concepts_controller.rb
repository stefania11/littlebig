class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /concepts
  def index
    @concepts = Concept.all
    @concept = Concept.new
  end

  # GET /concepts/1
  def show
  end

  # GET /concepts/new
  def new
    @concept = Concept.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /concepts/1/edit
  def edit
  end

  # POST /concepts
  def create
    @concept = Concept.new(concept_params)
    respond_to do |format|
      if @concept.save
        format.html { redirect_to @concept, notice: 'Concept was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js { render js: "alert('Nope')" }
      end
    end
  end

  # PATCH/PUT /concepts/1
  def update
    if @concept.update(concept_params)
      redirect_to @concept, notice: 'Concept was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /concepts/1
  def destroy
    @concept.destroy
    redirect_to concepts_url, notice: 'Concept was successfully destroyed.'
  end

  def create_response
    @concept.responses << current_user.concepts.new(concept_params)
    @concept.save

    respond_to do |format|
      format.js
    end
  end

  def new_response
  end

  private
    def set_concept
      @concept = Concept.find(params[:id])
    end

    def concept_params
      params.require(:concept).permit(:name, :overview)
    end
end
