class CardsController < ApplicationController
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
    @card = Card.find(params[:id])
    @card.delete
    redirect_to cards_path
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.original_text = card_params[:original_text]
    @card.translated_text = card_params[:translated_text]
    @card.review_date = card_params[:review_date]
    @card.save
    redirect_to cards_path
  end

  def show
    @card = Card.find(params[:id])
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
