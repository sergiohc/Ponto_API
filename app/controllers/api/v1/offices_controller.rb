class Api::V1::OfficesController < Api::V1::ApiController

  def index
  end

  def show
  end

  def update
  end

  def create
  end

  def destroy
  end

  private
  def office_params
    params.require(:office).permit(:description)        
  end
  
end
