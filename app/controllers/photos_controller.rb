class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({:created_at => :desc})

    render({ :template => "photo_templates/index.html.erb"})
  end

  def details
    photo_id = params.fetch("path_id")
    matching_photos =  Photo.where({ :id => photo_id})

    @the_photo = matching_photos.first
    render({ :template => "photo_templates/details.html.erb"})
  end

  def remove
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.first

    the_photo.destroy

    redirect_to({"photo_templates/index.html.erb"})
  end
end
