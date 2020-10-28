require 'test_helper'

class Job_CategoryTest < ActiveSupport::TestCase

  def setup
    @job_category = Job_Category.create(name: "sports")
  end

  test "job category should be valid" do
    assert @job_category.valid?
  end

  test "name should be present" do
    @job_category.name = ""
    assert_not @job_category.valid?
  end

  test "name should be unique" do
    @job_category.save
    job_category2 = Job_Category.new(name: "sports")
    assert_not job_category2.valid?
  end

  test "name should not be too long" do
    @job_category.name = "aaaa"
    assert @job_category.valid?
  end


  test "name should not be too short" do
    @job_category.name = "a"
    assert_not @job_category.valid?
  end


end
