class AirdbController < ApplicationController

  def home
        if params[:search]
           @products = Product.search(params[:search]).order("created_at DESC")
         else
           @products = Product.order("created_at DESC")
         end

        if user_signed_in?
          else
            redirect_to new_user_session_path
        end
      end
end
