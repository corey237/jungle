require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'validations' do
    it "Returns no error when all data is valid" do
      category = Category.new
      category.name = "Category A"
      category.save
      product = Product.new
      product.name = "Plant A"
      product.price = 1000
      product.quantity = 30
      product.category = category
      product.save
      expect(product).to be_valid
      expect(product.errors.full_messages).to be_empty
    end
    it "Returns an error when the name is blank" do
      category = Category.new
      category.name = "Category A"
      category.save
      product = Product.new
      product.price = 1000
      product.quantity = 30
      product.category = category
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it "Returns an error when the price is blank" do
      category = Category.new
      category.name = "Category A"
      category.save
      product = Product.new
      product.name = "Plant A"
      product.quantity = 30
      product.category = category
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it "Returns an error when the quantity is blank" do
      category = Category.new
      category.name = "Category A"
      category.save
      product = Product.new
      product.name = "Plant A"
      product.price = 1000
      product.category = category
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "Returns an error when the category is blank" do
      category = Category.new
      category.name = "Category A"
      category.save
      product = Product.new
      product.name = "Plant A"
      product.price = 1000
      product.quantity = 30
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end

end
