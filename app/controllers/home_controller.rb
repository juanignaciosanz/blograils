class HomeController < ApplicationController
  def index
    @uncommented = Post.uncommented
    @recent = Post.recent

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {:recent => @recent, :uncommented => @uncommented} }
      format.xml { render xml: {:recent => @recent, :uncommented => @uncommented} }
    end
  end
end
