class ApplicationController < ActionController::Base
    # include DeviseWhitelist
    # before_action :authenticate!
    def authenticate!
        unless current_user
            redirect_to root_path
        end
    end
end
