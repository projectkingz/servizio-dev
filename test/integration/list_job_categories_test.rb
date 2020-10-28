require 'test_helper'

class ListJobCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @job_category = Job_Category.create(name: "books")
    @job_category2 = Job_Category.create(name: "programming")
  end

  test "should show list job categories listing" do
    get job_categories_url
    assert_template 'job_categories/index'
    assert_select "a[href=?]", job_category_path(@job_category), text: @job_category.name
    assert_select "a[href=?]", job_category_path(@job_category2), text: @job_category2.name
  end
end
