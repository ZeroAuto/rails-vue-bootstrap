class Api::FiltersController < Api::ApiController
  def index
    @filters = Filter.all
  end
end