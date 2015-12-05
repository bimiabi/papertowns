class AirdbController < ApplicationController

  def home
          if user_signed_in? && user_role = 'Director'


          else
            redirect_to new_user_session_path

        end
      end

end
