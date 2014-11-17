class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, notice: 'Success! You have just written a new note!' 
    else
      render :new 
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  private
    def note_params
      params.require(:note).permit(:title, :content)
    end
  
end
