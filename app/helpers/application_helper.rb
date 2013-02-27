module ApplicationHelper
 def display_photo(item)
    if item.has_photo?
      image_tag item.photo_path
    else
       "No photo."
    end
  end
end
