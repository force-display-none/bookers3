class StaticPagesController < ApplicationController
    def top
      redirect_to user_path(current_user) if user_signed_in?
    end

    def about
    end

end
