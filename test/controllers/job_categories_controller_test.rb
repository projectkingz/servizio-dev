require 'test_helper'
require 'rails_helper'
require 'spec_helper'
require 'rspec/rails'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @Category = Category.create(name: "sports")
    user = FactoryGirl.create(:user)
    #@user = User.create(username: "thabani", email: "drthabani@hotmail.com", password: "password")
  end

  test "should get categories index" do
     get categories_url
    assert_response :success
  end

  test "should get new" do
    user = FactoryGirl.create(:user)
    get root_path(user)
    get new_Category_url
    assert_response :success
  end

  test "should get show" do
    get Category_url(@Category)
    assert_response :success
  end

  test "should redirect create when user is not logged in" do
    assert_no_difference 'Category.count' do

    post categories_url, params: {Category: {name: "sports"}}
    end
    #assert_redirected_to categories_url
  end
end
