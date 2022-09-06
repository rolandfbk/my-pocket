class CategoriesController < ApplicationController
  def index
    @categories = Category.order(created_at: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @payments = @category.payments.order(created_at: :desc).all
    @total_payments = @category.total_payments
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end