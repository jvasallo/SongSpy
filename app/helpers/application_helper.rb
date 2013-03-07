module ApplicationHelper
 def display_photo(item)
    if item.has_photo?
      image_tag item.photo_path, :width => "100px"
    else
       "No photo."
    end
  end
end
