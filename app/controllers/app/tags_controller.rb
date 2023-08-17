module App
    class TagsController < ApplicationController
        before_action :guest
        before_action :set_tag, only: [:show, :edit, :update, :destroy]
        
        def index
            @tags = Tag.order(id: :desc)
        end

        def new
            @tag = Tag.new
        end

        def create
            @tag = Tag.new(tag_params)
            if @tag.save
                redirect_to new_app_tag_path, success: "Tag is added successfully !!"
            end
        end

        def show
        end

        def edit
        end

        def update
            @tag.update(tag_params)
            redirect_to edit_app_tag_path, success: "Tag is updated successfully !!"
        end

        def destroy
            @tag.destroy
            redirect_to app_tags_path
        end
        
        private

        def tag_params
            params.require(:tag).permit(:name)
        end

        def set_tag
            @tag = Tag.find(params[:id])
        end
    end
end