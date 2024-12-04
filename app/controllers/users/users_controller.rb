module Users
  class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:show]

    def show
      @user = User.find(params[:id])
      @three_d_file = @user.three_d_files.find_by(id: params[:three_d_file_id])
      @file_size = @three_d_file.file.blob.byte_size if @three_d_file
      @file_type = @three_d_file.file.blob.content_type if @three_d_file
    end
  end
end