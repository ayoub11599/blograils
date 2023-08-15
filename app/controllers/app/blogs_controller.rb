module App
    class BlogsController < ApplicationController
        before_action :guest
        before_action :set_blog, only: [:show, :edit, :update]

        def index
            @blogs = Blog.eager_load(:category).all
        end

        def new
            @blog = Blog.new
        end

        def create
            @blog = Blog.new(blog_params)
            if @blog.save
                redirect_to new_app_blog_path, success: "Le blog est créé avec succès !!"
            else
                render new, status: :unprocessable_entity
            end
        end

        def show
        end

        def edit
        end

        def update
            @blog.update(blog_params)
            redirect_to edit_app_blog_path, success: "Le blog est modifié avec succès !!"
        end

        def destroy
            Blog.destroy(params[:id])
            redirect_to app_blogs_path, status: :see_other
        end

        private

        def blog_params
            params.require(:blog).permit(:title, :content, :category_id)
        end

        def set_blog
            @blog = Blog.find(params[:id])
        end
    end
end