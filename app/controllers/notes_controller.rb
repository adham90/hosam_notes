class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy, :done]
  before_action :authenticate_user!

  # GET /notes
  def index
    @notes = current_user.notes

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  def done
    @note.update!(done: true)

    render json: @note
  end

  # POST /notes
  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = current_user.notes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.fetch(:note, {})
    end
end
