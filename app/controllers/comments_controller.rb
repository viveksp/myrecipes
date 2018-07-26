class CommentsController < ApplicationController
    
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.build(comment_params)
        @comment.chef = current_chef
        
        if @comment.save
            flash[:success] = "Comment was created successfully"
            redirect_to  recipe_path(@recipe)
        else
            flash[:danger] = "Comment was not created"
           # render 'recipes/show' wont work
            # we are rendering show. But @commments will be empty If we had rendered comments,  @comments would be available 
            redirect_to :back
        end
        
        
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:description)
    end

end