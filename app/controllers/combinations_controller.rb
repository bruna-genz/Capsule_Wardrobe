class CombinationsController < ApplicationController
    before_action :find_combination, only: [:show, :show_options, :select_posts, :destroy]

    def new
        @combination = current_user.combinations.build
    end

    def create
        @combination = current_user.combinations.build(combination_params)
        if @combination.valid?
            @combination.save
            redirect_to @combination
        else
            flash[:error] = "Your combination must have a name."
            render 'new'
        end
    end

    def show
        @items = @combination.posts.all
    end

    def index
        @combinations = current_user.combinations.all
    end

    def show_options
        @posts = (current_user.posts.all - @combination.posts) | (@combination.posts - current_user.posts.all)
        flash[:notice] = "You don't have any items to add into this combinations."
    end

    def destroy
        @combination.destroy
        redirect_to combinations_path
    end

    private

    def combination_params
        params.require(:combination).permit(:name)
    end

    def find_combination
        @combination = params[:combination_id] ? Combination.find(params[:combination_id]) : Combination.find(params[:id])
    end
end
