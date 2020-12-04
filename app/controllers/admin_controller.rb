class AdminController < ApplicationController
  def panel
    @requests = Request.all
  end

  def index
  end
end
