class QuestsController < ApplicationController
  before_action :set_quest, only: %i[ show edit update destroy ]

  def index
    @quests = Quest.order(created_at: :desc)
    @total_quests = Quest.count
    @completed_quests = Quest.where(status: true).count
    @progress_percent = @total_quests.zero? ? 0 : ((@completed_quests.to_f / @total_quests) * 100).round
  end

  def show; end

  def new
    @quest = Quest.new
  end

  def edit; end

  def create
    @quest = Quest.new(quest_params)

    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: "Quest was successfully created." }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to @quest, notice: "Quest was successfully updated." }
        format.json { render json: { status: :ok, data: @quest } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quest.destroy!
    respond_to do |format|
      format.html { redirect_to quests_path, status: :see_other, notice: "Quest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:name, :status)
  end
end
