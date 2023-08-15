module App
    class CategoriesController < ApplicationController
        before_action :guest
        before_action :set_category, only: [:show, :edit, :update]
        
        def index
            @categories = Category.all
        end
        
        def new
            @category = Category.new
        end

        def create
            @category = Category.new(category_params)
            if @category.save
                redirect_to new_app_category_path, success: "La catégorie est ajoutée avec succès !!"
            else
                render :new, status: :unprocessable_entity
            end
        end

        def show
        end

        def edit
        end

        def update
            @category.update(category_params)
            redirect_to edit_app_category_path, success: "La catégorie est modifiée avec succès !!"
        end

        def destroy
            Category.destroy(params[:id])
            redirect_to app_categories_path, status: :see_other
        end

        private

        def category_params
            params.require(:category).permit(:name)
        end

        def set_category
            @category = Category.find(params[:id])
        end

    end
end