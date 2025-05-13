class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: @category
  end

  def create
    category_params = params.require(:category).permit(:name, :monthly_budget)
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find_by(id: params[:id])

    if category
      if category.update(category_params) # Using strong parameters to whitelist allowed fields
        render json: { message: 'Category updated successfully', category: category }, status: :ok
      else
        render json: { error: 'Failed to update Category', details: category.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Category not found' }, status: :not_found
    end
  end

  def destroy
    category = Category.find_by(id: params[:id])

    if category
      category.destroy
      render json: { message: 'Category deleted successfully' }, status: :ok
    else
      render json: { error: 'Category not found' }, status: :not_found
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :monthly_budget)
  end
end

