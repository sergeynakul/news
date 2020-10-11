class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def index
    @articles = if current_user
                  Article.published.includes([:rich_text_content])
                else
                  Article.published.public_visible.includes([:rich_text_content])
                end
  end

  def show
    return if current_user

    redirect_to root_path, alert: 'You are not athorized to view this page.' if @article.visibility == 'private'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
