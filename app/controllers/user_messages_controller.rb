class UserMessagesController < ApplicationController
  before_action :set_user_message, only: [:show, :edit, :update, :destroy]

  # GET /user_messages
  def index
    @user_messages = UserMessage.all
  end

  # GET /user_messages/1
  def show
  end

  # GET /user_messages/new
  def new
    @user_message = UserMessage.new
  end

  # GET /user_messages/1/edit
  def edit
  end

  # POST /user_messages
  def create
    @user_message = UserMessage.new(user_message_params)

    if @user_message.save
      redirect_to @user_message, notice: 'User message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_messages/1
  def update
    if @user_message.update(user_message_params)
      redirect_to @user_message, notice: 'User message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_messages/1
  def destroy
    @user_message.destroy
    redirect_to user_messages_url, notice: 'User message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_message
      @user_message = UserMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_message_params
      params.require(:user_message).permit(:result)
    end
end
