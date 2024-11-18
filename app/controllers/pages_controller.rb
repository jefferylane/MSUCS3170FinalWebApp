class PagesController < ApplicationController
  def home
    @assets = Asset.all  # Get all assets
  end
end
