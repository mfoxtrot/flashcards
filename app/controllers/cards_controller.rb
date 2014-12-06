class CardsController < ApplicationController
  def list
    @AllCards=Cards.all
  end
end
