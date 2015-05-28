class HomeController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    #sending nothing
  end
end