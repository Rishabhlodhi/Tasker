class CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
        @category.save
        redirect_to '/tasks', alert: "Category created!"
    end

    def show
      @category = Category.find(params[:id])
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      respond_to do|format|
        format.js
       redirect_to categories_path
      end
    end


  private
    def category_params
        #params.require(:category).permit(:name)
        params.permit(:name)
    end

end