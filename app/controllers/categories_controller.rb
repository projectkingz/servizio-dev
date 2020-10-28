class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
    @category = Category.find(params[:id])
    @category_listings = @category.listings.paginate(page: params[:page], per_page: 5)
    @listing = Listing.all
  end

  def new
    @category = Category.new
  end

  def edit

  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      flash[:alert] = "Category not created !"
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category name was successfully updated"
      redirect_to edit_category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Successfully deleted"
      redirect_to category_url
    else
      redirect_to category_url
    end
  end



private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params

  end

  def require_admin
    if authenticate_admin!
    else
      flash[:danger] = "Only admin users can perform that action"
      redirect_to categories_url
    end
  end
end
