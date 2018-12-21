class Api::V1::TeamsController < Api::V1::ApiController

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
  def Team_params
    params.require(:Team_params).permit(:description)        
  end
end
