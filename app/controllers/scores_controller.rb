class ScoresController < ApplicationController
  before_action :set_scores
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET levels/1/scores
  def index
    @scores = @level.scores
  end

  # GET levels/1/scores/1
  def show
  end

  # GET levels/1/scores/new
  def new
    @score = @level.scores.build
  end

  # GET levels/1/scores/1/edit
  def edit
  end

  # POST levels/1/scores
  def create
    @score = @level.scores.build(score_params)

    if @score.save
      redirect_to([@score.level, @score], notice: 'Score was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT levels/1/scores/1
  def update
    if @score.update_attributes(score_params)
      redirect_to([@score.level, @score], notice: 'Score was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE levels/1/scores/1
  def destroy
    @score.destroy

    redirect_to level_scores_url(@level)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scores
      @level = Level.find(params[:level_id])
    end

    def set_score
      @score = @level.scores.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:value, :level_id, :user_id)
    end
end
