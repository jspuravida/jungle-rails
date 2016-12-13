class ReviewsController < ApplicationController
  before_filter :authorize   #added to restrict all non-admin users

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if ! @review.valid?
      puts "Invalid review"
      puts @review.errors.messages
    end

    if @review.valid?
      @review.save
      puts "Valid review"
      puts @review.errors.messages
    end

# Checking validation errors (reviews are not saving, etc)
# person = Person.new
# person.valid? # => false
# person.errors.messages

    if @review.save
      puts "Review saved"
      redirect_to product_path(@product)
    else
      puts "Review not saved"
      redirect_to '/'
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end