class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @tag = Tag.new
    @tag_all = Tag.all
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)
    redirect_to admin_tags_path
  end
  
  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admin_tags_path
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:tag)
  end
end
