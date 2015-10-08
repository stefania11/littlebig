class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show, :new_response, :create_response]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /prompts
  def index
    @prompts = Prompt.take(20)
  end

  # GET /prompts/:id
  def show
  end

  # GET /prompts/new
  def new
    @concept_id = params[:concept_id]
    @character_id = params[:character_id]
    @source_id = params[:source_id]

    @prompt = Prompt.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /prompts
  def create
    # TODO: refactor
    @prompt = current_user.prompts.new(prompt_params)
    if @prompt.concepts
      @prompt.concepts.each do |concept|
        concept.user = current_user
        concept.save
      end
    end
    if @prompt.save
      respond_to do |format|
        format.html { redirect_to @prompt }
        format.js
      end
    else
      render :new
    end
  end

  # GET prompts/:id/responses/new
  def new_response
  end

  # POST prompts/:id/responses
  def create_response
    @prompt.responses << current_user.prompts.new(prompt_params)
    @prompt.save

    respond_to do |format|
      format.js
    end
  end

  private
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    def prompt_params
      params.require(:prompt).permit(:body, :user_id, :source_id, :concept_id, :character_id, :concept_list, :character_list, :image)
    end
end
