class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @sitters = Sitter.first(3)
  end
end
