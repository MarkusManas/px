class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    def after_sign_in_path_for(resource)
        if current_user.role == 'super_admin'
            rails_admin_path
        elsif current_user.role == 'admin'
            new_user_path
        else
            users_path
        end
    end
end
