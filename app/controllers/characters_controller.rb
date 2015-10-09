class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy, :new_mention, :create_mention]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /characters
  def index
    @characters = Character.all
  end

  # GET /characters/1
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  def create
    @character = Character.new(character_params)
    @character.user = current_user
    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js { render js: "alert('Nope')" }
      end
    end
  end

  # PATCH/PUT /characters/1
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
    end
  end

  def create_mention
    @character.prompts.new(body: params[:prompt][:body], user_id: current_user.id)
    if @character.save
      flash[:notice] = "Your prompt was successfully created."
    else
      flash[:alert] = "That didn't work. Try again?"
    end
    flash.discard
  end

  def new_mention
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :bio)
    end
end
