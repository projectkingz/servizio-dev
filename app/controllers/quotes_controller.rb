class QuotesController < ApplicationController
  before_action :authenticate_user!

      def create
        listing = Listing.find(params[:listing_id])

        if (listing)
          charge(listing)
        else
          flash[:alert] = "Price is incorrect"
        end

        redirect_to request.referrer
      end

      def client_quotes
        @listing = current_user.listing
        @quotes = current_user.client_quotes
      end

      def supplier_quotes
        #@listings = current_trade.listings
        @quotes = current_trade.supplier_quotes
      end

      private

      def listing_params
          params.require(:listing).permit(:title, :video, :description, :active, :category_id, :budget, :urgency_id, :listing_id, :status)
      end

      def charge(listing)
        quote = listing.quotes.new
        quote.complete_by_date = Date.today()
        quote.booking_date = Date.today()
        quote.quote_expiry = Date.today()
        quote.title = listing.title
        quote.client_name = listing.user.username
        quote.client_id = listing.user.id
        quote.supplier_name = current_trade.username
        quote.supplier_id = current_trade.id

        if quote.save
          flash[:notice] ="Your quote has been saved for review"
        else
          flash[:alert] = quote.errors.full_messages.join(', ')
        end
      end
  end
