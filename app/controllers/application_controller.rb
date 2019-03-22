class ApplicationController < ActionController::Base
    include DeviseWhitelist

    def authenticate!
        unless current_user
            redirect_to home_path
        end
    end
end
