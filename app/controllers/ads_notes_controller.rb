class AdsNotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_ad, only: [:create, :update]

  def show
  end

  def edit
  end

  def create
    @ad.notes.create(note_params.merge(user_id: User.first.id))
    redirect_to ad_path(@ad)
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_ad
      @ad = Ad.find(params[:ad_id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:ad_id, :body)
    end
end
