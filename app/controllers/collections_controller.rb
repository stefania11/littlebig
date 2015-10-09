class CollectionsController < ApplicationController
  before_action :set_prompt

  def index
    @collections = Collections.all
  end
  def create
    current_user.collected_prompts << @prompt
    current_user.save
  end

  def destroy
    current_user.collected_prompts.delete(@prompt)
    current_user.save
  end

  private

  def set_prompt
    @prompt = Prompt.find(params[:prompt_id])
  end
end
