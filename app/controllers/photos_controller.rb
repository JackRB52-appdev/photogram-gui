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

    redirect_to("/photos")
  end

  def add

  input_image = params.fetch("input_image")
  input_caption = params.fetch("input_caption")
  input_owner_id = params.fetch("input_owner_id")

  a_new_photo = Photo.new
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id})

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    the_photo = matching_photos.first

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def comment
    
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_comment")
    
    new_comment = Comment.new
    new_comment.photo_id = input_photo_id
    new_comment.author_id = input_author_id
    new_comment.body = input_body

    new_comment.save

    redirect_to("/photos/" + input_photo_id.to_s)

  end
end
