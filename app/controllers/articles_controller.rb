class ArticlesController < ApplicationController
    before_action :set_article_params, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
        # @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        # @article = Article.find(params[:id])
    end

    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to root_path
    end

    private

    def set_article_params
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :subtitle, :body)
    end
end
