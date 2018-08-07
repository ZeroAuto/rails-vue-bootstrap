class Api::FiltersController < Api::ApiController
  def index
    @filters = Filter.all
  end
  
  def create
    respond_to do |format|
      format.html {render text: "Your data was sucessfully loaded. Thanks"}
      format.json { 
                   User.create(fields: params[:fields])
                  }
    end
  end
end