class ThreeDFilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_three_d_file, only: [:show, :update, :destroy]
  before_action :check_authorization, only: [:update, :destroy]

  def index
    @three_d_files = ThreeDFile.all
  end

  def new
    @three_d_file = current_user.three_d_files.build
  end

  def create
    @three_d_file = current_user.three_d_files.build(three_d_file_params)
    if @three_d_file.save
      redirect_to @three_d_file, notice: '3D file was successfully uploaded.'
    else
      render :new
    end
  end

  def show
  end

  def update
    if @three_d_file.update(three_d_file_params)
      redirect_to @three_d_file, notice: '3D file was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @three_d_file.destroy
    redirect_to three_d_files_path, notice: '3D file was successfully deleted.'
  end

  private

  def set_three_d_file
    @three_d_file = ThreeDFile.find(params[:id])
  end

  def check_authorization
    unless @three_d_file.user == current_user
      redirect_to root_path, alert: 'Not authorized'
    end
  end

  def three_d_file_params
    params.require(:three_d_file).permit(:name, :file)
  end
end
