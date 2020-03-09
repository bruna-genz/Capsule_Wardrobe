class PostCombinationsController < ApplicationController
    before_action :find_combination
    
    def new
        PostCombination.create(post_id: params[:post_id], combination_id: params[:combination_id])
        redirect_to @combination
    end

    def destroy
        @post_combination = PostCombination.find_by(post_id: params[:post_id], combination_id: params[:id])
        @post_combination.destroy
        redirect_to @combination
    end

    private
    def find_combination
        @combination = params[:combination_id] ? Combination.find(params[:combination_id]) : Combination.find(params[:id])
    end
end
