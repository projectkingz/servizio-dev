require 'test_helper'

class CreateJobCategoriesTest < ActionDispatch::IntegrationTest

  test "get new job category form and create job category" do
    get new_job_category_path
    assert_template 'job_categories/new'
    assert_difference 'Job_Category.count', 1 do
      post job_categories_path, params: { job_category: {name: "sports"}}
      follow_redirect!
    end

    assert_template 'job_categories/index'
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    get new_job_category_url
    assert_template 'job_categories/new'
    assert_no_difference 'Job_Category.count' do
      post job_categories_url, params: { job_category: {name: ""}}
    end

    assert_template 'job_categories/new'
    assert_select 'h4.card-title'
    assert_select 'div.card-body'
  end


end
