class CardsController < ApplicationController

  before_action :find_card, only: [:destroy, :edit, :update, :show]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    if Card.create(card_params)
      redirect_to cards_path
    else
      render "new"
    end
  end

  def destroy
    @card.delete
    redirect_to cards_path
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render "edit"
    end
  end

  def show
  end

  def find_card
    @card = Card.find(params[:id])
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :user_id)
  end
end
