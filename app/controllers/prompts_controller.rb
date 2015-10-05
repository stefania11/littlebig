class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

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
    respond_to do |format|
      format.html { redirect_to @prompt }
      format.js
    end
  end

  # POST /prompts
  def create
    @prompt = Prompt.new(prompt_params)

    respond_to do |format|
      format.html {
        if @prompt.save
          if @prompt.source
            redirect_to @prompt.source, notice: 'Prompt was successfully created.'
          elsif prompt_params[:concept_id]
            redirect_to @prompt.concepts.last, notice: 'Prompt was successfully created.'
          else
            redirect_to @prompt, notice: 'Prompt was successfully created.'
          end
        else
          render :new, notice: 'Nope.'
        end
      }
      format.js {
        if @prompt.save
          render :create
        else
          render :new
        end
      }
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
