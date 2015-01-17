class HomeController < ApplicationController

  def index
    @card = current_user.cards.unreviewed.first
  end

  def check_translation
    @card = Card.find(params[:id])
    if @card.check_translation(params[:answer])
      flash[:notice] = "Правильно"
    else
      flash[:notice] = "Не правильно"
    end
    redirect_to root_path
  end
end
