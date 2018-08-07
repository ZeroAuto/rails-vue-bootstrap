class Api::FiltersController < Api::ApiController
  protect_from_forgery with: :null_session

  def index
    @filters = Filter.all
  end
  
  def create
    @filter = Filter.new(filter_params)
    respond_to do |format|
      format.html {render text: "Your data was sucessfully loaded. Thanks"}
      format.json do
        if @filter.save
          render :json => @filter
        else
          render :json => { :errors => @filter.errors.messages }, :status => 422
        end
      end
    end
  end

  private

  def filter_params
    params.require(:filter).permit(:fields)
  end
end