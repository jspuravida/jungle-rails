class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(name: :asc).all
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to [:admin, :categories], notice: 'Category has been created!'
      else
        render :new
      end
  end

  def new
    @category = Category.new
  end

  def show
    # @categories = Category.new
  end

  def category_params
  params.require(:category).permit(:name)
  end


end

# collecting from Category class, putting as a instance variable name

