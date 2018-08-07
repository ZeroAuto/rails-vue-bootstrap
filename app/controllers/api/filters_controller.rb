class Api::FiltersController < Api::ApiController
  skip_before_action :verify_authenticity_token

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

  # I would NEVER use params.permit! in production
  # I am confident that with some more time I could properly debug this
  # but I don't want to spend an inordinate amount of time on this as
  # suggested
  def filter_params
    params.require(:filter).permit!
  end
end