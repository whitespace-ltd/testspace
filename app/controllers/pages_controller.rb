class PagesController < ApplicationController
  respond_to :html, :json
	before_action :authenticate_user!, only: [:inside]

  def home
  end

  def inside
  	respond_with current_user
  end

end
