class CategoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@category = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
		else
			render action: 'new'
		end

	end

	def show
		@category = Category.find(params[:id])
		@articles = @category.articles
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to categories_path
			
		else
			render action: 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	
	private

	def category_params
		params[:category].permit(:name,:description)
	end

end
