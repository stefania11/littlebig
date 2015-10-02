class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show]

  # GET /prompts
  def index
    @prompts = Prompt.all
  end

  # GET /prompts/1
  def show
  end

  # GET /prompts/new
  def new
    @prompt_id = params[:prompt_id]
    @concept_id = params[:concept_id]
    @character_id = params[:character_id]
    @prompt = Prompt.new
  end

  # POST /prompts
  def create
    @prompt = Prompt.new(prompt_params)

    render :new, notice: 'Nope.' unless @prompt.save

    if @prompt.source
      redirect_to @prompt.source, notice: 'Prompt was successfully created.'
    elsif prompt_params[:concept_id]
      redirect_to @prompt.concepts.last, notice: 'Prompt was successfully created.'
    else
      redirect_to @prompt, notice: 'Prompt was successfully created.'
    end
  end

  private
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    def prompt_params
      params.require(:prompt).permit(:body, :prompt_id, :concept_id, :character_id, :concept_list, :character_list)
    end
end
