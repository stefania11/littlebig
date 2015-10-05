class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /concepts/1/edit
  def edit
  end

  # POST /concepts
  def create
    @concept = Concept.new(concept_params)

    if @concept.save
      redirect_to concepts_path, notice: 'Concept was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /concepts/1
  def update
    if @concept.update(concept_params)
      redirect_to concepts_path, notice: 'Concept was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /concepts/1
  def destroy
    @concept.destroy
    redirect_to concepts_url, notice: 'Concept was successfully destroyed.'
  end

  private
    def set_concept
      @concept = Concept.find(params[:id])
    end

    def concept_params
      params.require(:concept).permit(:name)
    end
end
