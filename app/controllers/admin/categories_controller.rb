class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(name: :asc).all
  end
# collecting from Category class, putting as a instance variable name
  def create
    @category = Category.new
  end

end
