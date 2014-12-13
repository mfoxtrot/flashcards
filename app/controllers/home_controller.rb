class HomeController < ApplicationController

  def index
    if params[:card_id]
      @card=Card.find(params[:card_id])
      if @card.check_translation(params[:answer])
        flash[:notice] = "Правильно"
      else
        flash[:notice] = "Не правильно"
      end
    end

    @card = Card.unreviewed.first
  end
end
