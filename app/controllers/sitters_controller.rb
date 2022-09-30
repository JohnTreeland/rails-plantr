class SittersController < ApplicationController
  before_action :set_sitter, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @sitters = Sitter.all
  end

  def my_sitters
    @sitters = Sitter.where(user: current_user)
  end

  def show; end

  def new
    @sitter = Sitter.new
    @user = current_user
  end

  def create
    @sitter = Sitter.new(sitter_params)
    @sitter.user = current_user
    if @sitter.save
      redirect_to sitters_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @sitter.update(sitter_params)
    if @sitter.save
      redirect_to user_sitter_path(@sitter)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sitter.destroy
    # borrar las booking de este sitter
  end

  private

  def set_sitter
    @sitter = Sitter.find(params[:id])
  end

  def sitter_params
    params.require(:sitter).permit(:end_date, :start_date)
  end
end
