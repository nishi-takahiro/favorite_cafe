class Admin::HomesController < ApplicationController
  def top
    @articles = Article.all
  end
end
