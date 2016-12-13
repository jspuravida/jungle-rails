require 'rails_helper'

describe Product, type: :model do
# Testing a product that meets all requirements
  it 'should save a new product' do
    @category = Category.create! name: 'Apparel'
    @product = Product.new(
      name: 'shirt',
      price: 50,
      quantity: 8)
    @product.category = @category
    @product.valid?
    expect(@product.errors.size).to eql(0)
  end

  describe 'Validations' do

    before(:each) do
      @category = Category.create! name: 'Apparel'
    end

# Testing the name validation for a product
    it 'should give an error if name is missing' do
      @product = Product.new()
      @product.category = @category
      @product.name = ""
      @product.valid?
      expect(@product.errors[:name]).to include("can't be blank")
    end

# Testing the price validation for a product
    it 'should give an error if price is missing' do
      @product = Product.new(
        name: 'taco',
        price: '',
        quantity: 100)
      @product.category = @category
      @product.valid?
      expect(@product.errors[:price]).to include("is not a number")
    end

# Testing the quantity validation for a product
    it 'should give an error if quantity is missing' do
      @product = Product.new(
        name: 'taco',
        price: 50,
        quantity: '')
      @product.category = @category
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

# Testing the category validation for a product
    it 'should give an error if category is missing' do
      @category = Category.create! name: 'Apparel'
      @product = Product.new(
        name: 'taco',
        price: 50,
        quantity: 100)
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end

