class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :play]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /levels
  def index
    @levels = Level.all
  end

  # GET /levels/1
  def show
    respond_to do |format|
      format.html { render :show }
      format.js   { render plain: @level.code }
    end
  end

  # GET /levels/1/play
  def play
  end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels
  def create
    @level = current_user.levels.new(level_params)

    if @level.save
      redirect_to @level, notice: 'Level was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /levels/
  def update
    if @level.update(level_params)
      redirect_to @level, notice: 'Level was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /levels/1
  def destroy
    @level.destroy
    redirect_to levels_url, notice: 'Level was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_level
    @level = Level.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def level_params
    params.require(:level).permit(:name, :code, :user_id)
  end

  def correct_user
    @level = current_user.levels.find(params[:id])
    redirect_to root_url if @level.nil?
  end
end
