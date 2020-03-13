class CategoriesController < ApplicationController
    before_action :get_category_by_id, only: [:edit, :update, :destroy]
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

    def edit
    end

    def update
        if @category.update_attributes(category_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def destroy
        @category.destroy
        redirect_to posts_path
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

    def get_category_by_id
        @category = Category.find(params[:id])
    end
end
