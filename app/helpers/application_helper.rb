module ApplicationHelper
    include Pagy::Frontend
    def image_generator
        "https://via.placeholder.com/150"
    end

    def profile_img img
        if img
            img
        else 
            image_generator
        end
    end
end
