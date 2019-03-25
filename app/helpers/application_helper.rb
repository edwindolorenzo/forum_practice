module ApplicationHelper
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
