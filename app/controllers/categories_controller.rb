class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.valid?
            @category.save
            redirect_to posts_path
        else
            flash[:error] = "Your category must have a name."
            render 'new'
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to posts_path
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
