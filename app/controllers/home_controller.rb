class HomeController < ApplicationController

  def index
    if params[:card_id]
      if Card.find(params[:card_id]).correct_translation?(params[:answer])
        flash[:notice] = "Правильно"
      else
        flash[:notice] = "Не правильно"
      end
    end

    @card=Card.unreviewed_recently.random_card
  end
end
