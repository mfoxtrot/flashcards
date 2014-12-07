class CardsController < ApplicationController
  before_action :current_card, only: [:destroy, :edit, :update, :show]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.save
    redirect_to cards_path
  end

  def destroy
    @card.delete
    redirect_to cards_path
  end

  def edit
  end

  def update
    @card.update(card_params)
    @card.save
    redirect_to cards_path
  end

  def show
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end

  def current_card
    @card = Card.find(params[:id])
  end
end
