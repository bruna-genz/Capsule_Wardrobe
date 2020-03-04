class CombinationsController < ApplicationController
    def new
        @combination = current_user.combinations.build
    end

    def create
        @combination = current_user.combinations.build(combination_params)
        if @combination.valid?
            @combination.save
            redirect_to show_options_path
        else
            flash[:error] = "Your combination must have a name."
            render 'new'
        end
    end

    def show_options
        @posts = current_user.posts.all
    end

    def select_posts(post)
        PostCombination.create(post_id: post.id, combination_id: combination.id)
    end

    private

    def combination_params
        params.require(:combination).permit(:name)
    end
end
