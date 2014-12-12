class HomeController < ApplicationController

  def index
    if params[:card_id]
      if Card.find(params[:card_id]).check_translation?(params[:answer])
        flash[:notice] = "Правильно"
      else
        flash[:notice] = "Не правильно"
      end
    end

    @card = Card.unreviewed_recently.random
  end
end
