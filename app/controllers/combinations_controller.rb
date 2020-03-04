class CombinationsController < ApplicationController
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
        @combination = Combination.find(params[:id])
        @items = @combination.posts.all
    end

    def index
        @combinations = current_user.combinations.all
    end

    def show_options
        @posts = current_user.posts.all
    end

    def select_posts
        PostCombination.create(post_id: params[:post_id], combination_id: params[:combination_id])
    end

    private

    def combination_params
        params.require(:combination).permit(:name)
    end
end
