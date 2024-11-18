class AssetsController < ApplicationController
    # This will apply the authentication check before the 'new' and 'create' actions
    before_action :authenticate_user!, only: [:new, :create]

    #GET /assets/new
    def new
        @asset = Asset.new
    end

     # POST /assets
    def create
        @asset = current_user.assets.build(asset_params)
        if @asset.save
            redirect_to @asset, notice: 'Asset was successfully uploaded.'
        else
            render :new
        end
    end

    # GET /assets/:id
    def show
        @asset = Asset.find(params[:id])
    end

    private

    def asset_params
        params.require(:asset).permit(:name, :description, :file)
    end
end
