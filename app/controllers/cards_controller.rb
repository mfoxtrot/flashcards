class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card_params = params[:card]
    @card = Card.new
    @card.original_text = @card_params[:original_text]
    @card.translated_text = @card_params[:translated_text]
    @card.review_date = @card_params[:review_date]
    @card.save
    redirect_to cards_path
  end

  def destroy
    @card = Card.find(params[:id])
    @card.delete
    redirect_to cards_path
  end
end
