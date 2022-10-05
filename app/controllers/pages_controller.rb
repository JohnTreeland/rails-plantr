class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @sitters = Sitter.where(city: params[:query])
    else
      @sitters = Sitter.all
    end
  end
end
