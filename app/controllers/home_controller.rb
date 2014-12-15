class HomeController < ApplicationController

  def index
    @card = Card.unreviewed.first
  end

  def test
    @card = Card.find(params[:id])
    if @card.check_translation(params[:answer])
      flash[:notice] = "Правильно"
    else
      flash[:notice] = "Не правильно"
    end
  end
end
