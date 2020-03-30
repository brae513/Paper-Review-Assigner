class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || professor_path
    end
    def after_sign_un_path_for(resource)
      stored_location_for(resource) || professor_path
    end
end