class ListingsController < ApplicationController

    protect_from_forgery except: [:upload_photo]
    before_action :authenticate_user!, except: [:show]
    before_action :set_listing, except: [:new, :create, :index, :client_listings]
    before_action :set_step, only: [:update, :edit]
    before_action :is_authorised, only: [:edit, :update, :upload_photo, :delete_photo]
    before_action :set_category, only: [:new, :edit, :show]


    def new
        @listing = current_user.listings.build
        @categories = Category.all
        @urgencies = Urgency.all
    end

    def create
      @listing = current_user.listings.build(listing_params)

      if @listing.save
        redirect_to edit_listing_path(@listing), notice: "Saved..."
      else
        redirect_to request.referrer , flash: { error: @listing.errors.full_messages.to_sentence }
      end
    end

    def edit
      @urgencies = Urgency.all

      @listing = Listing.find(params[:id])
      #@category = Category.find(params[:id])

      @listing_category = @listing.category
    end

    def update

      @listing = Listing.find(params[:id])
      #@category = Category.find(params[:id])
      @urgencies = Urgency.all

      if @step == 2
      end

      if @step == 3 && listing_params[:description].blank?
        return redirect_to request.referrer, flash: {error: "Description cannot be blank"}
      end

      if @step == 4 && @listing.photos.blank?
        return redirect_to request.referrer, flash: {error: "You don't have any photos"}
      end

      if @step == 5
            if @listing[:title].blank? || @listing[:urgency_id].blank?
              return redirect_to edit_listing_path(@listing, step: 2), flash: {error: "Invalid pricing"}
      end


        if @listing.description.blank?
          return redirect_to edit_listing_path(@listing, step: 3), flash: {error: "Description cannot be blank"}
        elsif @listing.photos.blank?
          return redirect_to edit_listing_path(@listing, step: 4), flash: {error: "You don't have any photos"}
        end
      end

      if @listing.update(listing_params)
        flash[:notice] = "Saved..."
      else
        return redirect_to request.referrer, flash: {error: @listing.errors.full_messages}
      end

      if @step < 5
        redirect_to edit_listing_path(@listing, step: @step + 1)
      else
        redirect_to users_dashboard_path
      end
    end

    def show
      @listing = Listing.find(params[:id])
      @listing_category = @listing.category
      @urgencies = Urgency.all
    end

    def index
      @listings = Listing.paginate(page: params[:page], per_page: 10)
    end

    def client_listings
      @listings = current_user.listings.paginate(page: params[:page], per_page: 10)
    end

    def upload_photo
      @listing.photos.attach(params[:file])
      render json: { success: true}
    end


    def delete_photo
      @image = ActiveStorage::Attachment.find(params[:photo_id])
      @image.purge
      redirect_to edit_listing_path(@listing, step: 4)
    end

    private

    def set_step
      @step = params[:step].to_i > 0 ? params[:step].to_i : 1
      if @step > 5
        @step = 5
      end
    end

    def set_category
      @categories = Category.all
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You do not have permission" unless current_user.id == @listing.client_id
    end

    def listing_params
        params.require(:listing).permit(:title, :video, :description, :active, :category_id, :budget, :urgency_id, :status, :expiry_date)
    end

    def category_params
      params.require(:category).permit(:name)
    end

  end
