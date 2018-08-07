class Api::PlayersController < Api::ApiController
  def index
    @players = Player.all
  end
end

