class GigsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_gig, except: [:new, :create]
  before_action :is_authorised, only: [:edit, :update]

  def new
    @gig = current_user.gigs.build
    @categories = Category.all
    @urgencies = Urgency.all
  end

  def create
    @gig = current_user.gigs.build(gig_params)

    if @gig.save
      redirect_to edit_gig_path(@gig), notice: "Save..."
    else
      redirect_to request.referrer, flash: { error: @gig.errors.full_messages}
    end
  end

  def edit
    @categories = Category.all
    @urgencies = Urgency.all
    @step = params[:step].to_i
  end

  def update
  end

  def show
  end

  private

  def set_gig
    @gig = Gig.find(params[:id])
  end

  def is_authorised
    redirect_to root_path, alert: "You do not have permission" unless current_user.id == @gig.user_id
  end

  def gig_params
    params.require(:gig).permit(:title, :video, :active, :category_id)
  end


end
