class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.includes([:rich_text_content])
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params.merge(admin_id: current_user.id))

    if @article.save
      redirect_to admin_article_path(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :visibility, :published)
  end
end
