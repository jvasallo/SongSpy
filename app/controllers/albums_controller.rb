class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  def search
    if params[:search_text]
      match_term = "%" + params[:search_text] + "%"
      @albums = Album.where("name like ?", match_term)
    end
  end

  def top
    @albums = Album.top_five_albums
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new
    @artists = Artist.all
    @labels = Label.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end
  
  def add_song_to
    album = Album.find(params[:album_id])
    song = Song.new()
    song.name = params[:name]
    song.save()
    album.songs << song
    
    redirect_to album
  end

  def add_genre_to
    genre = Genre.find(params[:genre_id])
    album = Album.find(params[:album_id])

    album.genres << genre
    
    redirect_to album    
  end

  def add_producer_to
    producer = Producer.find(params[:producer_id])
    album = Album.find(params[:album_id])
    
    album.producers << producer
    
    redirect_to album
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
    @artists = Artist.all
    @labels = Label.all

  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])
    @artists = Artist.all
    @labels = Label.all

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
   
    respond_to do |format|
      # format.html { redirect_to albums_url }
      format.js # destroy.js.erb
      format.json { head :no_content }
    end
  end
end
